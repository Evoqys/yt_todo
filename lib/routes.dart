

import 'package:flutter/material.dart';
import 'package:yt_todo/presentations/landing.dart';
import 'package:yt_todo/presentations/task_details.dart';

Map<String, WidgetBuilder> getRoutes = {
  '/' : (context) => Landing(),
  '/addTask' : (context) => TaskDetails()
};