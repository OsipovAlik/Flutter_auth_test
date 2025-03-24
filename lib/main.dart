import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/routes/task_app.dart';
import 'package:flutter_task/utils/device_utils.dart';
import 'package:flutter_task/widgets/restart_widget/restart_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await DeviceUtils.initializeLanguage();
  runApp(const RestartWidget(child: MyApp()));
}
