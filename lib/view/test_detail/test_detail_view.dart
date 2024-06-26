import 'package:flutter/material.dart';
import 'package:test123/model/test/test_model.dart';
import '/view_model/test_detail/test_detail_view_model.dart';

class TestDetailView extends StatelessWidget {
  final TestDetailViewModel cubit;
  final Map<String, TestModel> model;
  const TestDetailView({super.key, required this.cubit, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model['model']!.email),
      ),
    );
  }
}
