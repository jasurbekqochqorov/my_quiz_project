import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/Result/result_screen.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';
import 'package:homework12/Screen/result_list/widget/questions.dart';
import 'package:homework12/Screen/result_list/widget/true_and_wrong_answer.dart';
import 'package:homework12/data/question_logic.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../globalList/global_list.dart';


class ResultList extends StatefulWidget {
  const ResultList({super.key, required this.subjectModel, required this.answers});
  final SubjectModel subjectModel;
  final Map<int,int> answers;
  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: Column(
          children: [
          GlobalAppBar(title:'Sizning Natijangiz',onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return ResultScreen(answerReport: AnswerReport(subjectModel:widget.subjectModel, selectedAnswer:widget.answers, spentTime:0),);
            }));
          },),
            SizedBox(height: 20.getH(),),
            Expanded(
              child: ListView(children: [
                const TrueAndWrong(color:Colors.green,title: "Siz belgilagan to'g'ri javoblar",),
                const TrueAndWrong(color:Colors.red,title: "Siz belgilagan noto'g'ri javoblar",),
                const TrueAndWrong(color: Colors.blue,title:"Siz topa olmagan to'g'ri javoblar",),
                SizedBox(height: 10.getH(),),
                Padding(
                  padding:EdgeInsets.symmetric(
                    horizontal: 32.w
                  ),
                  child: Text('Natijangiz:',style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.c_F2F2F2,fontSize: 20
                  ),),
                ),
                SizedBox(height:10.getH(),),
                Expanded(
                  child: Column(children: [
                    ...List.generate(widget.subjectModel.questions.length, (index){
                      return Padding(
                        padding:EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Savol: ${index+1}/${widget.subjectModel.questions.length}",style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.c_F2F2F2,fontSize: 20.sp
                            ),),
                            SizedBox(height: 12.getH(),),
                            Text(widget.subjectModel.questions[index].questionTest,
                              style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.c_F2F2F2,fontSize: 17.sp,
                              ),),
                            SizedBox(height: 14.getH(),),
                            Questions(
                              isTrue2: widget.subjectModel.questions[index].variant1==widget.subjectModel.questions[index].trueAnswer,
                              isActive: (list[index]==widget.subjectModel.questions[index].variant1),
                              questionVariant:"A. ",
                              variant:widget.subjectModel.questions[index].variant1,
                              isTrue:(list[index]==widget.subjectModel.questions[index].variant1 && list[index]==widget.subjectModel.questions[index].trueAnswer),
                            ),
                            Questions(
                              isTrue2: widget.subjectModel.questions[index].variant2==widget.subjectModel.questions[index].trueAnswer,
                              isActive:(list[index]==widget.subjectModel.questions[index].variant2),
                              questionVariant:"B. ",
                              variant:widget.subjectModel.questions[index].variant2,
                              isTrue:(list[index]==widget.subjectModel.questions[index].variant2 && list[index]==widget.subjectModel.questions[index].trueAnswer),
                            ),
                            Questions(
                              isTrue2:widget.subjectModel.questions[index].variant3==widget.subjectModel.questions[index].trueAnswer,
                              isActive: (list[index]==widget.subjectModel.questions[index].variant3),
                              questionVariant:"C. ",
                              variant:widget.subjectModel.questions[index].variant3,
                              isTrue:(list[index]==widget.subjectModel.questions[index].variant3 && list[index]==widget.subjectModel.questions[index].trueAnswer),
                            ),
                            Questions(
                              isTrue2:widget.subjectModel.questions[index].variant4==widget.subjectModel.questions[index].trueAnswer,
                              isActive: (list[index]==widget.subjectModel.questions[index].variant4),
                              questionVariant:"D. ",
                              variant:widget.subjectModel.questions[index].variant4,
                              isTrue:(list[index]==widget.subjectModel.questions[index].variant4 && list[index]==widget.subjectModel.questions[index].trueAnswer),
                            )
                          ],),
                      );
                    })
                  ],),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
