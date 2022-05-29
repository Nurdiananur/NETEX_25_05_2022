
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netex25_05_2022/src/module/screen/splash_screen.dart';
import 'package:netex25_05_2022/src/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,

      ],
      builder: (context) => const Cargo(),
    ),
  );
}

class Cargo extends StatelessWidget {
  const Cargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 855),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {

          {
            return MaterialApp(
              theme: AppTheme.themeData,
              debugShowCheckedModeBanner: false,

              home: SplashPage(),
            );
          }
        }
    );

  }
}