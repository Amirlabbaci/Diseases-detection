import 'package:covid19_test/Constants.dart';
import 'package:flutter/material.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid-19 Motivations'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Section(
                  title: 'What is Covid-19',
                  text:
                      'Coronavirus disease (COVID-19) is an infectious disease caused by the SARS-CoV-2 virus. Most people who fall sick with COVID-19 will experience mild to moderate symptoms and recover without special treatment.'),
              Section(
                  title: 'Covid-19 symptoms',
                  text:
                      'Most common symptoms: fever, dry cough, tiredness. Less common symptoms: aches and pains, sore throat, diarrhoea, conjunctivitis, headache, loss of taste or smell, a rash on skin, or discolouration of fingers or toes. Serious symptoms: difficulty breathing or shortness of breath, chest pain or pressure, loss of speech or movement. Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility. People with mild symptoms who are otherwise healthy should manage their symptoms at home. On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days.'),
              Section(
                  title: 'Covid-19 Statistics',
                  text:
                      'Total Cases: 689,156,586\nTotal Deaths: 6,881,718\nTotal Recovered: 661,552,928\nActive Cases: 20,721,940\nCritical Cases: 38,214\nTotal Tests: 25,66,26,850\nTotal Vaccinations: 12,095,905,035\n'),
            ],
          ),
        ),
      ),
    );
  }

  Widget Section({required String title, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: ThemeData().copyWith(
          dividerColor: Colors.transparent,
          dividerTheme: const DividerThemeData(
            color: Colors.transparent,
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor ),

        ),
        child: ExpansionTile(
          title: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
            )
          ],
          onExpansionChanged: (value) {
            // isExpanded = value;
          },
        ),
      ),
    );
  }
}
