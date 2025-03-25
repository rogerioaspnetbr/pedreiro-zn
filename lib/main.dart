import 'package:flutter/material.dart';
import 'package:pedreiro_zn/app/app_widget.dart';
import 'package:pedreiro_zn/app/core/di/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const AppWidget());
}