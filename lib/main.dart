import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/splash_screen/splash_screen.dart';
import 'package:homework12/Screen/subject_screen/subject_screen.dart';
import 'package:homework12/Screen/subject_screen/widet/subject_item.dart';
import 'package:homework12/utils/color/color.dart';

import 'Screen/start_quiz/main_screen.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390,844),
      builder: (context,child){
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor:AppColors.c_273032,elevation: 0
            ),
            scaffoldBackgroundColor: AppColors.c_273032
          ),
          home: child,
          debugShowCheckedModeBanner: false,
        );
      },
      child: const SplashScreen(),
    );
  }
}
