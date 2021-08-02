import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authController.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final User user;
  const HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    final profil = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/profil.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Tony Afriyanto',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final univ = Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        'UNIVERSITAS ESA UNGGUL',
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
    final paragraf1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Nim : 20180801323                                       FAKULTAS: ILMU KOMPUTER                     JURUSAN : TEKNIK INFORMATIKA',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final paragraf2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'DATA PRIBADI',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final paragraf3 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Tempat/Tanggal Lahir :Tangerang,28 April 1998                                                                Email: Tony.afriyanto48@Gmail.com                     Alamat: Perumahan Bukit Tiara c2NoXX Kecamatan XXXXXX Kota XXXX',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final logoutbtn = FlatButton(
      onPressed: () async {
        try {
          await AuthController.logout();
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      },
      child: Text(
        'Logout',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[
          profil,
          welcome,
          univ,
          paragraf1,
          paragraf2,
          paragraf3,
          logoutbtn,
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
