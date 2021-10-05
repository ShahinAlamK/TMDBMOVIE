import 'package:flutter/material.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Model/MovieModel.dart';
import 'package:meeco/Widget/movieCard.dart';
import 'package:provider/provider.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    final getUpcomingData=Provider.of<ApiService>(context, listen: false).getUpcomingMovie();
    return FutureBuilder<MovieModel?>(
        future: getUpcomingData,
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
