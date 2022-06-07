

import 'package:returnz/services/api_service.dart';

class ApiRepo{
  final APIManager apiProvider;
  ApiRepo(this.apiProvider);
  Future<dynamic> getVenues() => apiProvider.makePostRequest_follow();
}
