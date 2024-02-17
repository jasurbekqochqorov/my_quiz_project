import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../../utils/color/color.dart';


class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key, required this.result, required this.title, required this.color});
  final String  result;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h,),
      decoration: BoxDecoration(
        color:color,
        borderRadius:BorderRadius.circular(16.r),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(result,style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.c_F2F2F2,fontSize:20.sp
          ),),
          SizedBox(height: 10.h,),
          Text(title,style: AppTextStyle.interMedium.copyWith(
            color: AppColors.c_F2F2F2,fontSize: 15.sp
          ),),
        ],),
    );
  }
}
