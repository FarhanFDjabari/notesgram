import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../environment.dart';
import '../interceptor/dio.dart';
import '../wrapper/api_response.dart';
import 'package:http_parser/http_parser.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final defHeader = Map<String, dynamic>.from(headers);
    defHeader["Accept"] = "application/json";

    // String? token = await SecureStorageManager().getToken();
    // defHeader["Authorization"] = "Bearer " + (token ?? "");

    return RestClient(
      await AppDio().getDIO(
          headers: defHeader,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }
}

final client = RestClient.create;
