import 'package:flutter_bloc/flutter_bloc.dart';
import '/view_model/auth/login/login_bloc.dart';

import 'injection_container.dart';

List<BlocProvider> multiBlocListInjection = [
  BlocProvider<LoginViewModel>(create: (_) => getIt()),
];
