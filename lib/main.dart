import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/splash_screen/splash_screen.dart';
import 'package:homework12/Screen/widget/subject_item.dart';
import 'package:homework12/utils/color/color.dart';

import 'Screen/main_screen.dart';

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
            scaffoldBackgroundColor: AppColors.c_273032
          ),
          home: child,
          debugShowCheckedModeBanner: false,
        );
      },
      child: const SubjectItem(),
    );
  }
}
