import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/auth/register/register_screen.dart';

import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../utils/color/color.dart';
import '../../../../utils/fonts/fonts.dart';
import '../../../../utils/icons/icon.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
       Text('OR',style: AppTextStyle.interMedium.copyWith(
         color: AppColors.white,fontSize: 16.sp
       ),),
      SizedBox(height: 1.h,),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: TextButton(onPressed: (){
          context.read<AuthBloc>().add(SignInWithGoogleEvent());
        },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.white,
            side: BorderSide(width: 1.w,color: AppColors.c_1A72DD)
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.google,width: 23.w,height: 23.h,fit: BoxFit.cover,),
            SizedBox(width: 10.w,),
            const Text('Login with Google'),
          ],),),
      ),
      SizedBox(height: 19.h,),
      TextButton(
        onPressed: (){
          Navigator.push(
            context,MaterialPageRoute(builder: (context){
              return const RegisterScreen();
          })
          );
        },
        child: RichText(text:TextSpan(
            text:'Don’t have an account? ',
            style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize: 11.w
            ),
            children: [
              TextSpan(
                text: ' Register now',
                style: AppTextStyle.interRegular.copyWith(
                    color: Colors.blue,fontSize: 11.w
                ),
              )
            ]
        )),
      )
    ],);
  }
}
