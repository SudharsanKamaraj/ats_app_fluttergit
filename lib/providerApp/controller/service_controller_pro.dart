import 'package:ats_customar_app/util/index_path.dart';
import 'package:http/http.dart' as http;
import 'package:ats_customar_app/providerApp/util/index_path.dart';
//
//
// class ServiceControllerPro extends GetxController{
//
//   // Make sure to import the required dependencies
//
// // Example usage
//   void makePostRequest() async {
//     final apiClient = ApiClient();
//
//     // Set the required properties
//     apiClient.appBaseUrl = 'https://example.com/api'; // Replace with your actual API base URL
//     apiClient.flutterSecureStorage = FlutterSecureStorage();
//     apiClient.token = 'your_token'; // Replace with your actual token
//
//     // Set the main headers if needed
//     apiClient._mainHeaders = {
//       'Content-Type': 'application/json',
//       // Add other headers as needed
//     };
//
//     final uri = '/your-api-endpoint'; // Replace with your actual API endpoint
//     final body = {'key': 'value'}; // Replace with your actual request body
//     final headers = {'Authorization': 'Bearer your_token'}; // Replace with your actual headers if needed
//
//     final response = await apiClient.postData(uri, body, headers: headers);
//     print('Response Status Code: ${response.statusCode}');
//     print('Response Body: ${response.body}');
//   }
//
//
//   void makePostRequest(String? token) async {
//   const uri = 'http://192.168.0.111:3001/api/services/'; // Replace with your actual API endpoint
//   final headers = {
//     'x-access-token': token ?? '',
//   }.cast<String, String>(); // Replace with your actual headers if needed
//
//   final response = await postData(uri, headers: headers);
//   print('Response Status Code: ${response.statusCode}');
//   print('Response Body: ${response.headers}');
// }}

Future<ServiceModal> fetchData(String? token) async {
  final url = Uri.parse('http://192.168.0.111:3001/api/services/');
  final headers = {
    'x-access-token': token ?? '',
  }.cast<String, String>();

  final response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    print("jsonData: $jsonData");
    return ServiceModal.fromJson(jsonData);
  } else {
    print('Error: ${response.statusCode}');
    print('Error response body: ${response.body}');
    throw Exception('Failed to fetch data from the API');
  }
}

Future<ServiceFilterModal> fetchDataFilter(String? token) async {
  final url = Uri.parse('http://192.168.0.111:3001/api/services/');
  final headers = {
    'x-access-token': token ?? '',
  }.cast<String, String>();

  final response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    print("jsonData: $jsonData");
    return ServiceFilterModal.fromJson(jsonData);
  } else {
    print('Error: ${response.statusCode}');
    print('Error response body: ${response.body}');
    throw Exception('Failed to fetch data from the API');
  }
}
