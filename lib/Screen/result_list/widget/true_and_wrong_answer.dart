import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';

class TrueAndWrong extends StatelessWidget {
  const TrueAndWrong({super.key, required this.color, required this.title});
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 32.w,vertical:5.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color:color,
        ),
        child: Center(child: Text(title,style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.c_F2F2F2,fontSize: 15.sp
        ),)),
      ),);
  }
}
