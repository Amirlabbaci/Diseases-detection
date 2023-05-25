import 'package:covid19_test/Screens/GetStartedScreen.dart';
import 'package:covid19_test/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CovidInfectedAdviceScreen extends StatelessWidget {
  const CovidInfectedAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const GetStartedScreen() );
        },
        label: const Text('Home'),
        icon: const Icon(Icons.home),
        backgroundColor: Colors.redAccent,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COVID-19 Advice'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Advice for COVID-19 Patients:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Isolate yourself: Stay in a separate room away from others, and use a separate bathroom if possible.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '2. Wear a mask: When you are around other people or animals, wear a mask to prevent the spread of the virus.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '3. Wash your hands frequently: Use soap and water for at least 20 seconds, or use hand sanitizer with at least 60% alcohol.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '4. Monitor your symptoms: Keep track of any changes in your symptoms and seek medical help if necessary.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '5. Stay hydrated: Drink plenty of fluids, such as water, herbal tea, and soup, to stay hydrated.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '6. Rest and take care of yourself: Get enough sleep, eat nutritious meals, and engage in activities that help you relax.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '7. Follow medical advice: Cooperate with healthcare professionals, take prescribed medications, and attend follow-up appointments.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '8. Inform close contacts: Notify people you have been in close contact with, so they can take necessary precautions.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '9. Stay informed: Stay updated with reliable sources for the latest information and guidelines on COVID-19.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
