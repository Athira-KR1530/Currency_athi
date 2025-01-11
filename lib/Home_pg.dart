import 'package:currency/currency_input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Currency Converter',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_NGbrHQhw7ewA9E1LHxDLKpP-xspL-2lncg&s'),
                fit: BoxFit.cover)
            ),
          ),
          // Background image from the network
          // Positioned.fill(
          //   child: Image.network(
          //     'https://www.google.com/imgres?q=image%20related%20to%20currency&imgurl=https%3A%2F%2Fcdn.pixabay.com%2Fphoto%2F2017%2F01%2F25%2F12%2F31%2Fbitcoin-2007769_640.jpg&imgrefurl=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fcurrency%2F&docid=X2nyW0EimsF30M&tbnid=5ahCy4zvujOQvM&vet=12ahUKEwjznP-Vg-2KAxVt9zgGHWFjMS4QM3oECE8QAA..i&w=640&h=449&hcb=2&ved=2ahUKEwjznP-Vg-2KAxVt9zgGHWFjMS4QM3oECE8QAA', // Replace with your image URL
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // Centered button with style
          Center(
            child: SizedBox(
              width: 200.0, // Set the desired width
              height: 50.0, // Set the desired height
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConverterPage()),
                  );
                },
                child: Text('Click Here'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 51, 53, 57), // Set the background color
                  foregroundColor: Colors.white, // Set the text color
                  textStyle: TextStyle(fontSize: 18.0), // Set the text size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
