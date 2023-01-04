import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'AppLocalization.dart';
import 'localization_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(getLocale());
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextButton(
              child: Text('Test'),
              onPressed: () {},
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              getTranslated(
                context,
                "Sign in to continue",
              )!,
            ),
          ],
        ),
      ),
    );
  }
}
