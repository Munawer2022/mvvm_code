import 'package:flutter/material.dart';

class LoginEvent {}

class Login extends LoginEvent {
  Map<String, dynamic> body;
  BuildContext context;
  Login({required this.body, required this.context});
}
