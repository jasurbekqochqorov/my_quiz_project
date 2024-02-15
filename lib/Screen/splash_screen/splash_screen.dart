import 'package:flutter/material.dart';
import 'package:homework12/data/data_repository.dart';
import 'package:homework12/utils/icons/icon.dart';
import 'package:lottie/lottie.dart';

import '../subject_screen/subject_screen.dart';

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
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return const SubjectScreen();
      }));
    });
    var d=DataRepository.instance.allSubjects;
    print("Length:${d.length}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Lottie.asset(AppImages.testAnimation),
      )
    );
  }
}
