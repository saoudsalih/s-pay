part of 'transcation_cubit.dart';

abstract class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransationcLoadingState extends TransactionState{}

 class TransactionSuccessState extends TransactionState{
   List<TransactionsModel> transactions;
   TransactionSuccessState({required this.transactions});
}

final class TransactionFailureState extends TransactionState{
   final String errorMessage;
   TransactionFailureState({required this.errorMessage});
}
