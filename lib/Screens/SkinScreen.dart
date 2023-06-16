import 'package:covid19_test/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/SkinController.dart';
import 'SkinScreen.dart';
import 'Symptoms.dart';

class SkinScreen extends StatelessWidget {
   SkinScreen({Key? key}) : super(key: key);

  final controller = Get.put(SkinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/dry-skin.png'),
              width: 180,
              height: 300,

            ),
            Obx(
              ()=> Column(
                children: [
                  controller.isLoading.value ? const Text('Waiting for result ...' , style: TextStyle(fontSize: 18),) : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(text: 'Take image', onPressed: () {
                    controller.takeImage();
                    // Get.to(const SymptomsScreen() , transition: Transition.rightToLeft);

                  }),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
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
          child: controller.isLoading.value ? const SizedBox(height: 30,width: 30,child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5) ,) : Text(
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
