import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';


class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          Text('Pair of Linear Equation in Two Variables ',style: AppTextStyle.interRegular.copyWith(
              color: AppColors.c_F2F2F2,fontSize: 20.sp
          ),),
          SizedBox(height: 7.h,),
          Row(children: [
            Text('Matematika/To\'plamlar',style: AppTextStyle.interRegular.copyWith(
              color: AppColors.c_F2F2F2.withOpacity(0.5),fontSize: 16.sp,
            ),),
            Spacer(),
            SvgPicture.asset(AppImages.watch,width: 22.2,height: 22.h,),
            SizedBox(width:7.w,),
            Text('07:34',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c_F2F2F2,fontSize:16.sp,
            ),),
          ],),
          SizedBox(height: 14.getH(),),
          Container(
              height: 8.h,
              decoration: BoxDecoration(
                color: AppColors.c_162023,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.w,
                    decoration: BoxDecoration(
                      color:Colors.greenAccent,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  )
                ],)
          ),
        ],
      ),
    );
  }
}
