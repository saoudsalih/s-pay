import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_pay/config/constants/colors.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/domain/usecases/wallet/transactions/get_transcations.dart';
import 'package:s_pay/presentation/pages/wallet/cubit/wallet_cubit.dart';
import 'package:s_pay/presentation/pages/wallet/transaction/cubit/transcation_cubit.dart';
import 'package:s_pay/service_locator.dart';

class TransactionHistory extends StatefulWidget {
  static String routeName = "/transaction-history";

  // final Function(bool)? afterScrollback;
  const TransactionHistory({
    super.key,
  });

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (context.read<WalletCubit>().state.isBottomBarVisible) {
          context.read<WalletCubit>().showBottomBar();
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!context.read<WalletCubit>().state.isBottomBarVisible) {
          context.read<WalletCubit>().hideBottomBar();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TransactionCubit()
          ..exuteTransactions(usecase: s1<GetTransactionsUseCase>()),
        child: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            if (state is TransactionFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is TransationcLoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is TransactionSuccessState) {
              return ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (context, index) => Divider(
                        color: SColors.primary.withAlpha(40),
                      ),
                  itemCount: state.transactions.length,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                        title: Text(state.transactions[index].name ?? "-"),
                        subtitle: Text("Paid on 22 Dec, 8:21 AM"),
                        leading: Container(
                            padding: EdgeInsets.all(SSizes.borderRadiusMd),
                            decoration: BoxDecoration(
                              color: SColors.primary.withAlpha(80),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.local_hospital)),
                        trailing: Text(
                          "₹${state.transactions[index].amount}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
