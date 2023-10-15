import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learn/data/model/user_model/user_model.dart';
import '../../../domain/usecase/sign_up_usecase.dart';
import '../../../presentation/resources/app_constant.dart';
import '/index.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> login({required String password, required String email});
  Future<void> createUser({required SignUpParameter param});

  Future<List<UserEntity>> getUser();
}

class AuthRemoteDataSourceImp extends BaseAuthRemoteDataSource {
  @override
  Future<void> createUser({required SignUpParameter param}) async {
    debugPrint('Remote Sign up>>>>>>>>>>>>>>>>>>');
    /*  try { */
    var data = {
      "first_name": "${param.name}Ah4ed",
      "last_name": "${param.name}Ai1",
      "username": param.name,
      "email": "${param.email}@gmail.com",
      "phone": "+01045412514",
      "password": param.password,
      "password_confirmation": param.password,
      "gender": 0
    };
    final response = await HttpUtil().post(
      ApiConstan.signUp,
      data: data,
      options: Options(headers: {
        "Content-Type": "multipart/form-data",
        "Accept": "application/json",
        "lang": "en"
      }),
    );
    debugPrint('Remote Sign up response>>>>>>>>>>>>>>>>>> $response');
    if (response.statusCode == 200) {
      debugPrint('Remote Sign up>>>>>>>>>>>>>>>>>> successsssss');
      Right(response.data);
    } else {
      debugPrint('Remote Sign up>>>>>>>>>>>>>>>>>> error');
      throw DioError(requestOptions: response.requestOptions);
    }
    /*}  on ApiFailure {
      rethrow;
    } catch (e) {
      debugPrint('Remote Sign up>>>>>>>>>>>>>>>>>> error $e');

      throw ApiFailure(e.toString(), 505);
    } */
  }

  @override
  Future<UserModel> login(
      {required String password, required String email}) async {
    final response = await HttpUtil().post(
      "/user_login/",
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      UserModel model = UserModel.fromJson(response.data);
      return model;
    } else {
      throw ApiFailure(
        response.statusMessage ?? "statusMessage unKnown error",
        response.statusCode ?? 0,
      );
    }
  }

  @override
  Future<List<UserEntity>> getUser() {
    throw UnimplementedError();
  }
}
