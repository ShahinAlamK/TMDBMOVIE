import 'package:flutter/material.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Model/MovieModel.dart';
import 'package:meeco/Widget/movieCard.dart';
import 'package:provider/provider.dart';

class TopRatePage extends StatefulWidget {
  const TopRatePage({Key? key}) : super(key: key);

  @override
  _TopRatePageState createState() => _TopRatePageState();
}

class _TopRatePageState extends State<TopRatePage> {
  @override
  Widget build(BuildContext context) {
    final getLatestData=Provider.of<ApiService>(context, listen: false).getTopRateMovie();
    return FutureBuilder<MovieModel?>(
        future: getLatestData,
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
