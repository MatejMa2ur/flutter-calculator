import 'package:calculator/Service/CalculatorService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorService', () {
    late CalculatorService calculatorService;

    setUp(() {
      calculatorService = CalculatorService();
    });

    test('Test invertNumber method', () {
      calculatorService.input = "5";
      calculatorService.invertNumber();
      expect(calculatorService.input, "-5");
    });

    test('Test addNumber method', () {
      calculatorService.input = "3";
      calculatorService.addNumber();
      expect(calculatorService.stack.isNotEmpty, true);
      expect(calculatorService.stack.last, 3.0);
      expect(calculatorService.input, "");
    });

    test('Test popNumber method', () {
      calculatorService.stack.add(7.0);
      calculatorService.popNumber();
      expect(calculatorService.input, "7.0");
      expect(calculatorService.stack.isEmpty, true);
    });

    test('Test clearInput method', (){
      calculatorService.input = "42";
      calculatorService.clearInput();
      expect(calculatorService.input, "");
    });

    test('Test addFloating method when there is no existing decimal point', () {
      calculatorService.input = "5";
      calculatorService.addFloating();
      expect(calculatorService.input, "5.");
    });

    test('Test addFloating method when there is an existing decimal point', () {
      calculatorService.input = "5.0";
      calculatorService.addFloating();
      expect(calculatorService.input, "5.0");
    });

    test('Test addition', () {
      calculatorService.stack.add(3.0);
      calculatorService.stack.add(5.0);
      calculatorService.addition();
      expect(calculatorService.stack.single, 8.0);
    });

    test('Test subtraction', () {
      calculatorService.stack.add(5.0);
      calculatorService.stack.add(3.0);
      calculatorService.subtraction();
      expect(calculatorService.stack.single, 2.0);
    });

    test('Test multiplication', () {
      calculatorService.stack.add(3.0);
      calculatorService.stack.add(5.0);
      calculatorService.multiplication();
      expect(calculatorService.stack.single, 15.0);
    });

    test('Test division', () {
      calculatorService.stack.add(15.0);
      calculatorService.stack.add(3.0);
      calculatorService.division();
      expect(calculatorService.stack.single, 5.0);
    });

    test('Test division by zero', () {
      calculatorService.stack.add(10.0);
      calculatorService.stack.add(0.0);
      calculatorService.division();
      expect(calculatorService.stack.length, 2);
    });

  });

}