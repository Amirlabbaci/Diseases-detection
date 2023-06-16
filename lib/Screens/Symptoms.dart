import 'package:covid19_test/Constants.dart';
import 'package:covid19_test/Screens/RecordCoughScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/CheckController.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  final controller = Get.put(CheckController());
//The CheckController is a custom controller responsible for managing the state of the checkboxes used to check symptoms.
  @override
  Widget build(BuildContext context) {
    //The Obx widget is used from GetX to observe changes in the state of the
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Step 1:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Check your symptoms',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Fever or chills',
                    value: controller.fever_or_chills.value,
                    onChanged: () {
                      controller.fever_or_chills.value =
                          !controller.fever_or_chills.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Shortness of breath or difficulty breathing',
                    value: controller.shortness_of_breath.value,
                    onChanged: () {
                      controller.shortness_of_breath.value =
                          !controller.shortness_of_breath.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Fatigue',
                    value: controller.fatigue.value,
                    onChanged: () {
                      controller.fatigue.value = !controller.fatigue.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Muscle or body aches',
                    value: controller.muscle_or_body_aches.value,
                    onChanged: () {
                      controller.muscle_or_body_aches.value =
                          !controller.muscle_or_body_aches.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Headache',
                    value: controller.headache.value,
                    onChanged: () {
                      controller.headache.value = !controller.headache.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Loss of taste or smell',
                    value: controller.loss_of_taste_or_smell.value,
                    onChanged: () {
                      controller.loss_of_taste_or_smell.value =
                          !controller.loss_of_taste_or_smell.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Congestion or runny nose',
                    value: controller.congestion_or_runny_nose.value,
                    onChanged: () {
                      controller.congestion_or_runny_nose.value =
                          !controller.congestion_or_runny_nose.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Sore throat',
                    value: controller.sore_throat.value,
                    onChanged: () {
                      controller.sore_throat.value =
                          !controller.sore_throat.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                CheckboxItem(
                    title: 'Nausea or vomiting',
                    value: controller.nausea_or_vomiting.value,
                    onChanged: () {
                      controller.nausea_or_vomiting.value =
                          !controller.nausea_or_vomiting.value;
                    }),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),

                const SizedBox(
                  height: 20,
                ),
                // next button in the right bottom corner
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ElevatedButton(
                        // color: Color(0xffff8a5c),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Get.to(const RecordCoughScreen() , transition: Transition.rightToLeft);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 12.0),
                          child: Text('Next'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CheckboxItem(
      {required String title,
      required bool value,
      required Function onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: CheckboxListTile(
        activeColor: primaryColor,
        // dense: true,
        title: Text(title),
        value: value,
        onChanged: (bool? value) {
          onChanged();
        },
      ),
    );
  }
}
