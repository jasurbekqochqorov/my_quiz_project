import 'package:flutter/material.dart';
import 'package:homework12/data/local/storage_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

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
            Text('Name:${StorageRepository.getString(key: 'name')}',style: AppTextStyle.interMedium.copyWith(
              color: AppColors.white,fontSize:24
            ),),
            const SizedBox(height: 10,),
            Text('Age:${StorageRepository.getString(key: 'age')}',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize:24
            ),),
            const SizedBox(height:16,),
            Text('email:${StorageRepository.getString(key: 'email')}',style: AppTextStyle.interMedium.copyWith(
                color: AppColors.white,fontSize:24
            ),),
        ],),
      ),
    );
  }
}
