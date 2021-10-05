import 'package:flutter/material.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Model/MovieModel.dart';
import 'package:meeco/Widget/movieCard.dart';
import 'package:provider/provider.dart';


class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final getUpcomingMovie=Provider.of<ApiService>(context, listen: false).getDiscoverMovie();
    return FutureBuilder<MovieModel?>(
        future: getUpcomingMovie,
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
