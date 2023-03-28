import 'package:flutter/material.dart';
import 'package:task_eastern_enterprise/src/shared/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Eastern Enterprise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.chooseFlow,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
