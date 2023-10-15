import 'package:dio/dio.dart';

import '../../../index.dart';

// * errors
void onDioError(Error error) {
  debugPrint('error.code -> ${error.code}, error.message -> ${error.message}');
  switch (error.code) {
    case 401:
      // UserStore.to.logout();
      break;
    default:
      break;
  }
}

Error createErrorEntity(DioError e) {
  switch (e.type) {
    case DioErrorType.cancel:
      return Error(
        code: -1,
        message: "request cancel",
      );
    case DioErrorType.connectTimeout:
      return Error(
        code: -1,
        message: "connection timed out",
      );
    case DioErrorType.sendTimeout:
      return Error(
        code: -1,
        message: "request timed out",
      );
    case DioErrorType.receiveTimeout:
      return Error(
        code: -1,
        message: "response timeout",
      );
    case DioErrorType.response:
      {
        try {
          int errorCode = e.response != null ? e.response!.statusCode! : -1;

          switch (errorCode) {
            case 400:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "request syntax error",
              );
            case 401:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "permission denied",
              );
            case 403:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "The server refuses to execute",
              );
            case 404:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "can not reach server",
              );
            case 405:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "request method is forbidden",
              );
            case 422:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "Unprocessable Entity",
              );
            case 500:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "internal server error",
              );
            case 502:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "invalid request",
              );
            case 503:
              return Error(
                code: errorCode,
                message: featchError(e) ?? "server down",
              );
            case 505:
              return Error(
                code: errorCode,
                message:
                    featchError(e) ?? "does not support HTTP protocol requests",
              );
            default:
              {
                return Error(
                  code: errorCode,
                  message: featchError(e) ??
                      (e.response != null ? e.response!.statusMessage! : ""),
                );
              }
          }
        } on Exception catch (_) {
          return Error(
            code: -1,
            message: featchError(e) ?? "unknown error",
          );
        }
      }
    default:
      {
        return Error(code: -1, message: e.message);
      }
  }
}

String? featchError(DioError e) {
  debugPrint("====> response ===> ${e.response}");
  String? error /*  = 'Unprocessable Entity' */;
  if (e.response!.data["data"] != null &&
      !e.response!.data["data"].toString().contains("id")) {
    (e.response!.data["data"] as Map).forEach((key, value) {
      debugPrint("====> key ===> $key");
      debugPrint("====> value ===> ${value[0]}");
      error = value[0];
    });
  } else {
    error = e.response!.data["message"];
  }
  return error;
}

// * code ---> 1:success , -1:failure
class Error implements Exception {
  int code = -1;
  String message = "";
  Error({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
/* class DioExceptions implements Exception {
  static late String message;
  static int statusCode = -1;

  DioExceptions.fromDioError(
      {required DioError dioException, required String? errorFrom}) {
    //This will print error is Json format and colorful
    _prettyPrintError(dioError: dioException, errorFrom: errorFrom);
    switch (dioException.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";

        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";

        break;
      case DioErrorType.response:
        message = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        statusCode = dioException.response?.statusCode ?? -1;
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioException.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  // ignore: unused_element
  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  String errorMessage() => message;

  int errorStatusCode() => statusCode;

  void _prettyPrintError(
      {required DioError dioError, required String? errorFrom}) {
    debugPrint(
        '\x1B[31m${"********************************************************"}\x1B[0m');
    debugPrint('\x1B[31m${"🚨 ERROR exception from: $errorFrom"}\x1B[0m');
    debugPrint(
        '\x1B[31m${"🚨 ERROR it's status Code : ${dioError.response?.statusCode ?? -1}"}\x1B[0m');
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(dioError.response?.data ?? '');
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
      log("🕵️$errorFrom Error Response :\n$prettyprint", name: "Error",);
      debugPrint(
          '\x1B[31m🕵️$errorFrom Error Response :\n$prettyprint", name: "Error"\x1B[0m');
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
    } catch (e) {
      log("🕵️ $errorFrom Error Response :\n${dioError.response?.data ?? ''}",
          name: "Error",);
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
    }
  }
} */
