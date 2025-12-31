import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(ScientificCalApp());
}

class ScientificCalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  String result = '';

  // Button Click Logic
  void onBtnClick(String text) {
    setState(() {
      if (text == "AC") {
        display = '0';
        result = '';
      } else if (text == "=") {
        // මෙතැනදී ගණනය කිරීම් සිදු වේ
        result = "Calculated Result"; 
      } else {
        if (display == '0') display = text;
        else display += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menul Scientific Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Display Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(display, style: TextStyle(fontSize: 32, color: Colors.white70)),
                  Text(result, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                ],
              ),
            ),
          ),
          
          // Menu Options (Converter)
          Container(
            height: 50,
            color: Colors.blueGrey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: Text("Currency", style: TextStyle(color: Colors.white))),
                TextButton(onPressed: () {}, child: Text("Unit (cm/m)", style: TextStyle(color: Colors.white))),
              ],
            ),
          ),

          // Buttons Section
          Container(
            padding: EdgeInsets.all(10),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ...['sin', 'cos', 'tan', 'AC', 
                   '7', '8', '9', '/', 
                   '4', '5', '6', 'x', 
                   '1', '2', '3', '-', 
                   '0', '.', '=', '+'].map((btn) => 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (btn == 'AC' || btn == '=') ? Colors.orange : Colors.grey[850],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    onPressed: () => onBtnClick(btn),
                    child: Text(btn, style: TextStyle(fontSize: 18, color: Colors.white)),
                  )
                ).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}