import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/widget/subject_item.dart';
import 'package:homework12/data/data_repository.dart';
import 'package:homework12/models/subject_models.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_273032,
        centerTitle: true,
        title: Text('Fanlar', style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.c_F2F2F2, fontSize: 24.sp,
        ),),
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal:20.w,vertical: 30.h),
        child: Column(children: [
            ...List.generate(DataRepository().allSubjects.length, (index){
        SubjectModel subjectModel = DataRepository().allSubjects[index];
         return SubjectItem(
            time: '14:00', subjectModel: subjectModel, onTap: () {});
            })],),
      ),);
  }
}
