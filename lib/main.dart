import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  _buttonPressed(String text) {
    if (text == 'Clear' || text == 'AC') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (text == '+' || text == '-' || text == '/' || text == 'X') {
      num1 = double.parse(output);

      operand = text;

      _output = '0';
    } else if (text == '.') {
      if (_output.contains('.')) {
        return;
      } else {
        _output += text;
      }
    } else if (text == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output += text;
    }
    print(text);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            1000,
          ),
        ),
        color: color,
        child: Container(
          padding: EdgeInsets.all(
            20,
          ),
          child: GestureDetector(
            onTap: () => _buttonPressed(text),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 20,
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 35,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('AC', Colors.orange),
                    buildButton('0', Colors.orange),
                    buildButton('%', Colors.orange),
                    buildButton('/', Colors.orange),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('7', Colors.white),
                    buildButton('8', Colors.white),
                    buildButton('9', Colors.white),
                    buildButton('X', Colors.orange),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('4', Colors.white),
                    buildButton('5', Colors.white),
                    buildButton('6', Colors.white),
                    buildButton('-', Colors.orange),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('1', Colors.white),
                    buildButton('2', Colors.white),
                    buildButton('3', Colors.white),
                    buildButton('+', Colors.orange),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('Clear', Colors.white),
                    buildButton('.', Colors.white),
                    buildButton('=', Colors.orange),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}
