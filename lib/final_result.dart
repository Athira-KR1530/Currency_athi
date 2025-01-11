import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double result;

  ResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Converting Result', style: TextStyle(color: Colors.green[200]),),
      ),
      body: Center(
        child: Text(
          'Amount: $result',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.red[900]
          ),
        ),
      ),
    );
  }
}
