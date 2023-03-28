import 'package:flutter/material.dart';
import 'package:task_eastern_enterprise/src/shared/routes.dart';

class ChooseFlow extends StatelessWidget {
  static const String routeName = "ChooseFlow";
  const ChooseFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Flow'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeWithoutStateMgmt);
              },
              child: const Text('Home Without State Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeWithStateMgmt);
              },
              child: const Text('Home With State Management'),
            ),
          ],
        ),
      ),
    );
  }
}
