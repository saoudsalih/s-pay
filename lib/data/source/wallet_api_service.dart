



import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:s_pay/config/constants/api_urls.dart';
import 'package:s_pay/core/network/dio_client.dart';
import 'package:s_pay/service_locator.dart';

abstract class WalletApiService {
  Future<Either> getTransactions();
}

class WalletApiServiceImpl extends WalletApiService {
  @override
  Future<Either> getTransactions() async {
    try {
      var response =
          await s1<DioClient>().get(ApiUrls.transactions);

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
