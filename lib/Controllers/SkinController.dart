

// import 'package:get/get.dart';
import 'package:covid19_test/Screens/SkinResultPage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData , MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Constants.dart';

class SkinController extends GetxController {




  var isLoading = false.obs;




  Future<void> takeImage() async {

    if (await Permission.camera.request().isGranted) {
      XFile? image;
      try {
        final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          image = pickedFile;
          final formData = FormData.fromMap({
            'image': await MultipartFile.fromFile(pickedFile.path, filename: '${DateTime.now()}.jpg'),
          });
          final dio = Dio();
          isLoading.value = true;
          final res = await  dio.post('http://134.122.75.238:5000/skin', data: formData);


          final code = res.data['code'];
          final result = res.data['result'];

          if (code == 3){
            Get.snackbar('Error', 'Please try again ');
            return;
          }

          Get.off(SkinResultPage(code: code, result: result));


        }
      } catch (e) {
        print(e);

      }
      finally{

        isLoading.value = false;
      }
    }

  }


}