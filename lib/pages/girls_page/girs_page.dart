import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whe_hub/app_data/girl_scheme.dart';

import 'package:http/http.dart' as http;

import 'components/girls_grid.dart';

class GirlsPage extends StatefulWidget {
  const GirlsPage({Key? key}) : super(key: key);

  @override
  _GirlsPageState createState() => _GirlsPageState();
}

class _GirlsPageState extends State<GirlsPage> {
  List<GirlScheme> girlsList = [];
  @override
  void initState() {
    // TODO: implement initState
    _fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hentaigameshub'),
      ),
      body: GirlsGrid(
        girlsList: girlsList,
      ),
    );
  }

  Future<void> _fetchAlbum() async {
    final request =
        await http.get(Uri.parse('https://hentaigameshub.com/pers/all'));
    print('che');
    if (request.statusCode == 200) {
      print('da');
      final list = jsonParseToList(request.body);

      setState(() {
        girlsList = list;
      });
    }
  }

  List<GirlScheme> jsonParseToList(String body) {
    List<GirlScheme> list = [];
    (json.decode(body) as List).forEach((element) {
      list.add(GirlScheme(
          name: element['name'],
          id: element['_id'],
          posterPath: element['posterPath'],
          bannerPath: element['bannerPath']));
    });
    return list;
  }
}
