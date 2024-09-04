import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
  var filePath = ''.obs;

  Future<void> pickPdf() async {
    // Pick a file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Get the file
      PlatformFile file = result.files.first;

      // You can use file.path to get the path of the selected file
      print('File path: ${file.path}');
      print('File name: ${file.name}');
      print('File size: ${file.size}');
    } else {
      // User canceled the picker
      print('No file selected');
    }
  }
}
