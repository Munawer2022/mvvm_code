import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/resource/global.dart';
import '/view_model/injection/injection_container.dart';
import '/resource/app_theme.dart';
import '/utils/routes/routes.dart';
import '/utils/routes/routes_name.dart';
import '/utils/show/checker_navigator_observer.dart';
import 'view_model/injection/multi_bloc_list_injection.dart';
import 'view_model/injection/multi_provider_list_injection.dart';
import 'view_model/theme/theme_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  // setCustomSystemUIOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
      MultiBlocProvider(providers: multiBlocListInjection, child: const MyApp())
      // MultiProvider(
      //     providers: multiProvidersListInjection, child: const MyApp())
      // const MyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder(
            bloc: getIt<ThemeViewModel>(),
            builder: (context, state) {
              state as bool;
              return MaterialApp(
                navigatorKey: navigatorKey,
                scaffoldMessengerKey: scaffoldMessengerKey,
                navigatorObservers: [CheckerNavigatorObserver()],
                debugShowCheckedModeBanner: false,
                // theme: lightTheme,
                theme: state ? darkTheme : lightTheme,
                initialRoute: RoutesName.splash,
                onGenerateRoute: Routes().generateRoute,
              );
            }),
      );
}
