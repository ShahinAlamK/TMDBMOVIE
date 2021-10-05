import 'package:flutter/material.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Model/personModel.dart';
import 'package:meeco/Pages/latestpage.dart';
import 'package:meeco/Pages/playingPage.dart';
import 'package:meeco/Pages/popularpage.dart';
import 'package:meeco/Pages/upcomingPage.dart';
import 'package:provider/provider.dart';
import 'discoverpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final getPersonData=Provider.of<ApiService>(context, listen: false).getPerson();
    return Scaffold(
      appBar: buildAppBar(),

      body: ListView(
        children: [
          PlayingPage(),
          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(top: 15,right: 5,left: 5,bottom: 10),
            child: Row(
              children: [
                Text("Upcoming Movie",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
                Spacer(),

                Text("See All",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
              ],
            ),
          ),
          UpcomingPage(),

          Padding(
            padding: const EdgeInsets.only(top: 15,right: 5,left: 5,bottom:  10),
            child: Row(
              children: [
                Text("Top-Rate",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
                Spacer(),

                Text("See All",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
              ],
            ),
          ),
          TopRatePage(),

          Padding(
            padding: const EdgeInsets.only(top: 15,right: 5,left: 5,bottom:  10),
            child: Row(
              children: [
                Text("Popular Movie",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
                Spacer(),

                Text("See All",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
              ],
            ),
          ),
          PopularPage(),

          Padding(
            padding: const EdgeInsets.only(top: 15,right: 5,left: 5,bottom: 10),
            child: Row(
              children: [
                Text("Discover Movie",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
                Spacer(),

                Text("See All",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
              ],
            ),
          ),
          DiscoverPage(),

        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("mecco".toUpperCase(),style: TextStyle(color: Colors.orange),),
          SizedBox(width: 5,),
          Text("Movie".toUpperCase(),style: TextStyle(color: Colors.yellowAccent),),
        ],
      ),
      leading: Icon(Icons.menu,size: 30,),
      actions: [
        Icon(Icons.search_rounded,size: 30,),
        SizedBox(width: 15,)
      ],
    );
  }
}
