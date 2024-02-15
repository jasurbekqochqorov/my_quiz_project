

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:homework12/utils/icons/icon.dart';

import '../models/subject_models.dart';

class DataRepository{

  DataRepository._();

  static final DataRepository instance=DataRepository._();

  factory DataRepository()=>instance;

  List<SubjectModel> allSubjects=[];

  Future<void> loadSubject () async{
    var data=await rootBundle.loadString(AppImages.testData);
    var decodeData=jsonDecode(data);
    allSubjects=(decodeData["data"] as List?)?.map((e) =>
    SubjectModel.fromJson(e)).toList() ?? [];
  }
}