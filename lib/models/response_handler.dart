part of 'models.dart';

class ResponseHandler {
  final User user;
  final String message;
  final dynamic errors;

  ResponseHandler({
    this.user,
    this.message,
    this.errors,
  });
}
