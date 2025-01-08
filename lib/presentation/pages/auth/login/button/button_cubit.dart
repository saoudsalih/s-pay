import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/presentation/pages/auth/login/auth/auth_cubit.dart';


part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  final AuthStateCubit authStateCubit;
  ButtonCubit(this.authStateCubit) : super(ButtonInitialState());

  void exute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());

    try {
      Either result = await usecase.call(param: params);

      result.fold((error) {
        emit(ButtonFailureState(errorMessage: error));
      }, (data) {
        emit(ButtonSuccessState());
        authStateCubit.emit(Authenticated());
        // BlocProvider.of<ButtonCubit>(context).exute(usecase: s1<LogoutUseCase>());
        
      });
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
