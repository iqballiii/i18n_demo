import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/shared_prefs.dart';
import 'home.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    });
    return Scaffold(
      backgroundColor: Colors.primaries.first.shade100,
      body: Center(
        child: Text(
          'welcome'.tr(args: [
            Prefs.getString(Prefs.LANGUAGE) == 'en' ? "Iqbal" : 'اقبال'
          ]),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
