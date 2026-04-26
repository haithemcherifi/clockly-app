import 'package:clockly_app/features/adhan%20settings/manager/cubit/adhan_settings_cubit.dart';
import 'package:clockly_app/features/alarm%20management/manager/cubit/alarm_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/cubit/location_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/,manager/cubit/nav_cubit.dart';
import 'package:clockly_app/features/main/presentation/view/main_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavCubit()),
          BlocProvider(create: (context) => AlarmCubit()),
          BlocProvider(create: (context) => LocationCubit()),
          BlocProvider(create: (context) => AdhanSettingsCubit()),
        ],
        child: MyApp(),
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}
