import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/fonts/fonts.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.icon,
    required this.text,
    this.i = false,
    required this.controller,
    required this.regExp,
    required this.onChanged,
  });

  final String icon;
  final RegExp regExp;
  final String text;
  final bool? i;
  final Function(String v) onChanged;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool t = false;
  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      child: Form(
        key: key,
        child: TextFormField(
          onChanged:widget.onChanged,
          validator: (v) {
            if (v != null && v.isNotEmpty && widget.regExp.hasMatch(v)) {
              return null;
            }
            return "${widget.text} error";
          },
          controller: widget.controller,
          obscureText: widget.i! ? (t ? false : true) : false,
          style: AppTextStyle.interMedium
              .copyWith(color: AppColors.white, fontSize: 16.w),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
            // prefixIcon: IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset(
            //     widget.icon,
            //     width: 26.w,
            //     height: 26.h,
            //   ),
            // ),
            hintStyle: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.white,fontSize: 16.sp
            ),
            hintText: widget.text,
            suffixIcon: (widget.i!)
                ? IconButton(
                    onPressed: () {
                      t = !t;
                      setState(() {});
                    },
                    icon: (t)
                        ? const Icon(Icons.visibility,color:AppColors.white,)
                        : const Icon(Icons.visibility_off,color: AppColors.white,),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w, color: AppColors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.w, color: AppColors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.red),
              borderRadius: BorderRadius.circular(9),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.red),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ),
    );
  }
}
