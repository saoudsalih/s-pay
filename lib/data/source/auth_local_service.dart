import 'package:either_dart/either.dart';
import 'package:s_pay/core/utils/storage_helper.dart';
import 'package:s_pay/service_locator.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
  Future<Either> logout();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isLoggedIn() async {
    if (await s1<StorageHelper>().get(StorageKeys.loggedIn) == null) {
      return false;
    }
    return true;
  }

  @override
  Future<Either> logout() async {
    s1<StorageHelper>().clear();
    return const Right(true);
  }
}
