part of 'models.dart';

class ResponseHandler {
  final User user;
  final int statusCode;
  final String message;
  final dynamic errors;
  final dynamic data;

  ResponseHandler({
    this.user,
    this.statusCode,
    this.message,
    this.errors,
    this.data,
  });
}
