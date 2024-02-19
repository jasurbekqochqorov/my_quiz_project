import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/models/quiz_models.dart';
import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class QuestionsButton extends StatefulWidget {
  const QuestionsButton({super.key, required this.questionVariant, required this.variant, required this.onTap, required this.isActive,});
  final String questionVariant;
  final String variant;
  final VoidCallback onTap;
  final bool isActive;
  @override
  State<QuestionsButton> createState() => _QuestionsButtonState();
}

class _QuestionsButtonState extends State<QuestionsButton> {

  @override
  void initState() {
   // _check();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.only(
                  left: 10.w,top: 13.h,bottom: 13.h,right: 10.w
              ),
               backgroundColor:(widget.isActive)?AppColors.c_F2954D:AppColors.c_273032,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              )
          ),
          onPressed:widget.onTap,
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Text(widget.questionVariant,style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.c_F2F2F2,fontSize: 15.sp
              ),),
              Expanded(
                child: Text(widget.variant,style: AppTextStyle.interRegular.copyWith(
                    color: AppColors.c_F2F2F2,fontSize:16.sp
                ),),
              ),
            ],
          )),
    );
  }

}
