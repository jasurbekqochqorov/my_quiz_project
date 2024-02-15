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
  Widget build(BuildContext context) {
    return Scaffold(
      body:TextButton(
        onPressed:widget.onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          backgroundColor:AppColors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
          )
        ),
        child:Row(children: [
          Column(children: [
            Text(widget.subjectModel.subjectName),
            SizedBox(height: 5.h,),
            Text(widget.subjectModel.level.name),
          ],),
          Spacer(),
          Column(children: [
            Text(widget.time),
            SizedBox(height: 5.h,),
          ],)
        ],),
      ),
    );
  }
}
