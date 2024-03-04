import 'package:calculator/Service/CalculatorService.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalculatorService calculator = CalculatorService();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: LayoutBuilder(
        // added LayoutBuilder
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
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
                                  "[ ${calculator.stack.join(",")} ]",
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
                                  calculator.input,
                                  key: const Key("Display"),
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
                          child: buildButton('CLR', context, const Key('CLR'),
                              color: NeumorphicColors.accent,
                              onClicked: calculator.clearInput),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('POP', context, const Key('POP'),
                              color: NeumorphicColors.accent,
                              onClicked: calculator.popNumber),
                        ),
                        //buildButton('/', context),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('/', context, const Key('/'),
                              bgColor: NeumorphicColors.accent,
                              color: Colors.white,
                              onClicked: calculator.division),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('*', context, const Key('*'),
                              bgColor: NeumorphicColors.accent,
                              color: Colors.white,
                              onClicked: calculator.multiplication),
                        ),

                        // 2nd Row
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '7',
                            context,
                            const Key('7'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '8',
                            context,
                            const Key('8'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '9',
                            context,
                            const Key('9'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('-', context,
                              const Key('-'),
                              bgColor: NeumorphicColors.accent,
                              color: Colors.white,
                              onClicked: calculator.subtraction),
                        ),

                        // 3rd Row
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '4',
                            context,
                            const Key('4'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '5',
                            context,
                            const Key('5'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '6',
                            context,
                            const Key('6'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('+', context,
                              const Key('+'),
                              bgColor: NeumorphicColors.accent,
                              color: Colors.white,
                              onClicked: calculator.addition),
                        ),

                        // 4th Row
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '1',
                            context,
                            const Key('1'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '2',
                            context,
                            const Key('2'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '3',
                            context,
                            const Key('3'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: buildButton('ENT', context,
                              const Key('ENT'),
                              bgColor: NeumorphicColors.accent,
                              color: Colors.white,
                              onClicked: calculator.addNumber),
                        ),

                        // 5th Row
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('+/-', context,
                              const Key('+/-'),
                              onClicked: calculator.invertNumber),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton(
                            '0',
                            context,
                            const Key('0'),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: buildButton('.', context,
                              const Key('.'),
                              onClicked: calculator.addFloating),
                        ), // buildButton('=', context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildButton(
    String buttonText,
    BuildContext context,
    Key? key, {
    NeumorphicShape shape = NeumorphicShape.flat,
    Color color = Colors.black,
    Color? bgColor,
    VoidCallback? onClicked,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: NeumorphicButton(
        key: key,
        onPressed: () {
          setState(() {
            if (onClicked == null) {
              calculator.input += buttonText;
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
