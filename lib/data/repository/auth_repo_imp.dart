import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learn/data/model/user_model/user_model.dart';
import 'package:learn/domain/usecase/sign_up_usecase.dart';

import '/index.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final BaseAuthRemoteDataSource _remoteDataSource;

  final NetworkInfo _networkInfo;
  AuthenticationRepositoryImp(this._remoteDataSource, this._networkInfo);
  @override
  ResultFuture<void> signUp(SignUpParameter parameters) async {
    try {
      await _remoteDataSource.createUser(param: parameters);
      return const Right(null);
    } on Failure catch (e) {
      return Left(ApiFailure.fromEx(e));
    }
  }

  @override
  ResultFuture<UserModel> login(
      {required String email, required String password}) async {
    if (await _networkInfo.isConnected) {
      try {
        final result =
            await _remoteDataSource.login(password: password, email: email);
        debugPrint("Login Result is >>>>>>>>>>> $result");
        return Right(result);
      } on DioError catch (e) {
        return Left(
          ApiFailure(
            "e.message ${e.message} -----\n e.error ${e.error}",
            e.response!.statusCode!,
          ),
        );
      }
    } else {
      return const Left(ApiFailure('No Intrenet Connection !!!! ', 500));
    }
  }

  @override
  ResultFuture<List<UserEntity>> getUSer() async {
    final result = await _remoteDataSource.getUser();
    return Right(result);
  }
}
