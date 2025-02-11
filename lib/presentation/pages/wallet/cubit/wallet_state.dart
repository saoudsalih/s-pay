part of 'wallet_cubit.dart';

abstract class WalletState {
  final bool isBottomBarVisible;
  final bool isAmountVisible;

  WalletState({this.isBottomBarVisible = true, this.isAmountVisible = true});

  WalletState copyWith({
    bool? isBottomBarVisible,
    bool? isAmountVisible,
  }) {
    return WalletStateBase(
      isBottomBarVisible: isBottomBarVisible ?? this.isBottomBarVisible,
      isAmountVisible: isAmountVisible ?? this.isAmountVisible,
    );
  }
}

// Base implementation to enable copyWith functionality
class WalletStateBase extends WalletState {
  WalletStateBase({
    super.isBottomBarVisible,
    super.isAmountVisible,
  });
}

// Initial state
class WalletInitial extends WalletStateBase {
  WalletInitial({
    super.isBottomBarVisible,
    super.isAmountVisible,
  });
}

// State for Bottom Bar Visibility
class WalletBottomBarVisibility extends WalletStateBase {
  WalletBottomBarVisibility(bool isVisible)
      : super(isBottomBarVisible: isVisible);
}

// State for Amount Visibility
class WalletAmountVisibility extends WalletStateBase {
  WalletAmountVisibility(bool isVisible)
      : super(isAmountVisible: isVisible);
}
