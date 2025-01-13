
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/domain/repository/auth.dart';
import 'package:s_pay/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({param}) {
    return s1<AuthRepository>().isLoggedIn();
  }
}
