import 'package:flutter/material.dart';
import 'package:whe_hub/pages/detail_page/detail_page.dart';
import 'package:whe_hub/pages/girls_page/girs_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        ),
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('HENTAIGAMESHUB'),
      //   ),
      //   body: GirlsPage(),
      // ),
      routes: {
        '/main': (context) => GirlsPage(),
        '/main/detail': (context) => DetailPage(),
      },
      initialRoute: '/main',
    );
  }
}
