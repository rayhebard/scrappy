import 'package:scrappy/constants.dart';
import 'package:scrappy/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({this.bmiResult, this.resultText, this.interpret});

  final String bmiResult;
  final String resultText;
  final String interpret;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('BMI CALCULATOR')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child:
              Container(
                padding: EdgeInsets.all(15.0),
                alignment:  Alignment.bottomLeft,
                child: Text('Your Result',
                style: kTItleTextStyle)
              )
          ),
          Expanded(
          flex: 5,
          child:
            ReusableCard(
            colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,
                  style: kResultTextStyle),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpret,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            )
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonLabel: 'Re-calculate')
        ],
    ),
    );
  }
}
