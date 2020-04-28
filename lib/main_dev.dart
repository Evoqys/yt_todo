

import 'package:flutter/material.dart';
import 'package:yt_todo/env/app_env.dart';
import 'package:yt_todo/main.dart';

import 'locator.dart';

void main() {
  setupLocator();
  AppEnvironment.setupEnv(Environment.dev);
  runApp(MyApp());
}