import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class SubjectItem extends StatefulWidget {
  const SubjectItem({super.key, required this.time, required this.subjectModel, required this.onTap});
  final String time;
  final SubjectModel subjectModel;
  final VoidCallback onTap;
  @override
  State<SubjectItem> createState() => _SubjectItemState();
}

class _SubjectItemState extends State<SubjectItem> {
  @override

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:10.h),
      child: TextButton(
          onPressed:widget.onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            backgroundColor:widget.subjectModel.color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
            )
          ),
          child:Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(widget.subjectModel.subjectName,style: AppTextStyle.interMedium.copyWith(
                color: AppColors.c_F2F2F2,fontSize: 20.sp
              ),),
              SizedBox(height: 5.h,),
              Text(widget.subjectModel.level.name,style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_F2F2F2,fontSize: 16.sp
              ),),
            ],),
            Spacer(),
            Column(children: [
              Text(widget.time,style: AppTextStyle.interMedium.copyWith(
                  color:Colors.red,fontSize: 16.sp
              ),),
              SizedBox(height: 5.h,),
              Text("${widget.subjectModel.questions.length} ta",style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.white,fontSize: 15.sp
              ),)
            ],)
          ],),
      ),
    );
  }
}
