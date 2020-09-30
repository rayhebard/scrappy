import 'package:scrappy/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../calculator_brain.dart';


enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   Gender selectedGender;
   int height = 180;
   int weight = 60;
   int age = 1;
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
      child: Row(
            children: <Widget> [
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent( icon: FontAwesomeIcons.mars, label: 'MALE',),
                    colour: selectedGender == Gender.male ?
                            kCardColor: kInactiveCardColour,)
              ),
              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                    colour: selectedGender == Gender.female ?
                          kCardColor: kInactiveCardColour,
                  )
               ),
             ]
            )),
          Expanded(
              child: ReusableCard(
                colour: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style:kLabelTextStyle,
                      )
                    ],),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTickMarkColor: Color(0xff8d8e98),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                          thumbColor: kBottomContainerColor
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 420.0,
                        onChanged:(double newValue){
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                      style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              }),
                          SizedBox(),
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                }),
                        ],
                      )
                    ],
                  ),
                  )
              ),
              Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(),
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),)
              ),
            ],
          )),
          BottomButton( onTap: (){
            CalculatorBrain calc = CalculatorBrain(ht: height, wt: weight);

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return ResultsPage( bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpret: calc.getInterpretation(),);
                }
                )
            );
          }, buttonLabel: 'Calculate',)
        ],
      )
    );
  }
}










