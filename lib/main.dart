// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:web_app/view/sign_up/presentation/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize database factory for cross-platform
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  // (Android, iOS, macOS use sqflite directly)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SignUpScreen(),
          builder: (context, widget) {
            return ResponsiveBreakpoints.builder(
              child: widget!,
              breakpoints: const [
                Breakpoint(start: 0, end: 450, name: MOBILE),
                Breakpoint(start: 451, end: 800, name: TABLET),
                Breakpoint(start: 801, end: 1920, name: DESKTOP),
              ],
            );
          },
        );
      },
    );
  }
}
