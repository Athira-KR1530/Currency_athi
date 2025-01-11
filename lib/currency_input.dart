import 'package:flutter/material.dart';
import 'final_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final TextEditingController amountController = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'INR';
  double conversionResult = 0.0;


Future<void> convertCurrency() async {
  final String apiUrl =
      'https://v6.exchangerate-api.com/v6/b8265c44c3812742421078dc/latest/USD';
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rate = data['conversion_rates'][toCurrency];
      setState(() {
        conversionResult = rate * double.parse(amountController.text);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: conversionResult,
          ),
        ),
      );
    } else {
      setState(() {
        conversionResult = 0.0;
      });
      print("Error: ${response.statusCode}, ${response.body}");
    }
  } catch (e) {
    print("Exception: $e");
    setState(() {
      conversionResult = 0.0;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter', style: TextStyle(color: Colors.green[200]),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
Text( 'From Currency', style: TextStyle(fontSize: 16, ), ),

            DropdownButton<String>(
  value: fromCurrency,
  onChanged: (String? newValue) {
    setState(() {
      fromCurrency = newValue!;
    });
  },
  items: <String>['USD', 'INR', 'EUR', 'GBP']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
),
SizedBox(height: 16.0), Text( 'To Currency', style: TextStyle(fontSize: 16,), ),
DropdownButton<String>(
  value: toCurrency,
  onChanged: (String? newValue) {
    setState(() {
      toCurrency = newValue!;
    });
  },
  items: <String>['USD', 'INR', 'EUR', 'GBP']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
),
//  SizedBox(height: 8.0),
//             ElevatedButton(
//               onPressed: convertCurrency,
//               child: Text('Convert'),
//             ),
SizedBox(
  width: 50.0, 
  height: 50.0, 
  child: ElevatedButton(
    onPressed: convertCurrency,
    child: Text('Convert'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, 
      foregroundColor: Colors.white, 
      textStyle: TextStyle(fontSize: 18.0), 
    ),
  ),),],
        ),
      ),
    );
  }
}
