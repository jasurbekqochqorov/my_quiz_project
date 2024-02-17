import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/icons/icon.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key, required this.color});
  final Color color;
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
          Text('12m 20sec'),
          Text('total time')
        ],),
    );
  }
}
