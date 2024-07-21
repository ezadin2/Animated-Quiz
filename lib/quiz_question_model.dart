class QuizQuestionModel{
  final String question;
  final String correctAnswer;
  final List<String> options;
  QuizQuestionModel({
    required this.question,
    required this.correctAnswer,
    required this.options
  });
}