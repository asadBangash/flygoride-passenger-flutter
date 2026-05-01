import 'package:flutter/material.dart';
import 'functions/functions.dart';
import 'functions/notifications.dart';
import 'pages/loadingPage/loadingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'translations/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xff000000),
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  registerFlygorideLanguageFallbacks();

  try {
    await Firebase.initializeApp();
    firebaseInitialized = true;
  } catch (e) {
    debugPrint(
        'Firebase.initializeApp failed (add android/app/google-services.json): $e');
  }

  if (firebaseInitialized) {
    try {
      initMessaging();
    } catch (e) {
      debugPrint('initMessaging failed: $e');
    }
  }

  checkInternetConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: ValueListenableBuilder(
            valueListenable: valueNotifierBook.value,
            builder: (context, value, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'FlyGoRide-Rider',
                theme: ThemeData(
                  brightness: Brightness.dark,
                  useMaterial3: true,
                  scaffoldBackgroundColor: Colors.black,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xff22C55E),
                    brightness: Brightness.dark,
                    surface: Colors.black,
                  ),
                ),
                home: const LoadingPage(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: child!,
                  );
                },
              );
            }));
  }
}
