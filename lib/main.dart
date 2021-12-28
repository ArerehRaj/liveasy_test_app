import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/otp_screen.dart';
import './screens/add_phone_number_screen.dart';
import './screens/select_language_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liveasy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapShot) {
          if (userSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (userSnapShot.hasData) {
            // return const UserProfileScreen();
            return Container(
              alignment: Alignment.center,
              child: const Text('Home'),
            );
          }

          return const SelectLanguageScreen();
        },
      ),
      routes: {
        AddPhoneNumberScreen.routeName: (ctx) => AddPhoneNumberScreen(),
        OTPScreen.routeName: (ctx) => const OTPScreen(),
      },
    );
  }
}
