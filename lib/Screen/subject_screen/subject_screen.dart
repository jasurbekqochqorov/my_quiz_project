import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/start_quiz/main_screen.dart';
import 'package:homework12/Screen/subject_screen/widet/subject_item.dart';
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
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_273032,
        centerTitle: true,
        title: Text(
          'Fanlar',
          style: AppTextStyle.interSemiBold.copyWith(
            color: AppColors.c_F2F2F2,
            fontSize: 24.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child:ListView(
          children: [
            ...List.generate(DataRepository.instance.allSubject.length, (index) {
              SubjectModel subjectModel = DataRepository.instance.allSubject[index];
              return SubjectItem(
                  time: '14:00', subjectModel: subjectModel, onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return MainScreen(subjectModel: subjectModel,);
                    }));
              });
            })
          ],
        ),
      ),
    );
  }
}
