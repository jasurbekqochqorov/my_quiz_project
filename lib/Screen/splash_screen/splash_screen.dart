import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/register/resgister_screen.dart';
import 'package:homework12/data/data_repository.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/tabBox/tab_box.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init()async{
    DataRepository.instance.loadSubject();
    Future.delayed(const Duration(seconds: 4),(){
      if(StorageRepository.getString(key: 'name').isNotEmpty){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
          return const TabBox();
        }));
      }
      else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
          return const RegisterScreen();
        }));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor:Colors.transparent,
      ),
      child: Scaffold(
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Loading....',style:AppTextStyle.interSemiBold.copyWith(
              color:AppColors.white,fontSize: 26.sp
            ),),
            SizedBox(height: 10.h,),
            Lottie.asset(AppImages.testAnimation,width:200.w,height: 200.h)
          ],),
        )
      ),
    );
  }
}
