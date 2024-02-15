class QuizModels{

  final String questionTest;
  final String variant1;
  final String variant2;
  final String variant3;
  final String variant4;
  final String trueAnswer;

  QuizModels({
    required this.questionTest,
    required this.variant1,
    required this.variant2,
    required this.variant3,
    required this.variant4,
    required this.trueAnswer
});

  factory QuizModels.fromJson(Map<String,dynamic> json){
    return QuizModels(
        questionTest:json['question_text'] as String? ?? "",
        variant1: json['variant_1'] as String? ?? "",
        variant2: json['variant_2'] as String? ?? "",
        variant3: json['variant_3'] as String? ?? "",
        variant4: json['variant_4'] as String? ?? "",
        trueAnswer: json['true_answer'] as String? ?? "");
  }
}