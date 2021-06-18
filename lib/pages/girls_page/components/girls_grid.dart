import 'package:flutter/material.dart';
import 'package:whe_hub/app_data/girl_scheme.dart';

class GirlsGrid extends StatefulWidget {
  List<GirlScheme> girlsList;
  GirlsGrid({Key? key, required this.girlsList}) : super(key: key);

  @override
  _GirlsGridState createState() => _GirlsGridState();
}

class _GirlsGridState extends State<GirlsGrid> {
  @override
  Widget build(BuildContext context) {
    if (widget.girlsList.length == 0) {
      return Center(
        child: Text('Empty'),
      );
    }
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(5),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 0.5,
      children: widget.girlsList
          .map((e) => GestureDetector(
                onTap: _cardClickHandler,
                child: GridCard(
                  posterPath: e.posterPath,
                  name: e.name,
                ),
              ))
          .toList(),
    );
  }

  void _cardClickHandler() {
    Navigator.of(context).pushNamed('/main/detail');
  }
}

class GridCard extends StatelessWidget {
  String posterPath;
  String name;
  GridCard({Key? key, required this.posterPath, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.grey[900],
      child: Column(
        children: [
          Image.network(posterPath),
          Spacer(),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
          Container(
            child: Text('VIEW GAMES'),
          )
        ],
      ),
    );
  }
}
