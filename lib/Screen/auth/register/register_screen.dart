import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/auth/register/widget/bottom_information.dart';
import 'package:homework12/Screen/auth/register/widget/register_button.dart';
import 'package:homework12/Screen/auth/register/widget/test_field_widget.dart';
import 'package:homework12/tabBox/tab_box.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../data/form_status.dart';
import '../../../data/user_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/fonts/fonts.dart';
import '../../../utils/icons/icon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool k = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  isValid() {
    return AppConstants.passwordRegExp.hasMatch(passwordController.text) &&
        AppConstants.textRegExp.hasMatch(nameController.text) &&
        AppConstants.textRegExp.hasMatch(lastnameController.text) &&
        AppConstants.phoneRegExp.hasMatch(phoneController.text);
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
                  width: 150.w,
                  height: 180.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Register',
                  style: AppTextStyle.interSemiBold
                      .copyWith(color: AppColors.white, fontSize: 22.w),
                ),
                SizedBox(
                  height: 26.h,
                ),
                TextFormFieldWidgets(
                  onChanged: (v){
                    setState(() {});
                  },
                  regExp: AppConstants.textRegExp,
                  textInputType: TextInputType.name,
                  text: 'Username',
                  controller: nameController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidgets(
                  onChanged: (v){
                    setState(() {});},
                  regExp: AppConstants.textRegExp,
                  textInputType: TextInputType.name,
                  text: 'Lastname',
                  controller: lastnameController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidgets(
                  onChanged: (v){
                    setState(() {});
                  },
                  regExp: AppConstants.phoneRegExp,
                  textInputType: TextInputType.phone,
                  text: "Phone",
                  controller: phoneController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldWidgets(
                  onChanged: (v){
                    setState(() {});},
                  regExp: AppConstants.passwordRegExp,
                  textInputType: TextInputType.text,
                  text: "Password",
                  i: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 35.h,
                ),
                RegisterButton(
                  title: 'Register',
                  onTap: () {
                    context.read<AuthBloc>().add(RegisterUserEvent(
                        userModel: UserModel(fcm: "",
                          authId:'',
                          username:nameController.text,
                          password:passwordController.text,
                          imageUrl: '',
                          userId: '',
                          email:"${nameController.text}@gmail.com".trim(),
                          phoneNumber: phoneController.text.trim(),
                          lastname: lastnameController.text,
                        )));

                  },
                  isReady: isValid(),
                  isLoading: state.status == FormsStatus.loading,
                ),
                SizedBox(
                  height: 13.h,
                ),
                const InformationWidgets()
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
        }));
  }

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
