import 'package:flutter/material.dart';
import 'authController.dart';
// import 'home_page.dart';

import 'register.dart';

class LoginPage extends StatelessWidget {
  static String tag = 'login-page';
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 120.0,
        child: Image.asset('assets/losse.png'),
      ),
    );

    final email = TextFormField(
      controller: emailCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'masukan email Anda',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passCtrl,
      autofocus: false,
      // initialValue: '12345',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          // Navigator.of(context).pushNamed(HomePage.tag);
          try {
            await AuthController.login(
                emailCtrl.text.toString().trim(), passCtrl.text);
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final register = FlatButton(
      child: Text(
        'Register, Jika belum punya',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Register()));
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            register,
          ],
        ),
      ),
    );
  }
}

// class LoginPage extends StatefulWidget {
//   static String tag = 'login-page';
//   @override
//   _LoginPageState createState() => new _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailCtrl = TextEditingController();
//   final TextEditingController passCtrl = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 120.0,
//         child: Image.asset('assets/losse.png'),
//       ),
//     );

//     final email = TextFormField(
//       controller: emailCtrl,
//       keyboardType: TextInputType.emailAddress,
//       autofocus: false,
//       initialValue: 'masukan email Anda',
//       decoration: InputDecoration(
//         hintText: '',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );

//     final password = TextFormField(
//       controller: passCtrl,
//       autofocus: false,
//       initialValue: '12345',
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );

//     final loginButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         onPressed: () async {
//           // Navigator.of(context).pushNamed(HomePage.tag);
//           try {
//             await AuthController.login(
//                 emailCtrl.text.toString().trim(), passCtrl.text);
//           } catch (e) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(e.toString())));
//           }
//         },
//         padding: EdgeInsets.all(12),
//         color: Colors.lightBlueAccent,
//         child: Text('Log In', style: TextStyle(color: Colors.white)),
//       ),
//     );

//     final register = FlatButton(
//       child: Text(
//         'Register, Jika belum punya',
//         style: TextStyle(color: Colors.black54),
//       ),
//       onPressed: () {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => Register()));
//       },
//     );

//     final forgotLabel = FlatButton(
//       child: Text(
//         'Lupa password?',
//         style: TextStyle(color: Colors.black54),
//       ),
//       onPressed: () {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => Forgot()));
//       },
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: ListView(
//           shrinkWrap: true,
//           padding: EdgeInsets.only(left: 24.0, right: 24.0),
//           children: <Widget>[
//             logo,
//             SizedBox(height: 48.0),
//             email,
//             SizedBox(height: 8.0),
//             password,
//             SizedBox(height: 24.0),
//             loginButton,
//             register,
//             forgotLabel
//           ],
//         ),
//       ),
//     );
//   }
// }
