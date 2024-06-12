import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '/resource/global.dart';
import '/view_model/injection/injection_container.dart';
import '/resource/app_theme.dart';
import '/utils/routes/routes.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/injection/multi_provider_list_injection.dart';
import '/utils/show/checker_navigator_observer.dart';

void main() async {
  // setCustomSystemUIOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiProvider(providers: multiProvidersListInjection, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          navigatorObservers: [CheckerNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes().generateRoute,
        ),
      );
}
