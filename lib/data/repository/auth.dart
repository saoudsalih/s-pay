import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:s_pay/core/utils/storage_helper.dart';
import 'package:s_pay/data/model/signin_req_params.dart';
import 'package:s_pay/data/source/auth_api_service.dart';
import 'package:s_pay/data/source/auth_local_service.dart';
import 'package:s_pay/domain/repository/auth.dart';
import 'package:s_pay/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninReqParams params) async {
    Either result = await s1<AuthApiService>().signin(params);

    return result.fold((errro) {
      return Left(errro);
    }, (data) async {
      Response response = data;
      
      s1<StorageHelper>().set(StorageKeys.loggedIn, response.data['data']['token']["access"]["token"]);
      return Right(response);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await s1<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> logout() async {
    return await s1<AuthLocalService>().logout();
  }
}
