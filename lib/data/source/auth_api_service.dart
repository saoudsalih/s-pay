import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:s_pay/config/constants/api_urls.dart';
import 'package:s_pay/core/network/dio_client.dart';
import 'package:s_pay/data/model/signin_req_params.dart';
import 'package:s_pay/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signin(SigninReqParams param);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signin(SigninReqParams param) async {
    try {
      var response =
          await s1<DioClient>().post(ApiUrls.login, data: param.toMap());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
