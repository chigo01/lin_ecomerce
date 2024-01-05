import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lon_stores/src/config/routes/app_router.dart';
import 'package:lon_stores/src/config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
      // child: DevicePreview(
      //     enabled: !kReleaseMode,
      //     builder: (context) => const MyApp() // Wrap your app
      //     ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //    locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.lightTheme(context),
      routerConfig: appRouter.config(),
    );
  }
}
