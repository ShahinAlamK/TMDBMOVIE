import 'package:flutter/material.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Model/MovieModel.dart';
import 'package:meeco/Widget/movieCard.dart';
import 'package:provider/provider.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    final getPopularMovie=Provider.of<ApiService>(context, listen: false).getPopularMovie();
    return FutureBuilder<MovieModel?>(
        future: getPopularMovie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return movieCard(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
