import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/Quiz_screen/widget/button_down.dart';
import 'package:homework12/Screen/Quiz_screen/widget/information.dart';
import 'package:homework12/Screen/Quiz_screen/widget/questions_button.dart';
import 'package:homework12/Screen/Result/result_screen.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';
import 'package:homework12/models/quiz_models.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}
class _QuizScreenState extends State<QuizScreen> {
  List<QuizModels> questions=[];
  int activeIndex=0;
  int activeVariant=0;
  Map<int,int>selectedAnswer={};
  @override
  void initState() {
    questions=widget.subjectModel.questions;
    for(int i=0; i<questions.length; i++){
      selectedAnswer[i]=0;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        GlobalAppBar(title:"Testlar",isButton: true,
        onTap: (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
            return ResultScreen(subjectModel:widget.subjectModel,selectedAnswer: selectedAnswer,);
          }));
        },),
        SizedBox(height: 32.getH(),),
        Information(),
        SizedBox(height: 25.getH(),),
        Expanded(
          child: Container(
            width: double.infinity,
            padding:EdgeInsets.only(left: 32.w,right: 32.w,top: 40.h,bottom: 20.h),
            decoration: BoxDecoration(
              color: AppColors.c_162023,
              borderRadius:BorderRadius.only(
                topRight: Radius.circular(40.r),
                topLeft: Radius.circular(40.r),
              )
            ),
            child:Column(children: [
              Expanded(
                child:ListView(children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Savol: ${activeIndex+1}/${widget.subjectModel.questions.length}",style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c_F2F2F2,fontSize: 20.sp
                        ),),
                        SizedBox(height: 12.getH(),),
                        Text(widget.subjectModel.questions[activeIndex].questionTest,
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c_F2F2F2,fontSize: 17.sp,
                          ),),

                        SizedBox(height: 14.getH(),),
                        QuestionsButton(
                            onTap: (){
                              activeVariant=1;
                              setState(() {});
                            },
                            isActive: activeVariant==1,
                            questionVariant:"A. ", variant:widget.subjectModel.questions[activeIndex].variant1),
                        QuestionsButton(
                            onTap: (){
                              activeVariant=2;
                              setState(() {});
                            },
                            isActive: activeVariant==2,
                            questionVariant:"B. ", variant:widget.subjectModel.questions[activeIndex].variant2),
                        QuestionsButton(
                            onTap:(){
                              activeVariant=3;
                              setState(() {});
                              },
                            isActive: activeVariant==3,
                            questionVariant:"C. ", variant:widget.subjectModel.questions[activeIndex].variant3),
                        QuestionsButton(
                            onTap:(){
                              activeVariant=4;
                              setState(() {});
                            },
                            isActive: activeVariant==4,
                            questionVariant:"D. ", variant:widget.subjectModel.questions[activeIndex].variant4)
                      ],
                    )
                ],),
              ),
              ButtonDown(
                onPrevious: (){
                  activeIndex--;
                  activeVariant=selectedAnswer[activeIndex]!;
                  setState(() {
                  });
                },
                onNext:(){
                  selectedAnswer[activeIndex]=activeVariant;
                  activeIndex++;
                  activeVariant=selectedAnswer[activeIndex]!;
                  setState(() {});
                },
                subjectModel:widget.subjectModel,activeIndex: activeIndex,
              )
            ],),
          ),
        ),
      ],),
    );
  }
}
