import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const QuoteGenerator(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({super.key});

  @override
  _QuoteGeneratorState createState() => _QuoteGeneratorState();
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final List<String> quotes = [
    "The greatest glory in living lies not in never falling, but in rising every time we fall. - Nelson Mandela",
    "The way to get started is to quit talking and begin doing. - Walt Disney",
    "Your time is limited, so don't waste it living someone else's life. - Steve Jobs",
    "If life were predictable it would cease to be life, and be without flavor. - Eleanor Roosevelt",
    "If you look at what you have in life, you'll always have more. - Oprah Winfrey",
    "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success. - James Cameron",
    "Life is what happens when you're busy making other plans. - John Lennon",
  ];

  String currentQuote = "Click the button to generate a quote!";

  void generateQuote() {
    final randomIndex = (quotes..shuffle()).first;
    setState(() {
      currentQuote = randomIndex;
    });
  }

  void shareQuote() {
    Share.share(currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote Generator'),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  currentQuote,
                  style: const TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: generateQuote,
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[600],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Generate Quote'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: shareQuote,
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[600],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Share Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
