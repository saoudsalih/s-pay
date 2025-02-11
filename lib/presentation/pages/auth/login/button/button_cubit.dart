
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/domain/usecases/auth/signin.dart';
import 'package:s_pay/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:s_pay/service_locator.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  final AuthStateCubit? authStateCubit;
  ButtonCubit({this.authStateCubit}) : super(ButtonInitialState());

  void exute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
   await Future.delayed(const Duration(seconds: 2));
    try {
      Either result = await usecase.call(param: params);

      result.fold((error) {
        emit(ButtonFailureState(errorMessage: error));
      }, (data) {
        emit(ButtonSuccessState());
        usecase == s1<SigninUsecase>()
            ? authStateCubit?.emit(Authenticated())
            : null;
      });
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
