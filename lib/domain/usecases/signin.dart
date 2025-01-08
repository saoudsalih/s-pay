import 'package:either_dart/either.dart';
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/data/model/signin_req_params.dart';
import 'package:s_pay/domain/repository/auth.dart';
import 'package:s_pay/service_locator.dart';

class SigninUsecase implements UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? param}) {
    return s1<AuthRepository>().signin(param!);
  }
}
