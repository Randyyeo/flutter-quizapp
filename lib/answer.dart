import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  String? answerText = null;
  String? img = null;
  String? selectedAnswer = null;
  Color? answerColor = null;
  bool? score = null;
  VoidCallback? tap = null;

  Answer(
      {this.answerText,
      this.answerColor,
      this.tap,
      this.img,
      this.selectedAnswer,
      this.score});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: tap,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: answerColor != null && score.toString() == 'true' ? Colors.green : answerColor != null && answerText == selectedAnswer && score.toString() == 'false' ? Colors.red[900] : null,
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(img ?? ''), fit: BoxFit.cover)),
            child: Column(
              children: [
                Text(answerText ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                    )),
                if (answerColor != null && score.toString() == 'true')
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.check_circle,
                              color: Colors.lightGreen, size: 36.0))),
                if (answerColor != null && answerText == selectedAnswer && score.toString() == 'false')
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.cancel,
                              color: Colors.red[300], size: 36.0)))
              ],
            )));
  }
}
