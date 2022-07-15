// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies4br/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({
    Key? key,
    required this.tv,
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
          modified_text(text: 'Popular TV Shows Movies', size: 18, color: Colors.white),
          Padding(padding:EdgeInsets.only(bottom: 15), ),
          SizedBox(height: 200,
              child: ListView.builder(itemCount: tv.length,
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
            return InkWell(
               onTap: () {

            },
            child: tv[index]['backdrop_path'] != null ? Container(
              padding: EdgeInsets.all(5),
              width: 250,
              child: Column(
              
                children: [
                  Container(
                    
                     width: 250,
                    height: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                        
                            'https://image.tmdb.org/t/p/w500/' 
                            + tv[index]['backdrop_path']
                      ),fit: BoxFit.cover,

                     ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(child:
                   // ignore: prefer_if_null_operators
                   modified_text(text: tv[index]['original_name']!= null? 
                   tv[index]['original_name']:'Loading...'),
                   )
                ],
              ),
            ): Container(),
           );
           }),)
        ],
    
      )
    );
  }
}
