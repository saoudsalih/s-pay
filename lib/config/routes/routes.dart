

import 'package:flutter/material.dart';
import 'package:s_pay/presentation/pages/auth/login/login.dart';
import 'package:s_pay/presentation/pages/profile/account.dart';
import 'package:s_pay/presentation/pages/wallet/send_money/send_money.dart';
import 'package:s_pay/presentation/pages/wallet/transaction/transaction_history.dart';
import 'package:s_pay/presentation/pages/wallet/wallet_main.dart';

Map<String,Widget Function(BuildContext)> routes = {
  LoginScreen.routeName:(ctx)=> LoginScreen(),
  WalletMain.routeName:(ctx)=> WalletMain(),
  TransactionHistory.routeName:(ctx)=> TransactionHistory(),
  SendMoney.routeName:(ctx)=> SendMoney(),
  MyAccountScreen.routeName:(ctx)=> MyAccountScreen()
};