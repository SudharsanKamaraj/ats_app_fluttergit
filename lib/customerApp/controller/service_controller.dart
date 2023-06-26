import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<MyData>> fetchData() async {
  final dataList = <MyData>[];

  final response = await http.get(Uri.parse('http://localhost:3001/api/services/'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    dataList.addAll((jsonData as List<dynamic>).map((item) => MyData.fromJson(item)));
    return dataList;
  } else {
    throw Exception('Failed to fetch data from the API');
  }
}

class MyData {
  final String serviceCategory;
  final String serviceType;

  MyData({required this.serviceCategory, required this.serviceType});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      serviceCategory: json['serviceCategory'],
      serviceType: json['serviceType'],
    );
  }
}


// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// Future<void> fetchData() async {
//   List<MyData> dataList = [];
//   print("this is dataList $dataList");
//
//   final response = await http
//       .get(Uri.parse('http://localhost:3001/api/services/technician'));
//   print("this is response $response");
//
//   if (response.statusCode == 200) {
//     final jsonData = json.decode(response.body);
//     dataList = (jsonData as List<dynamic>)
//         .map((item) => MyData.fromJson(item))
//         .toList();
//   } else {
//      print("Handle API error");
//   }
// }
//
// class MyData {
//   final String serviceCategory;
//   final String serviceType;
//
//   MyData({required this.serviceCategory, required this.serviceType});
//
//   factory MyData.fromJson(Map<String, dynamic> json) {
//     return MyData(
//       serviceCategory: json['serviceCategory'],
//       serviceType: json['serviceType'],
//     );
//   }
// }
