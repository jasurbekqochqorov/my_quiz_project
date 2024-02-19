import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';


class Information extends StatefulWidget {
  const Information({super.key, required this.subjectModel, required this.progressValue, required this.title});
  final SubjectModel subjectModel;
  final double progressValue;
  final String title;

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.subjectModel.subjectName} fanidan hamma testlar siz uchun',style: AppTextStyle.interRegular.copyWith(
              color: AppColors.c_F2F2F2,fontSize: 20.sp
          ),),
          SizedBox(height: 7.h,),
          Row(children: [
            Text(widget.subjectModel.subjectName,style: AppTextStyle.interRegular.copyWith(
              color: AppColors.c_F2F2F2.withOpacity(0.5),fontSize: 16.sp,
            ),),
            Spacer(),
            SvgPicture.asset(AppImages.watch,width: 22.2,height: 22.h,),
            SizedBox(width:7.w,),
            Text(widget.title,style: AppTextStyle.interMedium.copyWith(
              color: AppColors.c_F2F2F2,fontSize:16.sp,
            ),),
          ],),
          SizedBox(height: 14.getH(),),
          LinearProgressIndicator(
            value:widget.progressValue,
            minHeight: 8.h,
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.c_27AE60,
            backgroundColor: AppColors.c_162023,
          ),

        ],
      ),
    );
  }
}
