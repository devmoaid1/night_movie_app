import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:night_movie_app/core/api/api_provider.dart';
import 'package:night_movie_app/core/api/status_code.dart';
import 'package:night_movie_app/core/errors/error_model.dart';

import '../constants/app_constants.dart';
import '../errors/exceptions.dart';
import 'interceptors.dart';

class DioConsumer implements ApiProvider {
  final Dio client;

  DioConsumer({required this.client}) {
    (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = AppConstants.baseUrl
      ..followRedirects = false
      ..queryParameters = {"api_key": AppConstants.apiKey}
      ..validateStatus = ((status) {
        return status! < StatusCode.internalServerError;
      });

    client.interceptors.add(Get.find<AppInterceptor>());

    if (kDebugMode) {
      client.interceptors.add(Get.find<LogInterceptor>());
    }
  }

  @override
  Future getData(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.get(path, queryParameters: queryParams);
      return response;
    } on DioError catch (err) {
      _handleDioError(err);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw FetchDataException(
            errorModel: ErrorModel.fromJson(error.response!.data));
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(
                errorModel: ErrorModel.fromJson(error.response!.data));
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(
                errorModel: ErrorModel.fromJson(error.response!.data));
          case StatusCode.notFound:
            throw NotFoundException(
                errorModel: ErrorModel.fromJson(error.response!.data));
          case StatusCode.confilct:
            throw ConflictException(
                errorModel: ErrorModel.fromJson(error.response!.data));

          case StatusCode.internalServerError:
            throw InternalServerErrorException(
                errorModel: ErrorModel.fromJson(error.response!.data));
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(
            errorModel: ErrorModel.fromJson(error.response!.data));
    }
  }
}
