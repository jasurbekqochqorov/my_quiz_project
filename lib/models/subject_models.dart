import 'dart:ui';

import 'package:homework12/models/level_models.dart';
import 'package:homework12/models/quiz_models.dart';
import 'package:homework12/utils/utils_function/function.dart';

class SubjectModel {

  final String subjectName;
  final List<QuizModels> questions;
  final LevelModel level;
  final Color color;
  final String description;

  SubjectModel({
    required this.description,
    required this.color,
    required this.subjectName,
    required this.questions,
    required this.level
  });

  factory SubjectModel.fromJson(Map<String, dynamic>json){
    return SubjectModel(
      description: json["description"] as String? ?? "",
      subjectName:json['subject_name'] as String? ?? "",
      level:getLevelFromString(json['level'] as String? ?? "medium"),
      questions:(json['questions'] as List?)?.map((e) =>QuizModels.fromJson(e)).toList() ?? [],
      color:(json["color"] as String? ?? "2F3739").toColor(),
        );
  }
}


