
import '../Screen/globalList/global_list.dart';
import '../models/quiz_models.dart';
import '../models/subject_models.dart';

class AnswerReport {
  final Map<int, int> selectedAnswer;

  final SubjectModel subjectModel;
  final int spentTime;

  int trueAnswer = 0;
  int falseAnswersCount = 0;
  int averageTimeForEachAnswer = 0;
  int totalTime = 0;
  double truePercentage = 0.0;
  int totalQuestionsCount = 0;

  AnswerReport({
    required this.subjectModel,
    required this.selectedAnswer,
    required this.spentTime,
  }) {
    _checkAnswers();
  }

  _checkAnswers() {
    for(int i=0; i<subjectModel.questions.length; i++){
      QuizModels quiz=subjectModel.questions[i];
      int selection=selectedAnswer[i]!;

      switch(selection){
        case 1:{
          list.add(quiz.variant1);
          if(quiz.trueAnswer==quiz.variant1){
            trueAnswer++;
          }
        }
        case 2:{
          list.add(quiz.variant2);
          if(quiz.trueAnswer==quiz.variant2){
            trueAnswer++;
          }
        }
        case 3:{
          list.add(quiz.variant3);
          if(quiz.trueAnswer==quiz.variant3){
            trueAnswer++;
          }
        }
        case 4:{
          list.add(quiz.variant4);
          if(quiz.trueAnswer==quiz.variant4){
            trueAnswer++;
          }
        }
        default:{
          list.add('');
        }
      }
      falseAnswersCount=subjectModel.questions.length-trueAnswer;
      int onlySelectedAnswersCount = 0;
      for (int i = 0; i < subjectModel.questions.length; i++) {
        if (selectedAnswer[i] != 0) {
          onlySelectedAnswersCount++;
        }
      }
      averageTimeForEachAnswer = spentTime ~/ onlySelectedAnswersCount;
    }

    totalTime = subjectModel.questions.length * 120;

    truePercentage = (trueAnswer/ subjectModel.questions.length);

    totalQuestionsCount = subjectModel.questions.length;
  }
}
