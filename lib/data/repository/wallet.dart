import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:s_pay/data/model/wallet/transactions.dart';
import 'package:s_pay/data/source/wallet_api_service.dart';
import 'package:s_pay/domain/repository/wallet.dart';
import 'package:s_pay/service_locator.dart';

class WalletRepositoryImpl extends WalletRepository {
  @override
  Future<Either> sendMoney() async {
    return const Right(true);
  }

  @override
  Future<Either> getTransactions() async {
    Either result = await s1<WalletApiService>().getTransactions();

    return result.fold((error) => Left(error), (data) {
      Response response = data;

      var transactions = transactionsFromJson(response.data);

      return Right(transactions);
    });
  }
}
