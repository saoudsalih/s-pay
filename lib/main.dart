import 'package:flutter/material.dart';
import 'package:s_pay/config/routes/routes.dart';
import 'package:s_pay/config/themes/theme.dart';
import 'package:s_pay/presentation/pages/auth/login/auth/auth_cubit.dart';
import 'package:s_pay/presentation/pages/auth/login/button/button_cubit.dart';
import 'package:s_pay/presentation/pages/auth/login/login.dart';
import 'package:s_pay/presentation/pages/wallet/wallet_main.dart';
import 'package:s_pay/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => s1<AuthStateCubit>()..appStarted()),
        BlocProvider(create: (context) => ButtonCubit(s1<AuthStateCubit>())),
        ],
      child: MaterialApp(
        title: 'S-Pay',
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: SAppTheme.lightTheme,
        darkTheme: SAppTheme.lightTheme,
        routes: routes,
        home: AuthWidget(),
        // initialRoute: LoginScreen.routeName,
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStateCubit,AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return WalletMain();
        }
        if (state is UnAuthenticated) {
          return LoginScreen();
        }
    
        return Container();
      },
    );
  }
}
