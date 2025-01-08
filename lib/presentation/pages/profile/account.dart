import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_pay/domain/usecases/logout.dart';
import 'package:s_pay/presentation/pages/auth/login/auth/auth_cubit.dart';
import 'package:s_pay/service_locator.dart';

class MyAccountScreen extends StatefulWidget {
  static String routeName = "/my-account";
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            // BlocProvider.of<ButtonCubit>(context).exute(usecase: s1<LogoutUseCase>());
            context.read<AuthStateCubit>().appLogout(usecase: s1<LogoutUseCase>());
          },
          child: Text("SignOut")),
    );
  }
}
