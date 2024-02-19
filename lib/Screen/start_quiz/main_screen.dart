import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/global_widget/appBar.dart';
import 'package:homework12/Screen/start_quiz/widget/buttom_container.dart';
import 'package:homework12/Screen/subject_screen/subject_screen.dart';
import 'package:homework12/models/subject_models.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:homework12/utils/utils_function/function.dart';

import '../Quiz_screen/quiz_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.subjectModel});
  final SubjectModel subjectModel;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_273032,
      body: Column(
        children: [
          GlobalAppBar(title: "Test boshlash",onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return SubjectScreen();
            }));
          },),
          SizedBox(height: 22.getH()),
          Expanded(
            child: Stack(
              children: [
                Container(height: double.infinity,
                    padding:
                        EdgeInsets.only(left: 32.w, right: 32.w, top: 32.h,bottom: 100.h),
                    decoration: BoxDecoration(
                        color: AppColors.c_162023,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r))),
                    child: Expanded(
                      child: SingleChildScrollView(
                        physics:const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bir nechta savollarga javob berish orqali o'z bilimingizni sinab ko'ring.",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.interRegular.copyWith(
                                  color: AppColors.c_F2F2F2, fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 15.getH(),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border:
                                    Border.all(width: 2.w, color:Colors.lightBlueAccent),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child:(widget.subjectModel.subjectName=='Matematika')?Image.asset(AppImages.picture):Image.asset(AppImages.picture2)),
                                  SizedBox(
                                    height: 10.getH(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fan:${widget.subjectModel.subjectName}',
                                          style: AppTextStyle.interBold.copyWith(
                                              color: AppColors.c_F2F2F2,
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          height: 7.getH(),
                                        ),
                                        Text(
                                          "Qiyinlik darajasi: ${widget.subjectModel.level.name}",
                                          style: AppTextStyle.interBold.copyWith(
                                              color: AppColors.c_F2F2F2,
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          height: 9.getH(),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.getH(),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Savollar soni: ',
                                    style: AppTextStyle.interRegular.copyWith(
                                        color: AppColors.c_F2F2F2, fontSize: 17.sp),
                                    children: [
                                  TextSpan(
                                      text: ' ${widget.subjectModel.questions.length} ta',
                                      style: AppTextStyle.interBold.copyWith(
                                          color: AppColors.c_F2F2F2,
                                          fontSize: 17.sp))
                                ])),
                            SizedBox(
                              height: 12.getH(),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Umumiy vaqt:',
                                    style: AppTextStyle.interRegular.copyWith(
                                        color: AppColors.c_F2F2F2, fontSize: 17.sp),
                                    children: [
                                  TextSpan(
                                      text: ' ${getMinutelyText(widget.subjectModel.questions.length*120)}',
                                      style: AppTextStyle.interBold.copyWith(
                                          color: AppColors.c_F2F2F2,
                                          fontSize: 17.sp))
                                ])),
                            SizedBox(
                              height: 12.getH(),
                            ),
                            Text(
                              'Yo\'riqnoma :',
                              style: AppTextStyle.interBold.copyWith(
                                  color: AppColors.c_F2F2F2, fontSize: 18.sp),
                            ),
                            Text(widget.subjectModel.description,style: AppTextStyle.interRegular.copyWith(
                              color:AppColors.c_F2F2F2,fontSize: 17.sp
                            ),)
                          ],
                        ),
                      ),
                    )),
                BottomContainer(
                  k: widget.subjectModel.questions.length*120,
                  onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                      return QuizScreen(subjectModel:widget.subjectModel,);
                    }));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
