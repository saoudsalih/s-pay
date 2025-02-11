
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_pay/core/use_case/use_case.dart';
import 'package:s_pay/data/model/wallet/transactions.dart';
part 'transcation_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void exuteTransactions({dynamic params, required UseCase usecase}) async {
    emit(TransationcLoadingState());
    try {
      Either result = await usecase.call(param: params);

      result.fold((error) => emit(TransactionFailureState(errorMessage: error)),
          (data) {
        emit(TransactionSuccessState(transactions: data));
      });
    } catch (e) {
      emit(TransactionFailureState(errorMessage: e.toString()));
    }
  }
}
