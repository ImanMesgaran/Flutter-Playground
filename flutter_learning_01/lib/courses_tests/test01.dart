import 'package:flutter/material.dart';
import 'package:flutter_learning_01/courses_tests/widgets/answer.dart';
import 'package:flutter_learning_01/courses_tests/widgets/question.dart';

void main() {
  runApp(MyTest01());
}

class MyTest01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gestures',
      home: new TestsSamplePage(),
    );
  }
}

class TestsSamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestsSamplePage();
}

class _TestsSamplePage extends State<TestsSamplePage> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'what\'s your favorite band?',
      'answers': ['pink floyd', 'metalica', 'sepultura']
    },
    {
      'questionText': 'who\'s your favorite friend?',
      'answers': ['Mehrdad', 'Reza', 'Vahab', 'Saeed']
    },
    {
      'questionText': 'who\'s your favorite Movie?',
      'answers': ['The GodFather', 'Inception', 'Texas Killing Field']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple ListView'),
        backgroundColor: Colors.teal,
      ),
      body: PersonWidget(),
    );
  }

  Widget PersonWidget() {
    var person = Person(firstName: 'Iman', lastName: 'Mesgaran', age: 34);

    return _questionIndex < _questions.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Question(_questions[_questionIndex]['questionText']),
              ...(_questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList(),
              Center(
                child: Text(
                    '${person.firstName}  ${person.lastName}  ${person.age}'),
              ),
            ],
          )
        : Center(
            child: Text('You reached end of questionaire!'),
          );
  }

  void _answerQuestion() {
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
}

class Person {
  String firstName;
  String lastName;
  int age;

  Person(
      {@required this.firstName, @required this.lastName, @required this.age});
}
