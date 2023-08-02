
import 'package:flutter/material.dart';
import 'package:news_reader/article_model.dart';

class Single_news extends StatelessWidget {

  final Articles_model article;

  Single_news({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: article.urlToImage==null ?
                  NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.indiatoday.in%2Ftechnology%2Fnews%2Fstory%2Fcrypto-crash-what-is-happening-to-bitcoin-and-is-it-good-news-for-you-1961906-2022-06-13&psig=AOvVaw0ExRkY_WmjLwXnqDLl9syo&ust=1691052319571000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDVmfnKvYADFQAAAAAdAAAAABAE') :
                  NetworkImage(article.urlToImage.toString()),fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
            child: Text(article.title.toString(),style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
            child: Text(article.publishedAt.toString(),style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Author : ',textAlign: TextAlign.justify,style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.w600
                ),),
                Text(article.author.toString(),textAlign: TextAlign.justify,style: TextStyle(
                    fontSize: 14,fontWeight: FontWeight.w400
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Text(article.description.toString(),textAlign: TextAlign.justify,),
          ),
        ],
      ),
    );
  }

}
