import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1,color: AppColors.c_2F3739)
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: Text(title,style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.c_F2F2F2,fontSize: 20.sp
        ),),
      ),
    );
  }
}
