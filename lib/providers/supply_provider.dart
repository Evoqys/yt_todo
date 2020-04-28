

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/providers/task_provider.dart';

List<SingleChildWidget> supplyProviders() {
  return [
    ChangeNotifierProvider(
      create: (_) => locator<TaskProvider>(),
    )
  ];
}