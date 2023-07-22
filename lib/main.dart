import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Emeklilik Yaşı Hesaplama'),
        ),
        body: Center(
          child: RetirementAgeCalculator(),
        ),
      ),
    );
  }
}

class RetirementAgeCalculator extends StatefulWidget {
  @override
  _RetirementAgeCalculatorState createState() => _RetirementAgeCalculatorState();
}

class _RetirementAgeCalculatorState extends State<RetirementAgeCalculator> {
  TextEditingController ageController = TextEditingController();
  int retirementAge = 65; // Emeklilik yaşı (varsayılan olarak 65 yıl)

  void _calculateRetirementAge() {
    int enteredAge = int.tryParse(ageController.text) ?? 0;
    setState(() {
      retirementAge = 65 - enteredAge; // Varsayılan emeklilik yaşı 65'tir.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Emekliliğe kalan yılınız: $retirementAge',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Yaşınızı girin',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _calculateRetirementAge,
          child: Text('Emeklilik Yaşını Hesapla'),
        ),
      ],
    );
  }
}
