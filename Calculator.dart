import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _result = '';
  String _typedValue = '';
  double _value = 0.0;
  String _operation = '';

  void _handleNumber(String number) {
    setState(() {
      _typedValue += number;
    });
  }

  void _handleOperation(String operation) {
    setState(() {
      if (_value == 0.0) {
        _value = double.parse(_typedValue);
      } else {
        _calculate();
      }
      _typedValue = _value.toString() + ' ' + operation + ' ';
      _operation = operation;
    });
  }

  void _handleEquals() {
    setState(() {
      _calculate();
      _operation = '';
    });
  }

  void _clear() {
    setState(() {
      _result = '';
      _typedValue = '';
      _value = 0.0;
      _operation = '';
    });
  }

  void _backspace() {
    setState(() {
      if (_typedValue.isNotEmpty) {
        _typedValue = _typedValue.substring(0, _typedValue.length - 1);
      }
    });
  }

  void _calculate() {
    double value = double.parse(_typedValue.split(_operation).last);
    switch (_operation) {
      case '+':
        _value = _value + value;
        break;
      case '-':
        _value = _value - value;
        break;
      case '×':
        _value = _value * value;
        break;
      case '÷':
        if (value != 0.0) {
          _value = _value / value;
        }
        break;
      case '%':
        _value = _value % value;
        break;
      default:
        break;
    }
    _result = _value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 40),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _typedValue.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      _result,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ), //Answer display
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: _clear,
                        icon: Icon(
                          Icons.copyright_sharp,
                          size: 50,
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: _backspace,
                        icon: Icon(
                          Icons.backspace,
                          size: 50,
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleOperation('%'),
                        icon: Icon(
                          Icons.percent,
                          size: 50,
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleOperation('÷'),
                        icon: Icon(CupertinoIcons.divide, size: 50)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('7'),
                        icon: Text(
                          '7',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('8'),
                        icon: Text(
                          '8',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('9'),
                        icon: Text(
                          '9',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleOperation('×'),
                        icon: Icon(CupertinoIcons.multiply, size: 50)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('4'),
                        icon: Text(
                          '4',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('5'),
                        icon: Text(
                          '5',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('6'),
                        icon: Text(
                          '6',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleOperation('-'),
                        icon: Icon(CupertinoIcons.minus, size: 50)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('1'),
                        icon: Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('2'),
                        icon: Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('3'),
                        icon: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleOperation('+'),
                        icon: Icon(CupertinoIcons.add, size: 50)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: null,
                        icon: Text(
                          '',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('0'),
                        icon: Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                        onPressed: () => _handleNumber('.'),
                        icon: Text(
                          '.',
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton.filled(
                      onPressed: _handleEquals,
                      icon: Icon(CupertinoIcons.equal, size: 50),
                    ),
                  ),
                ],
              ),
            ) //Row4
          ],
        ),
      ),
    );
  }
}
