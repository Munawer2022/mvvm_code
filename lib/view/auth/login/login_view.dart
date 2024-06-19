import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/view_model/auth/login/login_event.dart';
import 'package:test123/view_model/injection/injection_container.dart';
import '/resource/components/app_button.dart';
import '/view_model/auth/login/login_bloc.dart';
import '/view_model/auth/login/login_state.dart';

import '/model/auth/login/login_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<LoginViewModel, LoginState>(
              builder: (context, state) {
                return Visibility(
                    visible: state.isLoading,
                    child: const LinearProgressIndicator());
              },
            ),
            Expanded(
              child: Center(
                child: BlocBuilder<LoginViewModel, LoginState>(
                  builder: (context, state) {
                    if (state.error != null) {
                      return Text(
                        state.error!,
                        textAlign: TextAlign.center,
                      );
                    }
                    return AppButton.getButton(
                        loading: state.isLoading,
                        onPressed: () => getIt<LoginViewModel>().add(Login(
                            body: LoginModel(
                                    username: 'emilys', password: 'emilyspass')
                                .toJson(),
                            context: context)),
                        child: const Text('Post API'));
                    // return AppButton.getButton(
                    //     loading: state.isLoading,
                    //     onPressed: () => cubit.login(
                    //         body: LoginModel(
                    //                 username: 'emilys', password: 'emilyspass')
                    //             .toJson(),
                    //         context: context),
                    //     child: const Text('Post API'));
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
