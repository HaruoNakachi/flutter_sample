import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:flutterapp/src/common/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<PostModel> posts;
  var openNotification = false;

  @override
  void initState() {
    posts = getPost();
    print(posts.length);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final themeData = AppConceptThemeProvider.get();
    ListTile makeListTile(PostModel post) => ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: FadeInImage.assetNetwork(
            placeholder: imageDefault,
            image: post.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          title: Text(
            post.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
                color: themeData.cardColor,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
            post.description,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 3,
            style: TextStyle(
                color: themeData.textTheme.display3.color, fontSize: 12),
          ),),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20.0),
          onTap: () {
            Navigator.pushNamed(context, '/post', arguments: post);
          },
        );
    Card makeCard(PostModel lesson) => Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );
    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(posts[index]);
        },
      ),
    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(AppLocalizations.of(context).translate('APP')),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),
      body: makeBody,
    ));
  }
}

List<PostModel> getPost() {
  return [
    PostModel(
        id: 1,
        title: 'What is Lorem Ipsum?',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRkju91a7pqVFYYUek01k0HOhvUMwnP1EQFa5_scC0R2AngPJDy')
  ];
}
