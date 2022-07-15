// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies4br/utils/text.dart';
import 'package:movies4br/widgets/descriptionTrending.dart';


class TrendingMovies extends StatelessWidget {
  final List trending;
  final bool _isloaded = false;

  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            modified_text(text: 'Trending Movies', size: 18, color: Colors.white),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            SizedBox(
              height: 270,
              child: ListView.builder(
                  itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionTrending(
                                    name: trending[index]['title'],
                                    description: trending[index]['overview'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500/' +
                                            trending[index]['backdrop_path'],
                                    posterUrl: 'https://image.tmdb.org/t/p/w500/' + trending[index]['poster_path'],
                                    vote: trending[index]['vote_average'].toString(),
                                    launchOn: trending[index]['release_date'])));
                      },
                      child:  trending[index]['title']!=null ? SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                             
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                            ),
                            Container(
                              child:
                                  // ignore: prefer_if_null_operators
                                  modified_text(
                                      text: trending[index]['title'] != null
                                          ? trending[index]['title']
                                          : 'Loading...'),
                            )
                          ],
                        ),
                      ): Container(),
                    );
                  }),
            )
          ],
        ));
  }
}
