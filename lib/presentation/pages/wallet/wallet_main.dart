import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_pay/config/constants/text_strings.dart';
import 'package:s_pay/presentation/pages/profile/account.dart';
import 'package:s_pay/presentation/pages/wallet/transaction/transaction_history.dart';
import 'package:s_pay/presentation/pages/wallet/wallet_home.dart';

class WalletMain extends StatefulWidget {
  static String routeName = "/wallet";
  const WalletMain({super.key});

  @override
  State<WalletMain> createState() => _WalletMainState();
}

class _WalletMainState extends State<WalletMain> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [WalletHome(), TransactionHistory(), MyAccountScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(STexts.wallet),),
      // body: WalletHome(),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Wrap(
          children: [
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.black,
                iconSize: 32,
                currentIndex: _currentIndex,
                elevation: 0,
                onTap: (index) => setState(() {
                      _currentIndex = index;
                    }),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.wallet), label: STexts.wallet),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.transaction_minus),
                      label: STexts.transaction),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.user), label:STexts.account),
                ]),
          ],
        ),
      ),
    );
  }
}
