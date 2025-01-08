import 'package:flutter/material.dart';
import 'package:s_pay/config/constants/colors.dart';
import 'package:s_pay/config/constants/sizes.dart';

class TransactionHistory extends StatelessWidget {
  static String routeName = "/transaction-history";
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(color: SColors.primary.withAlpha(40),),
        itemCount: 25,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
              title: Text("Apple media Service - Automatic Payment"),
              subtitle: Text("Paid on 22 Dec, 8:21 AM"),
              leading: Container(
                padding: EdgeInsets.all(SSizes.borderRadiusMd),
                decoration: BoxDecoration(
                  color: SColors.primary.withAlpha(80),
                   shape: BoxShape.circle,
                  ),
                child: Icon(Icons.local_hospital)),
              trailing:  Text("₹210",style: Theme.of(context).textTheme.titleLarge,),
            ));
  }
}
