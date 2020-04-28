

import 'package:flutter/material.dart';
import 'package:yt_todo/env/app_env.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/main.dart';

void main() {
  setupLocator();
  AppEnvironment.setupEnv(Environment.prod);
  runApp(MyApp());
}