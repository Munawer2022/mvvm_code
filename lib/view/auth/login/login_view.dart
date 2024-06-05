import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/resource/components/app_button.dart';
import '/view_model/auth/login/login_view_model.dart';

import '/model/auth/login/login_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (context, value, child) {
            return AppButton.getButton(
                loading: value.loading,
                width: 120,
                onPressed: () => context.read<LoginViewModel>().login(
                    body: LoginModel(username: 'emilys', password: 'emilyspass')
                        .toJson(),
                    context: context),
                child: const Text('Post API'));
          },
        ),
      ),
    );
  }
}
