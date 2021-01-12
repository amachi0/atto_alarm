import 'package:admob_flutter/admob_flutter.dart';
import 'package:atcoderapp/pages/home.dart';
import 'package:atcoderapp/states/firebase_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FirebaseState()),
        ],
        child: MaterialApp(
            title: 'あっとアラーム',
            theme: ThemeData(
                primarySwatch: Colors.grey,
                primaryColorBrightness: Brightness.dark),
            darkTheme: ThemeData(brightness: Brightness.dark),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ja', 'JP'),
            ],
            home: MyHomePage()));
  }
}
