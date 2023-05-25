import 'dart:io';
import 'dart:math';

import 'package:covid19_test/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
// import Environment from 'android.os.Environment';

import 'dart:io' as io;

import '../Screens/ResultPage.dart';

class CheckController extends GetX.GetxController {
  // var recorderController = RecorderController().obs;
  //
  // var playerController = PlayerController().obs;

  var fever_or_chills = false.obs;
  var shortness_of_breath = false.obs;
  var fatigue = false.obs;
  var muscle_or_body_aches = false.obs;
  var headache = false.obs;
  var loss_of_taste_or_smell = false.obs;
  var congestion_or_runny_nose = false.obs;
  var sore_throat = false.obs;
  var nausea_or_vomiting = false.obs;

  final record = Record();
  var elapsingTime = 0.obs;
  var isRecording = false.obs;

  var canSubmit = false.obs;
  var coughFile = ''.obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    // await createFolder('Coughs');
    super.onInit();
  }

  Future<void> recordAudio() async {
    // set 5 seconds to record
    isRecording.value = true;
    recordCough();
    var future = Future.delayed(const Duration(seconds: 2), stopRecoring);
  }

  Future<void> recordCough() async {
    canSubmit.value = false;
    // final dir = await getExternalStorageDirectory();
    // final filePath = '${dir?.path}/cough_${generateRandomFileName()}.wav';

    final filePath = '/storage/emulated/0/Documents/cough_${generateRandomFileName()}.wav';
    coughFile.value = filePath;

    await Permission.microphone.request();
    await Permission.storage.request();
    if (await record.hasPermission()) {
      // Start recording
      await record.start(
        path: filePath,
        encoder: AudioEncoder.wav,
        numChannels: 1,
        samplingRate: 16000,
      );
    }
  }

  Future<void> stopRecoring() async {
    await record.stop();
    isRecording.value = false;
    canSubmit.value = true;
  }

  String generateRandomFileName() {
    final now = DateTime.now();
    final random = Random();

    final year = now.year.toString();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');

    final randomDigits = random.nextInt(10000).toString().padLeft(4, '0');

    return '$year-$month-$day-$randomDigits';
  }

  Future<void> submitCheck() async {
    try {
      final filePath = coughFile.value;
      final dio = Dio();
      final formData = FormData.fromMap({
            'file': await MultipartFile.fromFile(filePath, filename: coughFile.value
                .split('/')
                .last),
            // symptoms
            'fever_or_chills': fever_or_chills.value,
            'shortness_of_breath': shortness_of_breath.value,
            'fatigue': fatigue.value,
            'muscle_or_body_aches': muscle_or_body_aches.value,
            'headache': headache.value,
            'loss_of_taste_or_smell': loss_of_taste_or_smell.value,
            'congestion_or_runny_nose': congestion_or_runny_nose.value,
            'sore_throat': sore_throat.value,
            'nausea_or_vomiting': nausea_or_vomiting.value,
          });
      isLoading.value = true;
      final response = await dio.post(apiURL, data: formData);
      responseHandler(response);
    } catch (e) {
      GetX.Get.snackbar('Error', e.toString() ,
          backgroundColor: Colors.orangeAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          snackPosition: GetX.SnackPosition.BOTTOM);
      canSubmit=false.obs;
    } finally {
      isLoading.value = false;
    }
  }

  void responseHandler(Response response) {
    if (response.statusCode == 200) {
      final code = response.data['code'];
      if (code == 0 || code == 1) {
        GetX.Get.offAll(() => ResultPage(
            code: code,
            result: response.data['result'],
            ) , transition: GetX.Transition.zoom);
      }
      else if (code == 2) {
        canSubmit.value = false;
        GetX.Get.snackbar('Error', 'Please provide another cough test',
            backgroundColor: Colors.orangeAccent,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            snackPosition: GetX.SnackPosition.BOTTOM);
      }
    } else {
      GetX.Get.snackbar('Error', response.data['result'] ,
          backgroundColor: Colors.orangeAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          snackPosition: GetX.SnackPosition.BOTTOM);
    }
  }


}
