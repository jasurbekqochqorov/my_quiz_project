import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/auth/singIn/auth_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../bloc/auth/auth_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: AppTextStyle.interSemiBold.copyWith(
          color: AppColors.white,fontSize: 26,
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24,),
            const Icon(Icons.account_circle_rounded,color: AppColors.white,size: 100,),
            const SizedBox(height: 10,),
            Text('Name:${FirebaseAuth.instance.currentUser!.email!.split("@")[0] ?? ""}',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,fontSize:24
            ),),
            const SizedBox(height: 10,),
            Text('email:${FirebaseAuth.instance.currentUser!.email?? ""}',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize:24
            ),),
            SizedBox(height: 16.h,),
            TextButton(onPressed: (){
              context.read<AuthBloc>().add(LogOutUserEvent());
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const AuthScreen();
              }));
            }, child:Text("Log out",style: AppTextStyle.interMedium.copyWith(
              color:Colors.red,fontSize: 16.sp
            ),))
        ],),
      ),
    );
  }
}
