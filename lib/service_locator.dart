import 'package:get_it/get_it.dart';
import 'package:s_pay/core/network/dio_client.dart';
import 'package:s_pay/core/utils/storage_helper.dart';
import 'package:s_pay/data/repository/auth.dart';
import 'package:s_pay/data/source/auth_api_service.dart';
import 'package:s_pay/data/source/auth_local_service.dart';
import 'package:s_pay/domain/repository/auth.dart';
import 'package:s_pay/domain/usecases/is_logged_in.dart';
import 'package:s_pay/domain/usecases/logout.dart';
import 'package:s_pay/domain/usecases/signin.dart';
import 'package:s_pay/presentation/pages/auth/login/auth/auth_cubit.dart';

final s1 = GetIt.instance;

void setUpServiceLocator() {
  s1.registerSingleton<DioClient>(DioClient());
  s1.registerSingleton<StorageHelper>(StorageHelper());

  // services

  s1.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //repositorie
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //usecases

  s1.registerSingleton<SigninUsecase>(SigninUsecase());
  s1.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  s1.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  s1.registerSingleton<LogoutUseCase>(LogoutUseCase());


  // cubit

  s1.registerSingleton<AuthStateCubit>(AuthStateCubit());
}
