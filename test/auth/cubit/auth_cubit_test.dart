import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:s_pay/core/utils/storage_helper.dart';
import 'package:s_pay/domain/usecases/auth/is_logged_in.dart';
import 'package:s_pay/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:s_pay/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("AuthCubit", () {
    late AuthStateCubit authStateCubit;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      GetIt.I.allowReassignment = true;
      if (!GetIt.I.isRegistered<IsLoggedInUseCase>()) {
        GetIt.I.registerLazySingleton<IsLoggedInUseCase>(
          () => IsLoggedInUseCase(),
          instanceName: 'mockAuth',
        );
      }
      setUpServiceLocator();

      authStateCubit = AuthStateCubit();
    });
    tearDown(() {
      authStateCubit.close();
    });

    test("AuthCubit intial state", () {
      expect(authStateCubit.state, AppInitialState());
    });

    blocTest(
      "Run unauthenticated test when the app starts.",
      build: () => authStateCubit,
      act: (cubit) => cubit.appStarted(),
      expect: () => [UnAuthenticated()],
    );

    blocTest(
      "Run authenticated test when the app already loggedin.",
      build: () {
        SharedPreferences.setMockInitialValues({
          StorageKeys.loggedIn: "{\"token\": \"32323gdfdgfdg\"}"
        });
        return authStateCubit;
      },
      act: (cubit) => cubit.appStarted(),
      expect: () => [Authenticated()],
    );
  });
}
