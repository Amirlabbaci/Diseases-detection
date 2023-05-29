import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GetStartedScreen.dart';
class CovidPreventionScreen extends StatelessWidget {
  const CovidPreventionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const GetStartedScreen() );
        },
        label: const Text('Home'),
        icon: const Icon(Icons.home),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(


        centerTitle: true ,
        title: const Text('COVID-19 Prevention'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
          Text(
          'Advice for Staying Healthy:',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          '1. Wash your hands frequently: Use soap and water for at least 20 seconds, or use hand sanitizer with at least 60% alcohol.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          '2. Wear a mask: When you are in crowded places or around people who may be sick, wear a mask to protect yourself and others.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          '3. Practice social distancing: Maintain at least 6 feet of distance from others and avoid close contact, especially in crowded areas.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          '4. Avoid large gatherings: Minimize your exposure to large gatherings or events where maintaining physical distance is challenging.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
            '5. Stay home if you\'re feeling unwell: If you have symptoms like fever, cough, or difficulty breathing, stay home and seek medical advice.',
            style: TextStyle(fontSize: 16.0),
      ),
      SizedBox(height: 8.0),
      Text(
        '6. Clean and disinfect frequently touched surfaces: Regularly clean and disinfect objects and surfaces you frequently touch.',
        style: TextStyle(fontSize: 16.0),
      ),
      SizedBox(height: 8.0),
      Text(
        '7. Follow health guidelines: Stay informed about the latest guidelines from health authorities and follow them diligently.',
        style: TextStyle(fontSize: 16.0),
      ),
      SizedBox(height: 8.0),
      Text(
        '8. Take care of your mental health: Engage in activities that help you relax, connect with loved ones, and seek support if needed.',
        style: TextStyle(fontSize: 16.0),
      ),
      ],
    ),)
    ,
    );
  }
}