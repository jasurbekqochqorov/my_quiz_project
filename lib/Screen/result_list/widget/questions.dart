import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.questionVariant, required this.variant, required this.isActive, required this.isTrue, required this.isTrue2,});
  final String questionVariant;
  final String variant;
  final bool isActive;
  final bool isTrue;
  final bool isTrue2;
  @override
  State<Questions> createState() => _QuestionsButtonState();
}

class _QuestionsButtonState extends State<Questions> {

  @override
  void initState() {
    // _check();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.only(
          left: 10.w,top: 13.h,bottom: 13.h,right: 10.w
      ),
      decoration: BoxDecoration(
      color:(widget.isActive)?(widget.isTrue)?AppColors.c_27AE60:Colors.red:(widget.isTrue2)?AppColors.blue:AppColors.c_162023,
        borderRadius: BorderRadius.circular(16.r),
      ),
      width: double.infinity,
      child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.questionVariant,style: AppTextStyle.interSemiBold.copyWith(
                  color: AppColors.c_F2F2F2,fontSize: 15.sp
              ),),
              Expanded(
                child: Text(widget.variant,style: AppTextStyle.interRegular.copyWith(
                    color: AppColors.c_F2F2F2,fontSize:14.sp
                ),),
              ),
            ],
          )
    );
  }

}
