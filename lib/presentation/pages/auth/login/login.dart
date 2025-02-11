import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/core/common/styles/spacing_styles.dart';
import 'package:s_pay/presentation/pages/auth/login/button/button_cubit.dart';
import 'package:s_pay/presentation/pages/auth/login/widgets/login_form.dart';
import 'package:s_pay/presentation/pages/auth/login/widgets/loging_header.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: SSpacingStyle.paddingBarWithHeight,
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Column(
            children: [
              SizedBox(
                height: SSizes.spaceBtwSections,
              ),

              /// logo and subtittle
              LoginHeader(),

              /// form
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
