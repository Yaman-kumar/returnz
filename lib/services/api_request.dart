// import 'package:dio/dio.dart';
//
// class ApiRequest {
//   final String url;
//   final dynamic data;
//
//   ApiRequest({
//     required this.url,
//     required this.data,
//   });
//
//   Dio _dio() {
//     // Put your authorization token here
//     return Dio(BaseOptions(headers: {
//       'Authorization': 'B ....',
//     }));
//   }
//
//   void get({
//     required Function() beforeSend,
//     required Function(dynamic data) onSuccess,
//     required Function(dynamic error) onError,
//   }) {
//     _dio().get(this.url, queryParameters: data).then((res) {
//       if (onSuccess != null) onSuccess(res.data);
//     }).catchError((error) {
//       if (onError != null) onError(error);
//     });
//   }
// }
