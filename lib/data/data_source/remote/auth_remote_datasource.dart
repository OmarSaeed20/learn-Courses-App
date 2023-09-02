import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:learn/data/model/user_model/user_model.dart';
import '/index.dart';

import '../../network/dio/app_dio.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> login({required String password, required String email});

  Future<List<UserEntity>> getUser();
}

class AuthRemoteDataSourceImp extends BaseAuthRemoteDataSource {
  @override
  Future<UserModel> login(
      {required String password, required String email}) async {
    Response response = await HttpUtil().post(
      "/user_login/",
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      UserModel model = UserModel.fromJson(response.data);
      return model;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<UserEntity>> getUser() {
    throw UnimplementedError();
  }
}

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
