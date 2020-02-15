import 'package:flutter/material.dart';
import 'package:flutter_learning_01/courses_tests/quiz/quiz_widgets/result.dart';
import './quiz_widgets/quiz.dart';

void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gestures',
      home: new QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizPagePage();
}

class _QuizPagePage extends State<QuizPage> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'what\'s your favorite band?',
      'answers': [
        {'text': 'pink floyd', 'score': 10},
        {'text': 'metalica', 'score': 7},
        {'text': 'sepultura', 'score': 2}
      ]
    },
    {
      'questionText': 'who\'s your favorite friend?',
      'answers': [
        {'text': 'Mehrdad', 'score': 9},
        {'text': 'Reza', 'score': 5},
        {'text': 'Vahab', 'score': 7},
        {'text': 'Saeed', 'score': 3}
      ]
    },
    {
      'questionText': 'who\'s your favorite Movie?',
      'answers': [
        {'text': 'The GodFather', 'score': 15},
        {'text': 'Inception', 'score': 7},
        {'text': 'Texas Killing Field', 'score': 2}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple ListView'),
        backgroundColor: Colors.teal,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questions: _questions,
              questionIndex: _questionIndex,
              totalScore: _totalScore)
          : Result(resultScore: _totalScore, resetHandler: _resetQuiz),
    );
  }

  // var person = Person(firstName: 'Iman', lastName: 'Mesgaran', age: 34);
  // Center(
  //       child: Text(
  //           '${person.firstName}  ${person.lastName}  ${person.age}'),
  //     ),

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
      print(_questionIndex);
    });
    if (_questionIndex < _questions.length) {
      print('You have more questions!');
    } else {
      print('No more question!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
}

class Person {
  String firstName;
  String lastName;
  int age;

  Person(
      {@required this.firstName, @required this.lastName, @required this.age});
}
