// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news/article/api_request.dart';
import 'package:news/article/artical.dart';
import 'package:news/other/customListTile.dart';

class AllNews extends StatefulWidget {
  AllNews({Key key}) : super(key: key);
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
