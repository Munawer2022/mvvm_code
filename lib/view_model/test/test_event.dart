import 'package:flutter/material.dart';
import 'package:test123/model/test/test_model.dart';

class TestEvent {}

class Test extends TestEvent {
  BuildContext context;
  Test({required this.context});
}

class OnInit extends TestEvent {}

class RemoveToken extends TestEvent {
  BuildContext context;
  RemoveToken({required this.context});
}

class OnThemeChanged extends TestEvent {
  bool value;
  OnThemeChanged({required this.value});
}

class NavigateToTestDetail extends TestEvent {
  BuildContext context;
  TestModel model;
  NavigateToTestDetail({required this.context, required this.model});
}

class Refresh extends TestEvent {
  BuildContext context;
  Refresh({required this.context});
}
