import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/view_model/test/test_state.dart';

import 'package:provider/provider.dart';
import '/utils/typedef_models.dart';
import '/view_model/test/test_cubit.dart';
import '/resource/status_switcher.dart';
import 'package:shimmer/shimmer.dart';

class TestView extends StatelessWidget {
  final TestViewModel cubit;
  const TestView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ElevatedButton(
            onPressed: () => cubit.removeToken(context),
            child: const Text('remove')),
      ),
      body: Column(
        children: [
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              state as TestState;
              return StatusSwitcher<TypedefTest>(
                  response: state.response,
                  onLoading: (context) => const LinearProgressIndicator(),
                  onError: (context, message) => const SizedBox(),
                  onCompleted: (context, data) => const SizedBox());
            },
          ),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: cubit.refresh,
              child: ListView(
                children: [
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      state as TestState;
                      return StatusSwitcher<TypedefTest>(
                          response: state.response,
                          onLoading: (context) => Shimmer.fromColors(
                              period: const Duration(milliseconds: 300),
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 30,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12)),
                              )),
                          onError: (context, message) => const SizedBox(),
                          onCompleted: (context, data) => Center(
                              child: Text(data.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium)));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Consumer<TestViewModel>(
      //   builder: (context, value, child) {
      //     return StatusSwitcher<TypedefTest>(
      //         response: value.response,
      //         onLoading: (context) =>
      //             const Center(child: CircularProgressIndicator.adaptive()),
      //         onError: (context, message) => Center(
      //             child: Text(message,
      //                 style: Theme.of(context).textTheme.titleMedium)),
      //         onCompleted: (context, data) => Center(
      //             child: Text(data.email,
      //                 style: Theme.of(context).textTheme.titleMedium)));
      //   },
      // ),
    );
  }
}
