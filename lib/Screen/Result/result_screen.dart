import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/Result/widget/first_widget.dart';
import 'package:homework12/Screen/Result/widget/result_container.dart';
import 'package:homework12/Screen/Result/widget/time_widget.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';
import 'package:homework12/Screen/start_quiz/main_screen.dart';
import 'package:homework12/models/quiz_models.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.subjectModel, required this.selectedAnswer});
  final SubjectModel subjectModel;
  final Map<int,int> selectedAnswer;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>{
  int trueAnswer=0;
  @override
  void initState() {
    _checkAnswer();
    super.initState();
  }
  _checkAnswer(){
    for(int i=0; i<widget.subjectModel.questions.length; i++){
      QuizModels quiz=widget.subjectModel.questions[i];
      int selection=widget.selectedAnswer[i]!;
      switch(selection){
        case 1:{
          if(quiz.trueAnswer==quiz.variant1){
            trueAnswer++;
          }
        }
      case 2:{
      if(quiz.trueAnswer==quiz.variant2){
      trueAnswer++;
      }
      }
      case 3:{
      if(quiz.trueAnswer==quiz.variant3){
      trueAnswer++;
      }
      }
      case 4:{
      if(quiz.trueAnswer==quiz.variant4){
      trueAnswer++;
      }
      }
      }
    }
  }
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
                CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  startAngle: 0,
                  radius: 70.r,
                  lineWidth: 10.h,
                   percent: trueAnswer/widget.subjectModel.questions.length,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    RichText(text:TextSpan(
                      text: '$trueAnswer',
                      style: AppTextStyle.interSemiBold.copyWith(
                        color:AppColors.c_F2F2F2,fontSize: 20.sp
                      ),
                      children: [
                        TextSpan(
                          text:'/${widget.subjectModel.questions.length}',
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
                  progressColor:Colors.teal,
                  backgroundColor: Colors.teal.withOpacity(0.2),
                ),
                SizedBox(width: 23.w,),
                Expanded(
                  child: Text('Tabriklaymiz,  Sizning Natijangiz:${(trueAnswer/(widget.subjectModel.questions.length)*100).toStringAsFixed(1)}%',style: AppTextStyle.interSemiBold.copyWith(
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
                      result:"$trueAnswer",
                      title:"To'g'ri javoblar",
                  color:AppColors.c_27AE60,)),
              const Expanded(
                  flex: 1,
                  child:SizedBox()),
              Expanded(
                flex: 10,
              child: ResultContainer(result:'${widget.subjectModel.questions.length-trueAnswer}',
                title:'Xato javoblar',
              color:AppColors.c_EB5757,)),
            ],),
            SizedBox(height:19.getH(),),
            const Row(children: [
              Expanded(
                flex: 10,
                child:TimeWidget(
                  title: 'Total time',
                  time: '12m 20sec',
                  color: AppColors.c_F2954D,
                ),
              ),
              Expanded(flex: 1,child: SizedBox()),
              Expanded(
                flex: 10,
                child:TimeWidget(
                  title: 'Avg. Time / Answer',
                  time: '2m 28sec',
                  color: AppColors.c_0E81B4,),
              )
            ],),
            SizedBox(height:30.getH(),),
            ZoomTapAnimation(
                onTap: (){

                },
                child: FirstWidget(title:'Natijani tekshirish',color: AppColors.c_F2954D.withOpacity(0.5),)),
            SizedBox(height: 15.getH(),),
            ZoomTapAnimation(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return MainScreen(subjectModel: widget.subjectModel);
                  }));
                },
                child: FirstWidget(title:'Testni qaytadan yechish',color: AppColors.c_F2954D,isVisible:true,)),
          ],),)
        ],
      ),
    );
  }
}
