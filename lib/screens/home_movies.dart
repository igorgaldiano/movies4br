import 'package:flutter/material.dart';
import 'package:movies4br/widgets/top_rated.dart';
import 'package:movies4br/widgets/trending.dart';
import 'package:movies4br/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../service/api.dart';
import '../service/auth_service.dart';

//Defini a tela principal de filmes
class HomeMovies extends StatefulWidget {
  HomeMovies({Key? key}) : super(key: key);

  @override
  State<HomeMovies> createState() => _HomeMovies();
}

class _HomeMovies extends State<HomeMovies> {
  //lista de movies e tv
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvMovies = [];

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  //function
  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        // ignore: prefer_const_constructors
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    // ignore: avoid_print
    print(trendingResult);

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tvMovies = tvResult['results'];
    });
    // ignore: avoid_print
    //print(trendingMovies);
    //print('\ntopRatedMovies');
    //print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Brazil 4 Movies 🇧🇷',
              style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                AuthService.instance.logOut();
              },
              icon: Icon(
                Icons.person,
              ),
              label: Text('logout'),
            ),
          ],
        ),
        body: ListView(
          children: [
            TV(tv: tvMovies),
            TopRated(topRated: topRatedMovies),
            TrendingMovies(
              trending: trendingMovies,
            ),
          ],
        ));
  }
}
