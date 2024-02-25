import 'package:calculator/HomePage.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'RPN Calculator',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Colors.blueGrey.shade100,
        lightSource: LightSource.topLeft,
        depth: 4,
      ),
      home: MyHomePage(),
    );
  }
}
