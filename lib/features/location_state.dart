class LocationState {
  final bool isLoading;
  final bool hasPermission;
  final String locationText;
  final double? latitude;
  final double? longitude;
  final String? errorMessage;

  const LocationState({
    required this.isLoading,
    required this.hasPermission,
    required this.locationText,
    required this.latitude,
    required this.longitude,
    required this.errorMessage,
  });

  factory LocationState.initial() {
    return const LocationState(
      isLoading: false,
      hasPermission: false,
      locationText: 'Unknown location',
      latitude: null,
      longitude: null,
      errorMessage: null,
    );
  }

  LocationState copyWith({
    bool? isLoading,
    bool? hasPermission,
    String? locationText,
    double? latitude,
    double? longitude,
    String? errorMessage,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      hasPermission: hasPermission ?? this.hasPermission,
      locationText: locationText ?? this.locationText,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      errorMessage: errorMessage,
    );
  }
}
