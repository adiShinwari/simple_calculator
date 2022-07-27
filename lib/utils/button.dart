import 'package:flutter/material.dart';

import '../provider/calcProvider.dart';
  Widget buildButton(String text, double buttonHeight, Color buttonColor,
      CalcProvider provider,BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight,
      color: buttonColor,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1,
            ),
          ),
        ),
        onPressed: () {
          buttonPressed(text, provider);
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }
  buttonPressed(String buttonText, CalcProvider provider) {
    if (buttonText == 'C') {
      provider.clear();
    } else if (buttonText == '⌫') {
      provider.crossLastOne();
    } else if (buttonText == '=') {
      provider.calculate();
    } else {
      provider.makeEquation(buttonText);
    }
  }