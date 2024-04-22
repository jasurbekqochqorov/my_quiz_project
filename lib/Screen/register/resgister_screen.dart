import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

import '../../tabBox/tab_box.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style: AppTextStyle.interMedium.copyWith(
          color: AppColors.white,fontSize: 24
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child: Column(children: [
          TextField(
            controller: nameController,
            style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,fontSize: 16
            ),
            decoration: InputDecoration(
              hintStyle: AppTextStyle.interMedium.copyWith(
                color: AppColors.white.withOpacity(0.5),
                fontSize: 16
              ),
              hintText: "Enter your name",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1,color: AppColors.white),
                borderRadius: BorderRadius.circular(16)
              ),
              enabledBorder:  OutlineInputBorder(
                  borderSide:const BorderSide(width: 1,color: AppColors.white),
                  borderRadius: BorderRadius.circular(16)
              ),
            ),
          ),
          const SizedBox(height: 24,),
          TextField(
            controller: emailController,
            style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize: 16
            ),
            decoration: InputDecoration(
              hintStyle: AppTextStyle.interMedium.copyWith(
                  color: AppColors.white.withOpacity(0.5),
                  fontSize: 16
              ),
              hintText: "Enter your email",
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.white),
                  borderRadius: BorderRadius.circular(16)
              ),
              enabledBorder:  OutlineInputBorder(
                  borderSide:const BorderSide(width: 1,color: AppColors.white),
                  borderRadius: BorderRadius.circular(16)
              ),
            ),
          ),
          const SizedBox(height: 24,),
          TextField(
            controller: ageController,
            style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize: 16
            ),
            decoration: InputDecoration(
              hintStyle: AppTextStyle.interMedium.copyWith(
                  color: AppColors.white.withOpacity(0.5),
                  fontSize: 16
              ),
              hintText: "Enter your age",
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColors.white),
                  borderRadius: BorderRadius.circular(16)
              ),
              enabledBorder:  OutlineInputBorder(
                  borderSide:const BorderSide(width: 1,color: AppColors.white),
                  borderRadius: BorderRadius.circular(16)
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width:double.infinity,
            child: TextButton(onPressed: (){
              if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && ageController.text.isNotEmpty){
                StorageRepository.setString(key:'name', value:nameController.text);
                StorageRepository.setString(key:'email', value:emailController.text);
                StorageRepository.setString(key:'age', value:ageController.text);
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                  return const TabBox();
                }));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Malumotlarni to'liq kiriting",style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white,fontSize: 16
                  ),),
                  backgroundColor: Colors.red,)
                );
              }
            },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.c_0D2333
                ),
                child:Text("Next",style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,fontSize: 20
            ),)),
          )
        ],),
      ),
    );
  }
}
