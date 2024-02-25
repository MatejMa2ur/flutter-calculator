import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> stack = [];
  String input = "";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Neumorphic(
            margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
            style: const NeumorphicStyle(depth: -4),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "[ ${stack.join(",")} ]",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          input,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: StaggeredGrid.count(
              mainAxisSpacing: 5,
              crossAxisCount: 4,
              children: <Widget>[
                // 1st Row
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    'CLR',
                    context,
                    color: NeumorphicColors.accent,
                    onClicked: ClearInput
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    'POP',
                    context,
                    color: NeumorphicColors.accent,
                    onClicked: PopNumber
                  ),
                ),
                //buildButton('/', context),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '/',
                    context,
                    bgColor: NeumorphicColors.accent,
                    color: Colors.white,
                    onClicked: Division
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '*',
                    context,
                    bgColor: NeumorphicColors.accent,
                    color: Colors.white,
                    onClicked: Multiplication
                  ),
                ),

                // 2nd Row
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '7',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '8',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '9',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '-',
                    context,
                    bgColor: NeumorphicColors.accent,
                    color: Colors.white,
                    onClicked: Subtraction
                  ),
                ),

                // 3rd Row
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '4',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '5',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '6',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '+',
                    context,
                    bgColor: NeumorphicColors.accent,
                    color: Colors.white,
                    onClicked: Addition
                  ),
                ),

                // 4th Row
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '1',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '2',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '3',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 2,
                  child: buildButton(
                    'ENT',
                    context,
                    bgColor: NeumorphicColors.accent,
                    color: Colors.white,
                    onClicked: AddNumber
                  ),
                ),

                // 5th Row
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '+/-',
                    context,
                    onClicked: InvertNumber
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '0',
                    context,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: buildButton(
                    '.',
                    context,
                    onClicked: AddFloating
                  ),
                ), // buildButton('=', context),
              ],
            ),
          )
        ],
      ),
    );
  }

  void InvertNumber(){
    input = (-1 * double.parse(input)).toString();
  }

  void AddNumber(){
    stack.add(double.parse(input));
    input = "";
  }

  void PopNumber(){
    if (stack.isNotEmpty) {
      double lastNumber = stack.removeLast();
      input = lastNumber.toString();
    }
  }

  void ClearInput(){
    input = "";
  }

  void AddFloating(){
    if(!input.contains(".")){
      input += ".";
    }
  }

  void Addition() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      double result = num1 + num2;
      stack.add(result);
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  void Subtraction() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      double result = num2 - num1;    // Notice that num2 is subtracted by num1
      stack.add(result);
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  void Multiplication() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      double result = num1 * num2;
      stack.add(result);
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  void Division() {
    if (stack.length >= 2) {
      double num1 = stack.removeLast();
      double num2 = stack.removeLast();
      if (num1 != 0) {
        double result = num2 / num1;  // Notice that num2 is divided by num1
        stack.add(result);
      } else {
        print("Cannot divide by zero");
      }
    } else {
      print("Not enough elements in the stack for this operation");
    }
  }

  Widget buildButton(
    String buttonText,
    BuildContext context, {
    NeumorphicShape shape = NeumorphicShape.flat,
    Color color = Colors.black,
    Color? bgColor,
    VoidCallback? onClicked,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: NeumorphicButton(
        onPressed: () {
          setState(() {
            if (onClicked == null) {
              input += buttonText;
            } else {
              onClicked();
            }
          });
        },
        style: NeumorphicStyle(
          color: bgColor ?? Colors.blueGrey.shade100,
          shape: shape,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: color),
          ),
        ),
      ),
    );
  }
}
