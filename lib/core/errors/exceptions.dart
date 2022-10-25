import 'package:equatable/equatable.dart';

import 'error_model.dart';

class ServerException extends Equatable implements Exception {
  final ErrorModel errorModel;

  const ServerException({required this.errorModel});
  @override
  List<Object> get props => [errorModel];
}

class FetchDataException extends ServerException {
  const FetchDataException({required super.errorModel});
}

class BadRequestException extends ServerException {
  const BadRequestException({required super.errorModel});
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException({required super.errorModel});
}

class NotFoundException extends ServerException {
  const NotFoundException({required super.errorModel});
}

class ConflictException extends ServerException {
  const ConflictException({required super.errorModel});
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException({required super.errorModel});
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException({required super.errorModel});
}
