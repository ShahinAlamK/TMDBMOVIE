import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Model/MovieModel.dart';
import 'package:provider/provider.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage({Key? key}) : super(key: key);

  @override
  _PlayingPageState createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  @override
  Widget build(BuildContext context) {
    final getPlayingData = Provider.of<ApiService>(context, listen: false).getPlayingMovie();

    return Container(
      height: 200,
      //decoration: BoxDecoration(color: Colors.grey[900]),
      child: FutureBuilder<MovieModel?>(
          future: getPlayingData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return carouselSlider(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

Widget carouselSlider(MovieModel movieModel){
  return  CarouselSlider.builder(
    itemCount: movieModel.results==null?0:movieModel.results!.length.clamp(3,7),
    itemBuilder: (context,index,realIndex){
      final data=movieModel.results![index];
      return GestureDetector(
        onTap: (){},
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 6),
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  data.backdropPath!=null?"https://image.tmdb.org/t/p/original/"+data.posterPath!:"",
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ))),
      );
    },
    options: CarouselOptions(
      autoPlayCurve: Curves.ease,
      autoPlay: true,
      enlargeCenterPage: false,
      viewportFraction: 0.9,
      aspectRatio: 16/9,
      enableInfiniteScroll: true,
      initialPage: 2,
      autoPlayAnimationDuration: Duration(milliseconds:700),
      pageSnapping: true,
      pauseAutoPlayInFiniteScroll: true,
    ),
  );
}
