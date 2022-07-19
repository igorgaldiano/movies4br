import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies4br/utils/text.dart';

class DescriptionTopRated extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchOn;

  const DescriptionTopRated({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Top Rated 🇧🇷',
              style: TextStyle(color: Colors.black)),
        
        ),
      // ignore: prefer_const_constructors
      backgroundColor:  Colors.black12,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: modified_text(
                  text: '⭐Average Rating - $vote',
                  size: 16,
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(bottom: 10)),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : 'Not Loaded',
                size: 18,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: 'Releasing On - $launchOn',
                color: Colors.orangeAccent,
                size: 12,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 100,
                  child: Image.network(
                    posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: modified_text(
                      text: description,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
