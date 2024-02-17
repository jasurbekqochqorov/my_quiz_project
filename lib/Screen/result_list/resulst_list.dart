import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResultList extends StatefulWidget {
  const ResultList({super.key});

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding:EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h))
      ],
    );
  }
}
