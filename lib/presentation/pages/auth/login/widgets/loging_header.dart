import 'package:flutter/material.dart';
import 'package:s_pay/config/constants/image_strings.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/config/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 100, image: NetworkImage(SImageString.appLogo)),
        Text(
          STexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: SSizes.sm,
        ),
        Text(
          STexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
