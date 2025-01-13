import 'package:get_it/get_it.dart';
import 'package:s_pay/core/network/dio_client.dart';
import 'package:s_pay/core/utils/storage_helper.dart';
import 'package:s_pay/data/repository/auth.dart';
import 'package:s_pay/data/repository/wallet.dart';
import 'package:s_pay/data/source/auth_api_service.dart';
import 'package:s_pay/data/source/auth_local_service.dart';
import 'package:s_pay/data/source/wallet_api_service.dart';
import 'package:s_pay/domain/repository/auth.dart';
import 'package:s_pay/domain/repository/wallet.dart';
import 'package:s_pay/domain/usecases/auth/is_logged_in.dart';
import 'package:s_pay/domain/usecases/auth/logout.dart';
import 'package:s_pay/domain/usecases/auth/signin.dart';
import 'package:s_pay/domain/usecases/wallet/send_money.dart';
import 'package:s_pay/domain/usecases/wallet/transactions/get_transcations.dart';
import 'package:s_pay/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:s_pay/presentation/pages/wallet/transaction/cubit/transcation_cubit.dart';

final s1 = GetIt.instance;

void setUpServiceLocator() {
  s1.registerSingleton<DioClient>(DioClient());
  s1.registerSingleton<StorageHelper>(StorageHelper());

  // services

  s1.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  s1.registerSingleton<WalletApiService>(WalletApiServiceImpl());

  //repositorie
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  s1.registerSingleton<WalletRepository>(WalletRepositoryImpl());

  //usecases

  s1.registerSingleton<SigninUsecase>(SigninUsecase());
  s1.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  s1.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  s1.registerSingleton<LogoutUseCase>(LogoutUseCase());
  s1.registerSingleton<SendMoneyUseCase>(SendMoneyUseCase());
  s1.registerSingleton<GetTransactionsUseCase>(GetTransactionsUseCase());


  // cubit

  s1.registerSingleton<AuthStateCubit>(AuthStateCubit());
  s1.registerSingleton<TransactionCubit>(TransactionCubit());
}
