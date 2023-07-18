import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/screens/change_language.dart';
import 'package:testing_app/screens/splash.dart';
import 'package:testing_app/utils/shared_prefs.dart';
import 'models/favorites.dart';
import 'screens/favorites.dart';
import 'screens/home.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Prefs().load();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      child: const TestingApp()));
}

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: SplashPage.routeName,
//       builder: (context, state) {
//         return const SplashPage();
//       },
//       routes: [
//         GoRoute(
//           path: HomePage.routeName,
//           builder: (context, state) {
//             return const HomePage();
//           },
//         ),
//         GoRoute(
//           path: FavoritesPage.routeName,
//           builder: (context, state) {
//             return const FavoritesPage();
//           },
//         ),
//         GoRoute(
//           path: ChangeLanguagePage.routeName,
//           builder: (context, state) {
//             return const ChangeLanguagePage();
//           },
//         ),
//       ],
//     ),
//   ],
// );

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('en'), // English
        //   // Locale('es'), // Spanish
        //   Locale('ar'), // Arabic
        // ],
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        title: "testing_sample".tr(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          HomePage.routeName: (context) => const HomePage(),
          FavoritesPage.routeName: (context) => const FavoritesPage(),
          ChangeLanguagePage.routeName: (context) => const ChangeLanguagePage(),
        },
        initialRoute: SplashPage.routeName,
      ),
    );
  }
}
