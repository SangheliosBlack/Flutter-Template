import 'package:flutter_template/helpers/service_message.dart';

class GeneralResponse<T> {
  GeneralResponse({required this.status, required this.message, this.data});

  String status;
  String message;
  T? data;
}

class ResponseError<T> extends GeneralResponse<T> {
  ResponseError({
    String message = ServiceMessages.messageError,
  }) : super(
          status: ServiceMessages.error,
          message: message,
        );
}

class ResponseSuccess<T> extends GeneralResponse<T> {
  ResponseSuccess({
    String message = ServiceMessages.messageSuccess,
    T? data,
  }) : super(status: ServiceMessages.success, message: message, data: data);
}
