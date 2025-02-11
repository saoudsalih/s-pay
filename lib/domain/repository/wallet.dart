import 'package:either_dart/either.dart';

abstract class WalletRepository {
  Future<Either> sendMoney();
  Future<Either> getTransactions();
}
