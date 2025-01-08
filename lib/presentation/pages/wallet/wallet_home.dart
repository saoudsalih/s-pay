
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_pay/config/constants/colors.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/config/constants/text_strings.dart';
import 'package:s_pay/core/common/styles/spacing_styles.dart';
import 'package:s_pay/presentation/pages/wallet/send_money/send_money.dart';


class WalletHome extends StatelessWidget {
  const WalletHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: SSpacingStyle.paddingBarWithHeight,
      child: Column(
        children: [
          SizedBox(
            height: SSizes.spaceBtwSections,
          ),
          Card(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(SSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        STexts.totalWalletBalance,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.wallet),
                        color: SColors.primary,
                      )
                    ],
                  ),
                  Text(
                    "₹ 250000",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: ()=> Navigator.pushNamed(context, SendMoney.routeName), child: Text(STexts.sendMoney)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
