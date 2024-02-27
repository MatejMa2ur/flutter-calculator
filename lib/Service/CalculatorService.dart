import 'package:calculator/Service/Abstract/ICalculatorService.dart';

class CalculatorService implements ICalculatorService {
  List<double> stack = [];
  String input = "";

  @override
  void invertNumber(){
    double temp = -1 * double.parse(input);
    if (temp == temp.toInt()) {
      input = temp.toInt().toString();
    } else {
      input = temp.toString();
    }
  }

  @override
  void addNumber(){
    stack.add(double.parse(input));
    input = "";
  }

  @override
  void popNumber(){
    if (stack.isNotEmpty) {
      double lastNumber = stack.removeLast();
      input = lastNumber.toString();
    }
  }

  @override
  void clearInput(){
    input = "";
  }

  @override
  void addFloating(){
    if(!input.contains(".")){
      input += ".";
    }
  }

  @override
  void addition() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      double result = num1 + num2;
      stack.add(result);
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  @override
  void subtraction() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      double result = num2 - num1;    // Notice that num2 is subtracted by num1
      stack.add(result);
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  @override
  void multiplication() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      double result = num1 * num2;
      stack.add(result);
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  @override
  void division() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      if (num1 != 0) {
        double result = num2 / num1;  // Notice that num2 is divided by num1
        stack.add(result);
      } else {
        stack.add(num2);
        stack.add(num1);
        print("Cannot divide by zero");
      }
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }
}