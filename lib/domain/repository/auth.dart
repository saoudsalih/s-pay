

import 'package:either_dart/either.dart';
import 'package:s_pay/data/model/signin_req_params.dart';

abstract class AuthRepository{
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
  Future<Either> logout();
}