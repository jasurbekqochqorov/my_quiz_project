import 'package:flutter/cupertino.dart';
import 'package:homework12/Screen/subject_screen/subject_screen.dart';
import 'package:homework12/models/level_models.dart';
import 'package:homework12/models/quiz_models.dart';
import 'package:homework12/utils/utils_function/function.dart';

class SubjectModel {

  final String subjectName;
  final List<QuizModels> questions;
  final LevelModel level;

  SubjectModel({
    required this.subjectName,
    required this.questions,
    required this.level
  });

  factory SubjectModel.fromJson(Map<String, dynamic>json){
    return SubjectModel(
      subjectName:json['subject_name'] as String? ?? "",
      level:getLevelFromString(json['level'] as String? ?? "medium"),
      questions:(json['questions'] as List?)?.map((e) =>QuizModels.fromJson(e)).toList() ?? [],
        );
  }
}


