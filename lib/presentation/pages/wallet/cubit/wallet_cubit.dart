

import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial(isBottomBarVisible: true,isAmountVisible: true));

  showBottomBar() {
    emit(WalletBottomBarVisibility(false));
  }

  hideBottomBar() {
    emit(WalletBottomBarVisibility(true));
  }

  exeuteAmountVisiblity(bool value) {
    emit(WalletAmountVisibility(value));
  }
}
