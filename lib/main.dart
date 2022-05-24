import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:first_web_android_studioo/enter_phone_num.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb || Platform.isAndroid
        ? FirebaseOptions(
            apiKey: "AIzaSyCleuQjFbd0I1DDKuTnTyDgRtd_hL-HQoE",
            appId: "1:441173403323:web:d9a270648b5613fb6cab9e",
            messagingSenderId: "441173403323",
            projectId: "momen-project-46027")
        : null,
  );
  runApp(
    const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      debugShowCheckedModeBanner: false,
      home: PhoneNumber(),
    ),
  );
}
