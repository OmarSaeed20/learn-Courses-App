import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learn/data/model/user_model/user_model.dart'; 

import '../data_source/remote/auth_remote_datasource.dart';
import '../network/network_info.dart';
import '/index.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final BaseAuthRemoteDataSource _remoteDataSource;

  final NetworkInfo _networkInfo;
  AuthenticationRepositoryImp(this._remoteDataSource, this._networkInfo);
/*   final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
 */

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
        // return Left(HttpUtil().createErrorEntity(e));
        return Left(
            ServerFailure("e.message ${e.message} -----\n e.error ${e.error}"));
      }
    } else {
      return const Left(ServerFailure('No Intrenet Connection !!!! '));
    }
  }

  @override
  ResultFuture<List<UserEntity>> getUSer() async {
    final result = await _remoteDataSource.getUser();
    return Right(
        result); /* try {
      return Right(result);
    } on Exception catch (failure) {
      return Left(ApiFailure(
            sCode:0,
            msg:result.message ?? ResponseMessage.DEFAULT,
          ));
    } */
  }
}
