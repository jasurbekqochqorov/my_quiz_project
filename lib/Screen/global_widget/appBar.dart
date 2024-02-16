import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework12/utils/extension/extension.dart';

import '../../utils/color/color.dart';
import '../../utils/fonts/fonts.dart';
import '../../utils/icons/icon.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 50.h),
      child: Row(children: [
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 14.h),
              backgroundColor: AppColors.c_162023,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(
                    width: 1.h,
                    color: AppColors.c_2F3739,
                  ))),
          onPressed: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            AppImages.arrowBack,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(
          width: 16.getW(),
        ),
        Text(
          title,
          style: AppTextStyle.interMedium
              .copyWith(color: AppColors.c_F2F2F2, fontSize: 24.sp),
        )
      ],),
    );
  }
}
