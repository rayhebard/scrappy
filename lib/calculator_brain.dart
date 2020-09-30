import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.ht, this.wt});
  final int ht;
  final int wt;
  double _bmi;

  String calculateBMI(){
    _bmi = wt / pow(ht/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5){
      return 'Normal';
    }else {
      return 'Athlete';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5){
      return 'You have a normal body weight. Good job';
    }else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}