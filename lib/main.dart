import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortoperforme;
  void btnClicked(String btnValue) {
    if (btnValue == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnValue == "+" ||
        btnValue == "-" ||
        btnValue == "x" ||
        btnValue == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperforme = btnValue;
    } else if (btnValue == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperforme == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperforme == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperforme == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperforme == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = texttodisplay + btnValue;
      // int.parse(texttodisplay + btnValue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String btnValue) {
    return Expanded(
        child: OutlinedButton(
            onPressed: () => btnClicked(btnValue),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                btnValue,
                style: const TextStyle(fontSize: 25),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: Text(
              texttodisplay,
              style: const TextStyle(fontSize: 30),
            ),
          )),
          Row(
            children: [
              customButton('9'),
              customButton('8'),
              customButton('7'),
              customButton('+'),
            ],
          ),
          Row(
            children: [
              customButton('6'),
              customButton('5'),
              customButton('4'),
              customButton('-'),
            ],
          ),
          Row(
            children: [
              customButton('3'),
              customButton('2'),
              customButton('1'),
              customButton('x'),
            ],
          ),
          Row(
            children: [
              customButton('C'),
              customButton('0'),
              customButton('='),
              customButton('/'),
            ],
          ),
        ],
      ),
    );
  }
}
