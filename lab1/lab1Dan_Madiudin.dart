import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CreditApp());
}

class CreditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Estimator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CreditEstimator(),
    );
  }
}

class CreditEstimator extends StatefulWidget {
  @override
  _CreditEstimatorState createState() => _CreditEstimatorState();
}

class _CreditEstimatorState extends State<CreditEstimator> {
  final TextEditingController _inputAmount = TextEditingController();
  final TextEditingController _inputRate = TextEditingController();
  double _duration = 1;
  double _monthlyInstallment = 0;

  void _computeInstallment() {
    final double principal = double.tryParse(_inputAmount.text) ?? 0;
    final double rate = double.tryParse(_inputRate.text) ?? 0;
    final double monthlyRate = (rate / 100) / 12;

    if (principal > 0 && rate > 0 && _duration > 0) {
      _monthlyInstallment = principal * monthlyRate / (1 - pow(1 + monthlyRate, -_duration));
    } else {
      _monthlyInstallment = 0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Estimator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Introduceți suma împrumutată',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _inputAmount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Suma',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selectați numărul de luni',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _duration,
              min: 1,
              max: 72,
              divisions: 71,
              label: '${_duration.toInt()} luni',
              onChanged: (double val) {
                setState(() {
                  _duration = val;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Introduceți dobânda lunară',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _inputRate,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Dobândă',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Suma lunară estimată este:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 12),
            Text(
              '${_monthlyInstallment.toStringAsFixed(2)}€',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _computeInstallment,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), 
                backgroundColor: Colors.green, 
              ),
              child: Text(
                'Calculează',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
