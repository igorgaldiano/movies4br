// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies4br/utils/text.dart';
import 'package:movies4br/widgets/descriptionTopRated.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({
    Key? key,
    required this.topRated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          modified_text(text: 'Top Rated Movies', size: 18, color: Colors.white),
          Padding(padding:EdgeInsets.only(bottom: 15), ),
          SizedBox(height: 270,
              child: ListView.builder(itemCount: topRated.length,
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
            return InkWell(
               onTap: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionTopRated(
                                    name: topRated[index]['title'],
                                    description: topRated[index]['overview'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500/' +
                                            topRated[index]['backdrop_path'],
                                    posterUrl: 'https://image.tmdb.org/t/p/w500/' + topRated[index]['poster_path'],
                                    vote: topRated
                                    [index]['vote_average'].toString(),
                                    launchOn: topRated[index]['release_date'])));
                      },

            
            child: SizedBox(
              width: 140,
              child: Column(
                children: [
                  Container(
                    child: Container(),
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                        
                            'https://image.tmdb.org/t/p/w500/' 
                            + topRated[index]['poster_path']
                      ),
                     ),
                    ),
                  ),
                  Container(child:
                   // ignore: prefer_if_null_operators
                   modified_text(text: topRated[index]['title']!= null? 
                   topRated[index]['title']:'Loading...'),
                   )
                ],
              ),
            ),
           );
           }),)
        ],
    
      )
    );
  }
}
