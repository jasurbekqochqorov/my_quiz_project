
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/fonts/fonts.dart';

class TextFormFieldWidgets extends StatefulWidget {
  const TextFormFieldWidgets({
    super.key,
    required this.text,
    this.i = false,
    required this.controller,
    required this.textInputType, 
    required this.regExp,
    required this.onChanged,
  });
  final RegExp regExp;
  final Function(String v) onChanged;
  final String text;
  final bool? i;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  State<TextFormFieldWidgets> createState() => _TextFormFieldWidgetsState();
}

class _TextFormFieldWidgetsState extends State<TextFormFieldWidgets> {
  bool t = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 34.w),
      child: TextFormField(
        keyboardType:widget.textInputType,
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
            hintStyle: AppTextStyle.interSemiBold.copyWith(
              color: AppColors.white,fontSize:16.sp
            ),
            hintText: widget.text,
            suffixIcon: (widget.i!)
                ? IconButton(
              onPressed: () {
                t = !t;
                setState(() {});
              },
              icon: (t)
                  ?  const Icon(Icons.visibility,color: AppColors.white,)
                  :  const Icon(Icons.visibility_off,color: AppColors.white,),
            )
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.w, color: AppColors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.w, color: AppColors.white),
              borderRadius: BorderRadius.circular(9),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Colors.red),
              borderRadius: BorderRadius.circular(9),
            )),
      ),
    );
  }
}