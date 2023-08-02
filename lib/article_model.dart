import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news_reader/source_model.dart';


class Articles_model{
  Source? source;
  String? author;
  String? title='';
  String? description='';
  String? url='';
  String? urlToImage='';
  String? publishedAt='';
  String? content='';

  Articles_model({
    this.source,this.author,
    this.title,this.description,
    this.url,this.urlToImage,
    this.publishedAt,this.content,
  });

  factory Articles_model.fromJson(Map<String , dynamic> json){
    return Articles_model(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']
    );
  }
}

// b91e587638814581ba5b7d8f8e586942