import 'package:covid19_test/Screens/GetStartedScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkinResultPage extends StatelessWidget {
  const SkinResultPage({super.key , required this.code, required this.result});
  final int code;
  final String result;


  @override
  Widget build(BuildContext context) {
    final title;
    final reslutColor;
    if (code == 0) {
       title = 'Your skin is normal';
       reslutColor = Colors.green;
    }
    else {
       title = 'Acne disease detected';
       reslutColor = Colors.red;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const SizedBox(
                height: 30,
              ),
              Text(
                  title,
                  style:  TextStyle(fontSize: 26, fontWeight: FontWeight.bold ,
                      color: reslutColor)
              ),
              const SizedBox(
                height: 20,
              ),
              // danger image
              Image(
                image: AssetImage(code == 0 ? 'assets/safe.png' : 'assets/danger.png'),
                color: reslutColor,
                width: 130,
                height: 130,
              ),
              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(result, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
              ),

              const SizedBox(
                height: 30,
              ),
              // what to do next button
              ElevatedButton(
                onPressed: () {
                  Get.offAll(const GetStartedScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: reslutColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.home),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'HOME',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

}
