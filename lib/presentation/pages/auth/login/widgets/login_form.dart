import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:s_pay/config/constants/sizes.dart';
import 'package:s_pay/config/constants/text_strings.dart';
import 'package:s_pay/data/model/signin_req_params.dart';
import 'package:s_pay/domain/usecases/auth/signin.dart';
import 'package:s_pay/presentation/pages/auth/login/button/button_cubit.dart';
import 'package:s_pay/service_locator.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _userName.text = "+919375489256";
    _password.text = "abc@1234";
    return Form(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: SSizes.spaceBtwSections),
      child: Column(
        children: [
          // username
          TextFormField(
            controller: _userName,
            decoration: const InputDecoration(
                prefix: Icon(Iconsax.direct_right), labelText: STexts.userName),
          ),
          const SizedBox(
            height: SSizes.spaceBtwInputFields,
          ),

          // password
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(
                prefix: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: STexts.password),
          ),
          const SizedBox(
            height: SSizes.spaceBtwInputFields / 2,
          ),

          SizedBox(
            height: SSizes.spaceBtwSections,
          ),

          // sign-in button

          BlocBuilder<ButtonCubit, ButtonState>(
            builder: (context, state) {
              return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: Key("submit"),
                      onPressed: () {
                        if (state is ButtonLoadingState) return;
                        context.read<ButtonCubit>().exute(
                            usecase: s1<SigninUsecase>(),
                            params: SigninReqParams(
                                email: _userName.text,
                                password: _password.text));
                      },
                      child: state is ButtonLoadingState
                          ? CircularProgressIndicator()
                          : Text(STexts.signIn)));
            },
          )
        ],
      ),
    ));
  }
}
