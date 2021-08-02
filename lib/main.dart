import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authController.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        initialData: null,
        value: AuthController.ustream,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ));
  }
}

// class MyApp extends StatelessWidget {
//   final routes = <String, WidgetBuilder>{
//     LoginPage.tag: (context) => LoginPage(),
//     HomePage.tag: (context) => HomePage(),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kodeversitas',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//         fontFamily: 'Nunito',
//       ),
//       home: LoginPage(),
//       routes: routes,
//     );
//   }
// }

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return (user != null) ? HomePage(user) : LoginPage() ;
  }
}
