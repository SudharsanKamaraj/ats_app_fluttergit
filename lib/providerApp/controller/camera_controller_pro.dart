import 'package:ats_customar_app/util/index_path.dart';


class CamerasController extends GetxController {
  var controller= Get.put(CamerasController());
  var photo=[].obs;

  Future takePicture() async {
    ImagePicker picker = ImagePicker();
    XFile firstPic = (await picker.pickImage(source: ImageSource.camera))!;

    if (kDebugMode) {
      print("tacked pic ${firstPic.path}, ${firstPic.name}");
    }
    photo.add(firstPic);
    if (kDebugMode) {
      print("tacked pic ${firstPic.path}, ${photo.length}");
    }
    update();
  }

  Future gallery() async {
    ImagePicker picker = ImagePicker();
    XFile getPic = (await picker.pickImage(source: ImageSource.gallery))!;

    if (kDebugMode) {
      print("get pic ${getPic.path}, ${getPic.name}");
    }
    photo.add(getPic);
    if (kDebugMode) {
      print("get pic ${getPic.path}, ${photo.length}");
    }
    update();
  }

  Future deleteImage(int index) async {
    try {
      controller.photo.removeAt(index);
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }
}