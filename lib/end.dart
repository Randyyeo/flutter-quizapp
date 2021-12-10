import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class End extends StatelessWidget {
  int score;
  End({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
              top: 200.0, bottom: 10.0, left: 30.0, right: 30.0),
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Center(
              child: Text('Total Score',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )))),
      Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(score.toString(),
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold))),
      Expanded(child: Container(
        alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          margin: EdgeInsets.only( bottom: 50.0),
          height: 70.0,
          child: TextButton(
            
              child: Text(
                'Restart',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
                ;
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )))),)
      
    ])));
  }
}
