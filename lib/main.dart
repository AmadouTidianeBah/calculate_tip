import 'package:calculate_tip/MyTextField.dart';
import 'package:calculate_tip/tip_calculator_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TipCalculatorModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tipCalculator = Provider.of<TipCalculatorModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Calculate Tip",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20,),
            MyTextField(
              controller: tipCalculator.amountController,
              hintText: "Bill amount",
              icon: Icons.money,
            ),
            const SizedBox(height: 16,),
            MyTextField(
              controller: tipCalculator.percentageController,
              hintText: "Tip percentage 15%",
              icon: Icons.percent,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Round up tip?",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                CupertinoSwitch(
                  value: tipCalculator.isTipActive,
                  onChanged: (value) {
                    tipCalculator.updateIsTipActive(value);
                  },
                  activeColor: Colors.teal.shade400,
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Center(
              child: Text(
                "Tip Amount: \$${tipCalculator.tipAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


