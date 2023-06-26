import 'package:ats_customar_app/util/index_path.dart';
import 'package:http/http.dart' as http;

Future<void> createUserProvider(
    String userName, String email, String password, String mobileNumber, String driverLicence, String truckPlate, ) async {
  final url = Uri.parse('http://192.168.0.111:3001/api/users');
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userName': userName,
        'email': email,
        'password': password,
        'mobileNumber': mobileNumber,
        'driverLicence': driverLicence,
        'truckPlate': truckPlate,
        'roles': ["technician"],
        'status': "ACTIVE",
      }),
    );

    print("this is response $response");
    print("this is payload ${json.encode({
      'userName': userName,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'driverLicence': driverLicence,
      'truckPlate': truckPlate,
      'roles': ["technician"],
      'status': "ACTIVE",
    })}");

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      Get.defaultDialog(
          title: "successfully!", middleText: "User created successfully!.");
      print("this is responseData $responseData");
      print(" this is token $token");
    } else {
      print("Failed to create user: ${response.statusCode},${response.body}");
      throw Exception('Response');
    }
  } catch (e) {
    // TODO: Handle the error if the user creation fails
    print("Failed to create user: $e");
    Get.defaultDialog(title: "oops!", middleText: e.toString());
  }
}