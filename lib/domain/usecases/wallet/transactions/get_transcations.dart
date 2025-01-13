

import 'package:either_dart/either.dart';
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/domain/repository/wallet.dart';

import 'package:s_pay/service_locator.dart';

class GetTransactionsUseCase extends UseCase<Either,dynamic> {
  @override
  Future<Either> call({param}) {
     return s1<WalletRepository>().getTransactions();
  }
}
