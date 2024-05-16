import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/color/color.dart';
import '../../../../utils/fonts/fonts.dart';


class RegisterButton extends StatefulWidget {
  const RegisterButton({
    super.key,
    required this.title,
    required this.onTap,
     this.isLoading=false,
     this.isReady=true,
  });
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isReady;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed:(widget.isReady)?widget.onTap:null,
          style: TextButton.styleFrom(
              backgroundColor:
                  (widget.isReady) ? AppColors.c_1317DD : AppColors.cC4C4C4,
              padding: EdgeInsets.symmetric(vertical: 16.h)),
          child: Center(
            child: (widget.isLoading)
                ? SizedBox(width: 26.w,height:26.h,child: const CircularProgressIndicator(color: AppColors.white,),)
                : Text(
                    widget.title,
                    style: AppTextStyle.interSemiBold
                        .copyWith(color: (!widget.isReady)?AppColors.black:AppColors.white, fontSize: 15.w),
                  ),
          )),
    );
  }
}
