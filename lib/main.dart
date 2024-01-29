import 'package:chat_message/provider/auth/auth_provider.dart';
import 'package:chat_message/provider/nav/nav_provider.dart';
import 'package:chat_message/screen/auth/register_screen.dart';
import 'package:chat_message/screen/home/home_screen.dart';
import 'package:core/core/constants/colors.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:encrypt/encrypt.dart' as et;
import 'package:flutter/material.dart';
import 'package:preload_image/screen/preload_image_screen.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/screen/tiktok_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://tdfmugpwlnqnoiiukjrh.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRkZm11Z3B3bG5xbm9paXVranJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY0NTA0NjAsImV4cCI6MjAyMjAyNjQ2MH0.4XiikWs-Ir7wMh-q9DD7aIrq9K8f2QW7lK31Qph5EjA'
  );
  runApp(const MyApp());
}

void testCode() {
  const token = "iajsodijaosijdoisajo.iassdsdsdsjd.sdsasdasds";
  final key = et.Key.fromUtf8("023749032${token.split(".")[1]}");
  final encrypter = et.Encrypter(et.AES(key, mode: et.AESMode.cfb64));
  final encrypted = encrypter.encrypt("data");
  print(encrypted.base64);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChange(ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.black54)),
          fontFamily: "Gordita")),
      child: const ThemeWrapaper(),
    );
  }
}

class ThemeWrapaper extends StatelessWidget {
  const ThemeWrapaper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return const MaterialApp(
      home: const HomeScreen(),
    );
  }
}
