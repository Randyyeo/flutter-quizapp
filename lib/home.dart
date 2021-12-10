import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/end.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _questions = [
    {
      'question': 'Which of the following is a mammal?',
      'answers': [
        {'answerText': 'Duck', 'img': 'assets/duck.PNG', 'score': false},
        {'answerText': 'Whale', 'img': 'assets/whale.PNG', 'score': true},
        {
          'answerText': 'Butterfly',
          'img': 'assets/Butterfly.PNG',
          'score': false
        },
        {'answerText': 'Shark', 'img': 'assets/Shark.PNG', 'score': false},
      ],
      'explain':
          'Whales are mammals. Mammals are characterized by the presence of mammary glands in which females produce milk for feeding their young.'
    },
    {
      'question': 'Which of the following materials is the hardest?',
      'answers': [
        {'answerText': 'Granite', 'img': 'assets/stone.png', 'score': false},
        {'answerText': 'Steel', 'img': 'assets/Steel.png', 'score': false},
        {'answerText': 'Diamond', 'img': 'assets/Diamond.png', 'score': true},
        {'answerText': 'Gold', 'img': 'assets/gold.png', 'score': false},
      ],
      'explain':
          'Diamonds are the hardest materials on the Vickers hardness scale.'
    },
    {
      'question': 'Which planet is the smallest?',
      'answers': [
        {'answerText': 'Mercury', 'img': 'assets/mercury.jpg', 'score': true},
        {'answerText': 'Venus', 'img': 'assets/venus.png', 'score': false},
        {'answerText': 'Neptune', 'img': 'assets/neptune.png', 'score': false},
        {'answerText': 'Earth', 'img': 'assets/earth.png', 'score': false},
      ],
      'explain': 'Mecury is the smallest.'
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool isTapped = false;
  bool correctAnswerSelected = false;
  String answerSelected = "";

  void _questionAnswered(String answerScore, String text) {
    setState(() {
      answerWasSelected = true;

      if (!isTapped) {
        answerSelected = text;
        if (answerScore == 'true') {
          correctAnswerSelected = true;
          _totalScore++;
        } else {
          correctAnswerSelected = false;
        }
      }

      isTapped = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      isTapped = false;
      print("next question" + isTapped.toString());
      _questionIndex++;
      answerWasSelected = false;
      if (_questionIndex >= _questions.length) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => End(score: _totalScore)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(top: 50.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Colors.lightGreen),
                          backgroundColor: Colors.grey,
                          minHeight: 30.0,
                          value: (_questionIndex + 1) / _questions.length,
                        ))),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Score',
                          style: TextStyle(fontSize: 25.0, color: Colors.blue),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          _totalScore.toString(),
                          style: TextStyle(fontSize: 25.0, color: Colors.blue),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.only(top: 15.0, left: 50.0, right: 50.0),
              child: Center(
                  child: Text(
                      _questions[_questionIndex]['question']?.toString() ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )))),
          Expanded(
            child: _contentGridView(),
          ),
          if (answerWasSelected && !correctAnswerSelected)
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.indigo[800]),
                
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Text('Explanation',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                                    _questions[_questionIndex]['explain']
                                            ?.toString() ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))),
                        Expanded(
                            child: TextButton(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                ),
                                onPressed: () {
                                  _nextQuestion();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))))
                      ],
                    )
                  ],
                )
                
            
                ),
          if (answerWasSelected && correctAnswerSelected)
            Container(
              padding: EdgeInsets.only(top: 30.0),
              height: 150,
              width: double.infinity,
              color: Colors.green,
              child: Column(
                children: [
                  Center(
                      child: Text('Well done, you got it right!',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  TextButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      onPressed: () {
                        _nextQuestion();
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )))
                ],
              ),
            )
        ])));
  }

  

  Widget _contentGridView() {
    return GridView.builder(
        itemCount: _questions[_questionIndex]['answers'].length ?? '',
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, childAspectRatio: 0.9),
        itemBuilder: (context, index) => Answer(
            answerText: _questions[_questionIndex]['answers'][index]
                    ['answerText']
                .toString(),
            selectedAnswer: answerSelected,
            score: _questions[_questionIndex]['answers'][index]['score'],
            answerColor: answerWasSelected
                ? _questions[_questionIndex]['answers'][index]['score'] == true
                    ? Colors.green
                    : Colors.red
                : null,
            tap: () {
              _questionAnswered(
                  _questions[_questionIndex]['answers'][index]['score']
                      .toString(),
                  _questions[_questionIndex]['answers'][index]['answerText']);
            },
            img: _questions[_questionIndex]['answers'][index]['img']
                .toString()) 
          
        );
  }
}
