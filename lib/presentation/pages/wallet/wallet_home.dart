import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_pay/config/constants/colors.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/config/constants/text_strings.dart';
import 'package:s_pay/core/common/styles/spacing_styles.dart';
import 'package:s_pay/domain/usecases/wallet/send_money.dart';
import 'package:s_pay/presentation/pages/auth/login/button/button_cubit.dart';
import 'package:s_pay/presentation/pages/wallet/send_money/send_money.dart';
import 'package:s_pay/service_locator.dart';

class WalletHome extends StatelessWidget {
  const WalletHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: SingleChildScrollView(
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
                          child: BlocConsumer<ButtonCubit, ButtonState>(
                            listener: (context, state) {
                              if (state is ButtonSuccessState) {
                                Navigator.pushNamed(
                                    context, SendMoney.routeName);
                              }

                              if (state is ButtonFailureState) {
                                var snackBar =
                                    SnackBar(content: Text(state.errorMessage));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            builder: (context, state) {
                              return ElevatedButton(
                                  onPressed: () {
                                    if (state is ButtonLoadingState) return;
                                    context
                                        .read<ButtonCubit>()
                                        .exute(usecase: s1<SendMoneyUseCase>());
                                  },
                                  child: state is ButtonLoadingState
                                      ? CircularProgressIndicator()
                                      : Text(STexts.sendMoney));
                            },
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
