import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/resource/components/app_button.dart';
import '/view_model/auth/login/login_cubit.dart';
import '/view_model/auth/login/login_state.dart';

import '/model/auth/login/login_model.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel cubit;
  const LoginView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                state as LoginState;
                return Visibility(
                    visible: state.isLoading,
                    child: const LinearProgressIndicator());
              },
            ),
            Expanded(
              child: Center(
                child: BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    state as LoginState;
                    if (state.error != null) {
                      return Text(
                        state.error!,
                        textAlign: TextAlign.center,
                      );
                    }
                    return AppButton.getButton(
                        loading: state.isLoading,
                        onPressed: () => cubit.login(
                            body: LoginModel(
                                    username: 'emilys', password: 'emilyspass')
                                .toJson(),
                            context: context),
                        child: const Text('Post API'));
                  },
                ),
                // Consumer<LoginViewModel>(
                //   builder: (context, value, child) {
                //     return AppButton.getButton(
                //         loading: value.loading,
                //         width: 120,
                //         onPressed: () => context.read<LoginViewModel>().login(
                //             body: LoginModel(username: 'emilys', password: 'emilyspass')
                //                 .toJson(),
                //             context: context),
                //         child: const Text('Post API'));
                //   },
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
