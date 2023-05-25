import 'package:covid19_test/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/CheckController.dart';

class RecordCoughScreen extends StatefulWidget {
  const RecordCoughScreen({Key? key}) : super(key: key);

  @override
  State<RecordCoughScreen> createState() => _RecordCoughScreenState();
}

class _RecordCoughScreenState extends State<RecordCoughScreen> {
  final controller = Get.find<CheckController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Step 2:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Record your cough',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // cough image
                  Image(
                    image: AssetImage('assets/cough.png'),
                    color: primaryColor,
                    width: 160,
                    height: 160,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RecordingIndicatorWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    // rounded button to record cough
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: controller.isRecording.value
                            ? const Color(0xFFDDE6ED)
                            : primaryColor,
                      ),
                      child: Obx(
                        () => TextButton(
                          // disable button if already recording

                          onPressed: controller.isRecording.value
                              ? null
                              : () {
                                  controller.recordAudio();
                                },
                          child: Text(
                            controller.isRecording.value
                                ? 'Coughing...'
                                : 'Record',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    // button to go to next screen
                    Obx(
                      () => Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: controller.canSubmit.value
                              ? Colors.green
                              : const Color(0xFF666666),
                        ),
                        child: TextButton(
                          onPressed: controller.canSubmit.value
                              ? () {
                                  if (controller.canSubmit.value) {
                                    controller.submitCheck();
                                  }
                                }
                              : null,
                          child: controller.isLoading.value
                              ? Container(width: 20, height: 20,child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2,) ,)
                              : const Text(
                                  'Check',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecordingIndicatorWidget extends StatefulWidget {
  @override
  _RecordingIndicatorWidgetState createState() =>
      _RecordingIndicatorWidgetState();
}

class _RecordingIndicatorWidgetState extends State<RecordingIndicatorWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final controller = Get.find<CheckController>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });
    _animationController!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationController!,
          builder: (BuildContext context, Widget? child) {
            return Icon(
              Icons.mic_rounded,
              color: controller.isRecording.value
                  ? Colors.green.withOpacity(_animationController!.value)
                  : Colors.grey,
              size: 60.0,
            );
          },
        ),
      ],
    );
  }
}
