import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/domain/usecases/auth/is_logged_in.dart';
import 'package:s_pay/service_locator.dart';

part 'auth_state.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AppInitialState());

  void appStarted() async {
    var isLoggedIn = await s1<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

  void loggedIn(){
    emit(Authenticated());
  }

  void appLogout({dynamic params, required UseCase usecase}) async {
    try {
      Either result = await usecase.call();

      result.fold((error) {
        emit(Authenticated());
      }, (data) {
        emit(UnAuthenticated());
      });
    } catch (e) {
      emit(Authenticated());
    }
  }
}
