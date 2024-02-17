import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/subject_models.dart';
import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class ButtonDown extends StatelessWidget {
  const ButtonDown({super.key, required this.onNext, required this.onPrevious, required this.subjectModel, required this.activeIndex, });
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final SubjectModel subjectModel;
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Visibility(
        visible:(activeIndex>0),
        child: TextButton(
          style:TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 21.w,vertical: 12.h),
              backgroundColor: AppColors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              )
          ),
          onPressed:onPrevious,
          child: Text('Previous',style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c_F2F2F2,fontSize: 16.sp
          ),),
        ),
      ),
      Spacer(),
      Visibility(
        visible:activeIndex<subjectModel.questions.length-1,
        child: TextButton(
          style:TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 21.w,vertical: 12.h),
              backgroundColor: AppColors.c_F2954D,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              )
          ),
          onPressed:onNext,
          child: Text('Next',style: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.c_F2F2F2,fontSize: 16.sp
          ),),
        ),
      ),
    ],);
  }
}
