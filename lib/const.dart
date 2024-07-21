import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_question_model.dart';

const backgroundColor = Color.fromRGBO(45, 27, 3, 1);
const foregroundColor = Color.fromRGBO(244, 140, 6, 1);

List<QuizQuestionModel> quizQuestions = [
  QuizQuestionModel(
    question: "What is the capital of France?",
    correctAnswer: 'Paris',
    options: ["Paris", "London", "Rome", "Berlin"],
  ),
  QuizQuestionModel(
    question: "Which planet is known as the Red Planet?",
    correctAnswer: 'Mars',
    options: ["Earth", "Mars", "Jupiter", "Venus"],
  ),
  QuizQuestionModel(
    question: "What is the largest ocean on Earth?",
    correctAnswer: 'Pacific Ocean',
    options: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"],
  ),
  QuizQuestionModel(
    question: "Who wrote 'Hamlet'?",
    correctAnswer: 'William Shakespeare',
    options: ["William Shakespeare", "Charles Dickens", "Jane Austen", "Mark Twain"],
  ),
  QuizQuestionModel(
    question: "What is the chemical symbol for gold?",
    correctAnswer: 'Au',
    options: ["Ag", "Au", "Fe", "Pb"],
  ),
  QuizQuestionModel(
    question: "Which country hosted the 2016 Summer Olympics?",
    correctAnswer: 'Brazil',
    options: ["China", "Brazil", "UK", "Japan"],
  ),
  QuizQuestionModel(
    question: "What is the capital of Australia?",
    correctAnswer: 'Canberra',
    options: ["Sydney", "Canberra", "Melbourne", "Brisbane"],
  ),
  QuizQuestionModel(
    question: "Who is known as the father of computers?",
    correctAnswer: 'Charles Babbage',
    options: ["Alan Turing", "Charles Babbage", "Bill Gates", "Steve Jobs"],
  ),
];
