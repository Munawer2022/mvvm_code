import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeViewModel extends Cubit<bool> {
  ThemeViewModel() : super(false);

  void setTheme(bool isDarkTheme) => emit(isDarkTheme);
}

// import 'package:flutter/material.dart';

// class ThemeViewModel extends ChangeNotifier {
//   bool _isDarkTheme = false;

//   bool get isDarkTheme => _isDarkTheme;

//   void setTheme(bool isDarkTheme) {
//     _isDarkTheme = isDarkTheme;
//     notifyListeners();
//   }
// }
