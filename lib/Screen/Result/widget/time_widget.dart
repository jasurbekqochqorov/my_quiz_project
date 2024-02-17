import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';
import '../../../utils/icons/icon.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key, required this.color, required this.time, required this.title});
  final Color color;
  final String time;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color:color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(AppImages.watch),
          SizedBox(height: 10.getH(),),
          Text(time,style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.c_F2F2F2,fontSize: 16.sp
          ),),
          Text(title,style: AppTextStyle.interMedium.copyWith(
            color: AppColors.c_F2F2F2,fontSize: 12.sp
          ),)
        ],),
    );
  }
}
