import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/view_model/test/test_state.dart';

import 'package:provider/provider.dart';
import '/utils/typedef_models.dart';
import '/view_model/test/test_cubit.dart';
import '/resource/status_switcher.dart';
import 'package:shimmer/shimmer.dart';

class TestView extends StatefulWidget {
  final TestViewModel cubit;
  const TestView({super.key, required this.cubit});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  TestViewModel get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder(
              bloc: widget.cubit,
              builder: (context, state) {
                state as TestState;
                return Switch(
                    inactiveTrackColor: Colors.red,
                    value: state.isDarkTheme,
                    onChanged: widget.cubit.onThemeChanged);
              }),
        ],
        title: ElevatedButton(
            onPressed: () => widget.cubit.removeToken(context),
            child: const Text('remove')),
      ),
      body: Column(
        children: [
          BlocBuilder(
            bloc: widget.cubit,
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
              onRefresh: widget.cubit.refresh,
              child: ListView(
                children: [
                  BlocBuilder(
                    bloc: widget.cubit,
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
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test123/view_model/test/test_view_model.dart';
// import '/view_model/test/test_state.dart';

// import 'package:provider/provider.dart';
// import '/utils/typedef_models.dart';
// import '/view_model/test/test_cubit.dart';
// import '/resource/status_switcher.dart';
// import 'package:shimmer/shimmer.dart';

// class TestView extends StatefulWidget {
//   final TestViewModel cubit;
//   const TestView({super.key, required this.cubit});

//   @override
//   State<TestView> createState() => _TestViewState();
// }

// class _TestViewState extends State<TestView> {
//   TestViewModel get cubit => widget.cubit;

//   @override
//   void initState() {
//     super.initState();
//     cubit.onInit();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           Consumer<TestViewModel>(builder: (context, state, child) {
//             return Switch(
//                 inactiveTrackColor: Colors.red,
//                 value: state.isDarkTheme,
//                 onChanged: widget.cubit.onThemeChanged);
//           }),
//         ],
//         title: ElevatedButton(
//             onPressed: () => widget.cubit.removeToken(context),
//             child: const Text('remove')),
//       ),
//       body: Column(
//         children: [
//           Consumer<TestViewModel>(
//             builder: (context, state, child) {
//               return StatusSwitcher<TypedefTest>(
//                   response: state.response,
//                   onLoading: (context) => const LinearProgressIndicator(),
//                   onError: (context, message) => const SizedBox(),
//                   onCompleted: (context, data) => const SizedBox());
//             },
//           ),
//           Expanded(
//             child: RefreshIndicator.adaptive(
//               onRefresh: widget.cubit.refresh,
//               child: ListView(
//                 children: [
//                   Consumer<TestViewModel>(
//                     builder: (context, state, child) {
//                       return StatusSwitcher<TypedefTest>(
//                           response: state.response,
//                           onLoading: (context) => Shimmer.fromColors(
//                               period: const Duration(milliseconds: 300),
//                               baseColor: Colors.grey[200]!,
//                               highlightColor: Colors.grey[100]!,
//                               child: Container(
//                                 height: 30,
//                                 width: double.infinity,
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 30),
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.shade200,
//                                     borderRadius: BorderRadius.circular(12)),
//                               )),
//                           onError: (context, message) => const SizedBox(),
//                           onCompleted: (context, data) => Center(
//                               child: Text(data.email,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium)));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
