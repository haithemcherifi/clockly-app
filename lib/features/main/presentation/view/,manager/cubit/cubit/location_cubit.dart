import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState.initial());

  Future<void> requestAndFetchLocation() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
          state.copyWith(
            isLoading: false,
            hasPermission: false,
            errorMessage: 'Location service is disabled',
          ),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        emit(
          state.copyWith(
            isLoading: false,
            hasPermission: false,
            errorMessage: 'Location permission denied',
          ),
        );
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
            isLoading: false,
            hasPermission: false,
            errorMessage: 'Location permission permanently denied',
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final place = placemarks.first;

      final city = place.locality?.trim().isNotEmpty == true
          ? place.locality!
          : place.subAdministrativeArea?.trim().isNotEmpty == true
          ? place.subAdministrativeArea!
          : 'Unknown city';

      final country = place.country ?? 'Unknown country';

      emit(
        state.copyWith(
          isLoading: false,
          hasPermission: true,
          locationText: '$city, $country',
          latitude: position.latitude,
          longitude: position.longitude,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          hasPermission: false,
          errorMessage: 'Failed to get location',
        ),
      );
    }
  }
}
