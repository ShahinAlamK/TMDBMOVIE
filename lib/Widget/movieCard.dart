import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meeco/Model/MovieModel.dart';

Widget movieCard(MovieModel movieModel) {
  return Container(
    height: 220,
    width: double.infinity,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieModel.results!.length,
        itemBuilder: (context, index) {
          final data = movieModel.results![index];
          return Container(
            margin: EdgeInsets.all(6),
            width: 120,
            height: 200,
            //decoration: BoxDecoration(color: Colors.blueGrey[900]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blueGrey[900]),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original/" + data.posterPath!,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                Text(
                  data.title!,maxLines: 1,overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    RatingBar(
                        itemSize: 12,
                        allowHalfRating: true,
                        initialRating: data.voteAverage! / 2,
                        ratingWidget: RatingWidget(
                          empty: Icon(Icons.star_border),
                          half: Icon(
                            Icons.star_half,
                            color: Colors.orange,
                          ),
                          full: Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                          ),
                        ),
                        onRatingUpdate: (val) {
                          print(val);
                        }),
                    Spacer(),
                    Text(
                        data.voteCount.toString()
                    ),
                  ],
                ),

                SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        }),
  );
}