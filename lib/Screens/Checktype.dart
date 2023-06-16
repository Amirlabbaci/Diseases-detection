import 'package:covid19_test/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SkinScreen.dart';
import 'Symptoms.dart';

class Checktype extends StatelessWidget {
  const Checktype({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/examination.png'),
              width: 180,
              height: 300,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                CustomButton(text: 'Respiratory Check', onPressed: () {
                  Get.to(const SymptomsScreen() , transition: Transition.rightToLeft);
                }),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(text: 'Skin Check', onPressed: () {
                  Get.to(const SkinScreen(), transition: Transition.rightToLeft);
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
