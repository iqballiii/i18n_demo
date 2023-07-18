import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/screens/home.dart';
import 'package:testing_app/utils/shared_prefs.dart';

enum Language {
  english,
  arabic,
}

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});
  static String routeName = '/change_language_page';

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  late Language _language;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    // print("Testing Language ${context.locale.languageCode}");
    switch (Prefs.getString(Prefs.LANGUAGE, def: 'en')) {
      case 'en':
        _language = Language.english;
        // context.setLocale(const Locale('en', 'US'));
        break;
      case 'ar':
        _language = Language.arabic;
        // context.setLocale(const Locale('ar'));
        break;
      // case 'es':
      //   _language = Language.spanish;
      //   break;

      // case 'it':
      //   _language = Language.italian;
      //   break;

      // case 'pt':
      //   _language = Language.portuguese;
      //   break;

      default:
        _language = Language.english;
        break;
    }
    // });
  }

  _changeLanguage(int index) async {
    switch (index) {
      case 0:
        _language = Language.english;
        await context.setLocale(const Locale('en', 'US'));
        Prefs.setString(Prefs.LANGUAGE, 'en');
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (route) => false);
        }
        break;

      case 1:
        _language = Language.arabic;
        await context.setLocale(const Locale('ar'));
        Prefs.setString(Prefs.LANGUAGE, 'ar');
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (route) => false);
        }
        break;

      // case 2:
      //   _language = Language.italian;
      //   // Prefs.setString(Prefs.LANGUAGE, 'it');
      //   break;

      // case 3:
      //   _language = Language.portuguese;
      // Prefs.setString(Prefs.LANGUAGE, 'pt');
      // break;
      default:
        _language = Language.english;
        break;
    }
    setState(() {});

    if (kDebugMode) {
      print("language changed to $_language");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'language_settings'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile(
              value: Language.english,
              onChanged: (value) => _changeLanguage(0),
              groupValue: _language,
              title: Text('english'.tr()),
            ),
            const Divider(
              height: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            // RadioListTile(
            //   value: Language.spanish,
            //   onChanged: (value) => _changeLanguage(1),
            //   groupValue: _language,
            //   title: Text('spanish'.tr()),
            // ),
            // const Divider(
            //   height: 0.5,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            RadioListTile(
              value: Language.arabic,
              onChanged: (value) => _changeLanguage(1),
              groupValue: _language,
              title: Text('arabic'.tr()),
            ),
            // const Divider(
            //   height: 0.5,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            // RadioListTile(
            //   value: Language.portuguese,
            //   onChanged: (value) => _changeLanguage(3),
            //   groupValue: _language,
            //   title: Text('portuguese'.tr()),
            // ),
          ],
        ),
      ),
    );
  }
}
