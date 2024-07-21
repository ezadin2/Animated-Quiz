import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/quiz_question_model.dart';
import 'package:quiz_app/result_screen.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = "", selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(0, 0, 12, 1.0), Color.fromRGBO(
                34, 68, 82, 0.5058823529411764),Color.fromRGBO(24, 24, 58, 1.0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.blueGrey[800], // App bar color
              centerTitle: true,
              title: Text(
                'Play Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: quizQuestions.length,
                itemBuilder: (context, index) {
                  QuizQuestionModel model = quizQuestions[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.question,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Raleway',
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.options.length,
                            itemBuilder: (context, optionIndex) {
                              final option = model.options[optionIndex];
                              final isSelected = selectedAnswer == option;

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedAnswer = option;
                                      correctAnswer = model.correctAnswer;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      gradient: isSelected
                                          ? LinearGradient(
                                        colors: [foregroundColor, foregroundColor.withOpacity(0.8)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                          : LinearGradient(
                                        colors: [Colors.transparent, Colors.transparent],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: isSelected ? Colors.transparent : foregroundColor,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        if (isSelected)
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            offset: Offset(2, 4),
                                            blurRadius: 8,
                                          ),
                                      ],
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Raleway',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedAnswer.isNotEmpty) {
                  if (selectedAnswer == correctAnswer) {
                    correctAnswers++;
                  } else {
                    wrongAnswers++;
                  }
                  currentIndex++;
                  selectedAnswer = "";

                  if (currentIndex < quizQuestions.length) {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          correctAnswer: correctAnswers,
                          wrongAnswer: wrongAnswers,
                        ),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select an answer.')),
                  );
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: Colors.blueGrey[800],
                height: 70,
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    'Next',
                    key: ValueKey<int>(currentIndex),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
