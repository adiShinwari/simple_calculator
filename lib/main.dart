import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scientific_calculator/provider/calcProvider.dart';
import 'package:scientific_calculator/utils/button.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalcProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const ScientificCalculator(),
      ),
    );
  }
}

class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({Key? key}) : super(key: key);

  @override
  State<ScientificCalculator> createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalcProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Consumer<CalcProvider>(
              builder: ((context, value, child) => Text(
                    value.equation,
                    style: TextStyle(fontSize: value.equationFontSize),
                  )),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
            child: Consumer<CalcProvider>(
              builder: ((context, value, child) => Text(
                    value.result,
                    style: TextStyle(fontSize: value.resultFontSize),
                  )),
            ),
          ),
          const Expanded(
            child: Divider(
              height: 5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton(
                            'C', 0.1, Colors.redAccent, provider, context),
                        buildButton('⌫', 0.1, Colors.purple, provider, context),
                        buildButton('÷', 0.1, Colors.purple, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(
                            '7', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '8', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '9', 0.1, Colors.black54, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(
                            '4', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '5', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '6', 0.1, Colors.black54, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(
                            '1', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '2', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '3', 0.1, Colors.black54, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(
                            '.', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '0', 0.1, Colors.black54, provider, context),
                        buildButton(
                            '00', 0.1, Colors.black54, provider, context),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('×', 0.1, Colors.purple, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('-', 0.1, Colors.purple, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('+', 0.1, Colors.purple, provider, context),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(
                            '=', 0.2, Colors.redAccent, provider, context),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
