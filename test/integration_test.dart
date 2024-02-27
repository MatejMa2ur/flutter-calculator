import 'package:calculator/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// Replace with your app name

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Change name of test to something that makes sense for your app
  testWidgets('Test MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

  });
}