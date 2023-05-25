import 'package:covid19_test/Screens/CovidInfectedAdviceScreen.dart';
import 'package:covid19_test/Screens/CovidPreventionScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ResultPage extends StatelessWidget {
   const ResultPage({Key? key,  required this.code, required this.result})
      : super(key: key);
  final int code;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const SizedBox(
              height: 30,
            ),
            Text(
              code == 1 ? 'You are safe' : 'You are infected',
              style:  TextStyle(fontSize: 26, fontWeight: FontWeight.bold ,
              color: code == 1 ? Colors.green : Colors.red)
            ),
            const SizedBox(
              height: 20,
            ),
            // danger image
            Image(
              image: AssetImage(code == 1 ? 'assets/safe.png' : 'assets/danger.png'),
              color: code == 1 ? Colors.green : Colors.redAccent,
              width: 130,
              height: 130,
            ),
            const SizedBox(
              height: 30,
            ),

            Text(result, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),

            const SizedBox(
              height: 30,
            ),
            // what to do next button
            ElevatedButton(
              onPressed: () {
                if (code == 0) {
                  Get.off(() => const CovidInfectedAdviceScreen());
                }
                else{
                  Get.off(() => const CovidPreventionScreen());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: code == 1 ? Colors.green :  Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('What to do next?'),
            ),
          ],
        ),
      ),
    );
  }
}
