import 'package:covid19_test/Constants.dart';
import 'package:covid19_test/Screens/Checktype.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Motivation.dart';
import 'Symptoms.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/covid.png'),
              width: 160,
              height: 160,
            ),

            Column(
              children: [
                CustomButton(text: 'Motivation', onPressed: () {
                  Get.to(const MotivationScreen(), transition: Transition.rightToLeft);
                }),

                const SizedBox(
                  height: 60,
                ),
                CustomButton(text: 'Check', onPressed: () {
                  Get.to(const Checktype() , transition: Transition.rightToLeft);
                }),
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget CustomButton({String? text, void Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 220,
        height: 70,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text(
            text!,//! not null text
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFFf3fff0)),
          ),
        ),
      ),
    );
  }

}
