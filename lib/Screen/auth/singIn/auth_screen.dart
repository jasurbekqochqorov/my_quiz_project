import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/auth/singIn/widget/bottom_information.dart';
import 'package:homework12/Screen/auth/singIn/widget/login_button.dart';
import 'package:homework12/Screen/auth/singIn/widget/test_field_widget.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../data/form_status.dart';
import '../../../tabBox/tab_box.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool k = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  isValid() {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppImages.top,
                  width: 218.w,
                  height: 225.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'LOGIN',
                  style: AppTextStyle.interSemiBold
                      .copyWith(color: AppColors.white, fontSize: 22.w),
                ),
                SizedBox(
                  height: 26.h,
                ),
                TextFormFieldWidget(
                  onChanged: (v){
                    setState(() {
                    });
                  },
                  regExp: AppConstants.textRegExp,
                  icon:"e",
                  text: 'Username',
                  controller: emailController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidget(
                  onChanged: (v){
                    setState(() {});
                  },
                  regExp: AppConstants.passwordRegExp,
                  icon:"p",
                  text: "Password",
                  i: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 35.h,
                ),
                LogInButton(
                  title: 'LOGIN',
                  onTap: () {
                    context.read<AuthBloc>().add(LoginUserEvent(
                          password: passwordController.text,
                          username: emailController.text,
                        ));
                  },
                  isReady: isValid(),
                  isLoading: state.status == FormsStatus.loading,
                ),
                SizedBox(
                  height: 13.h,
                ),
                const InformationWidget()
              ],
            ),
          );
        }, listener: (context, state) {
          if (state.status == FormsStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.statusMessage,
                style: AppTextStyle.interBold
                    .copyWith(color: AppColors.white, fontSize: 16),
              ),
              backgroundColor: Colors.red,
            ));
          }
          if (state.status == FormsStatus.authenticated) {
           Navigator.push(context, MaterialPageRoute(builder: (context){
             return const TabBox();
           }));
          }
        }));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
