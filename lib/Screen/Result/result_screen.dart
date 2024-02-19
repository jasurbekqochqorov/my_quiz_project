
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/Result/widget/first_widget.dart';
import 'package:homework12/Screen/Result/widget/result_container.dart';
import 'package:homework12/Screen/Result/widget/time_widget.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';
import 'package:homework12/Screen/result_list/resulst_list.dart';
import 'package:homework12/Screen/start_quiz/main_screen.dart';
import 'package:homework12/data/question_logic.dart';
import 'package:homework12/models/quiz_models.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../globalList/global_list.dart';
import '../subject_screen/subject_screen.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.answerReport});
  final AnswerReport answerReport;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor:Colors.transparent,
      ),
      child: Scaffold(
        body: Column(
          children: [
            GlobalAppBar(title:'Sizning Natijangiz',
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return const SubjectScreen();
              }));
            }),
            SizedBox(height: 22.getH(),),
            Padding(padding:EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(children: [
              FirstWidget(title:widget.answerReport.subjectModel.subjectName,color:Colors.indigoAccent,),
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
                  CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    startAngle: 0,
                    radius: 70.r,
                    lineWidth: 10.h,
                    percent:widget.answerReport.truePercentage,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      RichText(text:TextSpan(
                        text: '${widget.answerReport.trueAnswer}',
                        style: AppTextStyle.interSemiBold.copyWith(
                          color:AppColors.c_F2F2F2,fontSize: 20.sp
                        ),
                        children: [
                          TextSpan(
                            text:'/${widget.answerReport.totalQuestionsCount}',
                            style: AppTextStyle.interRegular.copyWith(
                              color: AppColors.c_F2F2F2.withOpacity(0.75),fontSize: 15.sp
                            )
                          )
                        ]
                      )),
                      Text('sizning balingiz',style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.c_F2F2F2.withOpacity(0.75),fontSize: 10.sp
                      ),)
                    ],),
                    animation: true,
                    animationDuration:1500,
                    progressColor:Colors.teal,
                    backgroundColor: Colors.teal.withOpacity(0.2),

                  ),
                  SizedBox(width: 23.w,),
                  Expanded(
                    child: Text('Tabriklaymiz,  Sizning Natijangiz:${(widget.answerReport.truePercentage*100).toStringAsFixed(1)}%',style: AppTextStyle.interSemiBold.copyWith(
                      fontSize: 16.sp,color:AppColors.c_F2F2F2,
                    ),),
                  )
                ],),
              ),
              SizedBox(height: 19.getH(),),
              Row(children: [
                Expanded(
                    flex: 10,
                    child: ResultContainer(
                        result:"${widget.answerReport.trueAnswer}",
                        title:"To'g'ri javoblar",
                    color:AppColors.c_27AE60,)),
                const Expanded(
                    flex: 1,
                    child:SizedBox()),
                Expanded(
                  flex: 10,
                child: ResultContainer(result:'${widget.answerReport.falseAnswersCount}',
                  title:'Xato javoblar',
                color:AppColors.c_EB5757,)),
              ],),
              SizedBox(height:19.getH(),),
              Row(children: [
                Expanded(
                  flex: 10,
                  child:TimeWidget(
                    title: 'Umumiy berilgan vaqt',
                    time:'${widget.answerReport.totalTime~/60} min ${widget.answerReport.totalTime%60} s',
                    color: AppColors.c_F2954D,
                  ),
                ),
                Expanded(flex: 1,child: SizedBox()),
                Expanded(
                  flex: 10,
                  child:TimeWidget(
                    title:"Umumiy sarflangan vaqt",
                    time:'${widget.answerReport.spentTime~/60} min ${widget.answerReport.spentTime%60} s',
                    color: AppColors.c_0E81B4,),
                )
              ],),
              SizedBox(height:30.getH(),),
              ZoomTapAnimation(
                  onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                      return ResultList(
                        subjectModel:widget.answerReport.subjectModel,
                        answers: widget.answerReport.selectedAnswer,
                      );
                    }));
                  },
                  child: FirstWidget(title:'Natijani tekshirish',color: AppColors.c_F2954D.withOpacity(0.5),)),
              SizedBox(height: 15.getH(),),
              ZoomTapAnimation(
                  onTap:(){
                    list=[];
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return MainScreen(subjectModel: widget.answerReport.subjectModel);
                    }));
                  },
                  child:const FirstWidget(title:'Testni qaytadan yechish',color: AppColors.c_F2954D,isVisible:true,)),
            ],),)
          ],
        ),
      ),
    );
  }
}
