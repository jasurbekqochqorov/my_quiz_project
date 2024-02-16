import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/Screen/Quiz_screen/quiz_screen.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../../../utils/color/color.dart';
import '../../../utils/fonts/fonts.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                SvgPicture.asset(AppImages.watch,width: 17.w,height: 20.h,),
                SizedBox(width: 5.sp,),
                Text('15:00',style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_F2F2F2,fontSize:16.sp
                ),)
              ],),
            ),
            Spacer(),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor:Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    )
                ),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return QuizScreen();
                  }));
                }, child:Text('Start Quiz',style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.c_F2F2F2,fontSize:16.sp
            ),))
          ],),
        ));
  }
}
