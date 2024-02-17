import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/Result/widget/first_widget.dart';
import 'package:homework12/Screen/Result/widget/result_container.dart';
import 'package:homework12/Screen/Result/widget/time_widget.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';
import 'package:homework12/models/quiz_models.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.subjectModel, required this.selectedAnswer});
  final SubjectModel subjectModel;
  final Map<int,int> selectedAnswer;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<QuizModels> quizModels=[];
  int trueAnswer=0;
  @override
  void initState() {
    quizModels=widget.subjectModel.questions;
    super.initState();
  }
  // _checkAnswer(){
  //   for(int i=0; i<widget.selectedAnswer.length; i++){
  //     switch(widget.selectedAnswer[i]){
  //       case quizModels.
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const GlobalAppBar(title:'Test Natijasi'),
          SizedBox(height: 22.getH(),),
          Padding(padding:EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(children: [
            FirstWidget(title:widget.subjectModel.subjectName,color:Colors.indigoAccent,),
            SizedBox(height: 19.getH(),),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.c_162023,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(width: 1,color: AppColors.c_2F3739)
              ),
              padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
              child:Row(children: [
                SizedBox(width: 110.w,height: 110.h,),
                SizedBox(width: 23.w,),
                Expanded(
                  child: Text('Tabriklaymiz, Sizning natijangiz:${40}%',style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 16.sp,color:AppColors.c_F2F2F2,
                  ),),
                )
              ],),
            ),
            SizedBox(height: 19.getH(),),
            const Row(children: [
              Expanded(
                  flex: 10,
                  child: ResultContainer(
                      result:"4",
                      title:'Correct Answer',
                  color:AppColors.c_27AE60,)),
              Expanded(
                  flex: 1,
                  child:SizedBox()),
              Expanded(
                flex: 10,
              child: ResultContainer(result:'4', title:'Wrong Answer',
              color:AppColors.c_EB5757,)),
            ],),
            SizedBox(height:19.getH(),),
            const Row(children: [
              Expanded(
                flex: 10,
                child:TimeWidget(color: AppColors.c_F2954D,),
              ),
              Expanded(flex: 1,child:SizedBox()),
              Expanded(
                flex: 10,
                child:TimeWidget(color: AppColors.c_0E81B4,),
              )
            ],),
            SizedBox(height:30.getH(),),
            ZoomTapAnimation(
                onTap: (){},
                child: FirstWidget(title:'Check Answer',color: AppColors.c_F2954D.withOpacity(0.5),)),
            SizedBox(height: 15.getH(),),
            ZoomTapAnimation(
                onTap:(){},
                child: FirstWidget(title:'Try Quiz Again',color: AppColors.c_F2954D,)),
          ],),)
        ],
      ),
    );
  }
}
