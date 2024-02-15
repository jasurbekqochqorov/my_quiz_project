import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
          Padding(
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 50.h),
            child: Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.w, vertical: 16.h),
                      backgroundColor: AppColors.c_162023,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          side: BorderSide(
                            width: 1.h,
                            color: AppColors.c_2F3739,
                          ))),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    AppImages.arrowBack,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(
                  width: 16.getW(),
                ),
                Text(
                  'Start Quiz',
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.c_F2F2F2, fontSize: 20.sp),
                )
              ],
            ),
          ),
          SizedBox(height: 22.getH()),
          Expanded(
            child: Stack(
              children: [
                Container(
                    padding:
                        EdgeInsets.only(left: 32.w, right: 32.w, top: 32.h),
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
                              'Put your understanding of this concept to test by answering a few MCQs.',
                              style: AppTextStyle.interRegular.copyWith(
                                  color: AppColors.c_F2F2F2, fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 15.getH(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border:
                                    Border.all(width: 1, color: AppColors.blue),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: Image.asset(AppImages.picture)),
                                  SizedBox(
                                    height: 10.getH(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Subject: Maths',
                                          style: AppTextStyle.interBold.copyWith(
                                              color: AppColors.c_F2F2F2,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 7.getH(),
                                        ),
                                        Text(
                                          'Chapter: Real Numbers',
                                          style: AppTextStyle.interBold.copyWith(
                                              color: AppColors.c_F2F2F2,
                                              fontSize: 14.sp),
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
                                    text: 'Total Questions:',
                                    style: AppTextStyle.interRegular.copyWith(
                                        color: AppColors.c_F2F2F2, fontSize: 14.sp),
                                    children: [
                                  TextSpan(
                                      text: '  05',
                                      style: AppTextStyle.interBold.copyWith(
                                          color: AppColors.c_F2F2F2,
                                          fontSize: 14.sp))
                                ])),
                            SizedBox(
                              height: 12.getH(),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Total Time:',
                                    style: AppTextStyle.interRegular.copyWith(
                                        color: AppColors.c_F2F2F2, fontSize: 14.sp),
                                    children: [
                                  TextSpan(
                                      text: '  15 min',
                                      style: AppTextStyle.interBold.copyWith(
                                          color: AppColors.c_F2F2F2,
                                          fontSize: 14.sp))
                                ])),
                            SizedBox(
                              height: 12.getH(),
                            ),
                            Text(
                              'Instructions:',
                              style: AppTextStyle.interBold.copyWith(
                                  color: AppColors.c_F2F2F2, fontSize: 14.sp),
                            ),
                            Text('''fajsgjhadjsgshjhjadghajkgadgadgdddddddddddddddfdsafsfasffadshfjgdsjfgasdfgadshaafksdgdddddddddddddddddfadfdfadfgaddhgjkadhgkjThe quizzes consists of questions carefully designed to help you self-assess your comprehension of the information presented on the topics covered in the module.After responding to a question, click on the "Next Question" button at the bottom to go to the next questino. After responding to the 8th question, click on "Close" on the top of the window to exit the quiz.If you select an incorrect response for a question, you can try again until you get the correct response. If you retake the quiz, the questions and their respective responses will be randomized.''',
                              style: AppTextStyle.interRegular.copyWith(
                              color: AppColors.c_F2F2F2,fontSize: 14.sp
                            ),)
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,right: 0,
                    child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                  color:AppColors.c_273032
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 20.h),
                  child:Row(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(width: 1.h,color: AppColors.c_F2F2F2)
                      ),
                      child: Row(children: [
                        const Icon(Icons.access_alarm,color: AppColors.c_F2F2F2,),
                        SizedBox(width: 5.sp,),
                        Text('15:00',style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.c_F2F2F2,fontSize:16.sp
                        ),)
                      ],),
                    ),
                    Spacer(),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          )
                        ),
                        onPressed: (){}, child:Text('Start Quiz',style: AppTextStyle.interSemiBold.copyWith(
                      color: AppColors.c_F2F2F2,fontSize:16.sp
                    ),))
                  ],),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
