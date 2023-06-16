import 'package:covid19_test/Constants.dart';
import 'package:flutter/material.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Diseases Motivation '),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(// ensures that the content can be scrolled if it exceeds the screen height
        child: SafeArea(//ensures that the content is displayed within the safe area of the screen
          child: Column(
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
                  title: 'What is Acne ',
                  text:
                  'Acne is a common skin condition that happens when hair follicles under the skin become clogged. Sebum—oil that helps keep skin from drying out—and dead skin cells plug the pores, which leads to outbreaks of lesions, commonly called pimples or zits.'),
              Section(
                  title: 'Acne Types',
                  text:
                  'Whiteheads: Plugged hair follicles that stay beneath the skin and produce a white bump.'
                      '\nBlackheads: Plugged follicles that reach the surface of the skin and open up. They look black on the skin surface because the air discolors the sebum, not because they are dirty.'
                      '\nPapules: Inflamed lesions that usually appear as small, pink bumps on the skin and can be tender to the touch.'
                      '\nPustules or pimples: Papules topped by white or yellow pus-filled lesions that may be red at the base.'
                      '\nNodules: Large, painful solid lesions that are lodged deep within the skin.'
                      '\nSevere nodular acne (sometimes called cystic acne): Deep, painful, pus-filled lesions.'),
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
