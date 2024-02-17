import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key, required this.title, required this.color, this.isVisible=false});
  final String title;
  final Color color;
  final bool? isVisible;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1,color: AppColors.c_2F3739)
      ),
      padding: EdgeInsets.symmetric(vertical:10.h),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Visibility(
              visible: isVisible!,
              child: SvgPicture.asset(AppImages.again,width: 24.w,height: 24.h,)),
          SizedBox(width: 5.w,),
          Text(title,style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c_F2F2F2,fontSize: 20.sp
          ),),
        ],)
      ),
    );
  }
}
