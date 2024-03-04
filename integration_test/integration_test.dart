import 'package:calculator/Service/CalculatorService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Enter a number', (tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.displayText(), equals(''));

    await tester.enterDigits('23');
    expect(find.displayText(), equals('23'));
  });

  testWidgets('Clear input', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterDigits('456');
    await tester.tapByKey(Key('CLR'));
    await tester.pumpAndSettle();

    expect(find.displayText(), equals(''));
  });

  testWidgets('Pop stack', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterDigits('456');
    await tester.tapByKey(Key('ENT'));
    await tester.pumpAndSettle();

    expect(find.displayText(), equals(''));

    await tester.tapByKey(Key('POP'));
    await tester.pumpAndSettle();
    expect(find.displayText(), equals('456.0'));
  });

  testWidgets('Addition', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterDigits('25');
    await tester.tapByKey(Key('ENT'));
    await tester.enterDigits('30');
    await tester.tapByKey(Key('ENT'));
    await tester.tapByKey(Key('+'));
    await tester.pumpAndSettle();

    await tester.tapByKey(Key('POP'));
    await tester.pumpAndSettle();
    expect(find.displayText(), equals('55.0'));
  });

  testWidgets('Substraction', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterDigits('30');
    await tester.tapByKey(Key('ENT'));
    await tester.enterDigits('25');
    await tester.tapByKey(Key('ENT'));
    await tester.tapByKey(Key('-'));

    await tester.tapByKey(Key('POP'));
    await tester.pumpAndSettle();
    expect(find.displayText(), equals('5.0'));
  });

  testWidgets('Multiplication', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterDigits('3');
    await tester.tapByKey(Key('ENT'));
    await tester.enterDigits('4');
    await tester.tapByKey(Key('ENT'));
    await tester.tapByKey(Key('*'));

    await tester.tapByKey(Key('POP'));
    await tester.pumpAndSettle();
    expect(find.displayText(), equals('12.0'));
  });

  testWidgets('Division', (tester) async {
    await tester.pumpWidget(MyApp());

    await tester.enterDigits('12');
    await tester.tapByKey(Key('ENT'));
    await tester.enterDigits('4');
    await tester.tapByKey(Key('ENT'));
    await tester.tapByKey(Key('/'));

    await tester.tapByKey(Key('POP'));
    await tester.pumpAndSettle();
    expect(find.displayText(), equals('3.0'));
  });
}

extension TesterExtensions on WidgetTester {
  Future<void> enterDigits(String digits) async {
    for (var digit in digits.split('')) {
      await tapByKey(Key(digit));
      await pumpAndSettle();
    }
  }

  Future<void> tapByKey(Key key) async {
    await tap(find.byKey(key));
  }
}

extension FinderExtensions on CommonFinders {
  String? displayText() {
    final text = byKey(const Key("Display")).evaluate().single.widget as Text;
    return text.data;
  }
}