import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String input = '';
  String output = '0';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        output = '0';
      } else if (value == '⌫') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == '=') {
        try {
          // Ganti simbol agar bisa dihitung
          String expression = input
              .replaceAll('×', '*')
              .replaceAll('÷', '/')
              .replaceAll('%', '/100');
          double result = _evaluate(expression);
          output = result.toStringAsFixed(
            result.truncateToDouble() == result ? 0 : 2,
          );
        } catch (e) {
          output = 'Error';
        }
      } else {
        input += value;
      }
    });
  }

  double _evaluate(String expr) {
    try {
      // Evaluasi sederhana (tanpa library external)
      expr = expr.replaceAll(' ', '');
      List<String> tokens = _tokenize(expr);
      return _calculate(tokens);
    } catch (e) {
      return double.nan;
    }
  }

  List<String> _tokenize(String expr) {
    final tokens = <String>[];
    String number = '';
    for (int i = 0; i < expr.length; i++) {
      String c = expr[i];
      if ('0123456789.'.contains(c)) {
        number += c;
      } else {
        if (number.isNotEmpty) {
          tokens.add(number);
          number = '';
        }
        tokens.add(c);
      }
    }
    if (number.isNotEmpty) tokens.add(number);
    return tokens;
  }

  double _calculate(List<String> tokens) {
    // Operasi kali dan bagi dulu
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == '×' || tokens[i] == '*') {
        double a = double.parse(tokens[i - 1]);
        double b = double.parse(tokens[i + 1]);
        tokens[i - 1] = (a * b).toString();
        tokens.removeRange(i, i + 2);
        i--;
      } else if (tokens[i] == '÷' || tokens[i] == '/') {
        double a = double.parse(tokens[i - 1]);
        double b = double.parse(tokens[i + 1]);
        tokens[i - 1] = (a / b).toString();
        tokens.removeRange(i, i + 2);
        i--;
      }
    }

    // Lalu tambah dan kurang
    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double val = double.parse(tokens[i + 1]);
      if (op == '+' || op == '＋') result += val;
      if (op == '-' || op == '－') result -= val;
    }
    return result;
  }

  Widget buildButton(String text, {Color? color, Color? textColor}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.grey[200],
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () => _onButtonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: textColor ?? Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonList = [
      ['C', '⌫', '%', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['0', '.', '='],
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Layar hasil
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: const TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      output,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tombol kalkulator
            Column(
              children: buttonList.map((row) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: row.map((text) {
                      final isOperator = [
                        '÷',
                        '×',
                        '-',
                        '+',
                        '=',
                      ].contains(text);
                      final color = isOperator
                          ? Colors.orange
                          : Colors.grey[200];
                      final textColor = isOperator
                          ? Colors.white
                          : Colors.black;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: buildButton(
                            text,
                            color: color,
                            textColor: textColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
