import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/services/PostServices.dart';
import 'package:flutterapp/src/common/lib.dart';
import 'package:flutterapp/src/common/theme.dart';
import 'package:gql_exec/gql_exec.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<PostModel> postList = List<PostModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final themeData = AppConceptThemeProvider.get();
    Image converBase64ToImage(base64Image) {
      var _bytesImage = Base64Decoder().convert(base64Image);
      return Image.memory(_bytesImage);
    }

    ListTile makeListTile(PostModel post) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: converBase64ToImage(post.image),
          title: Text(
            post.title != null ? post.title : "",
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
              post.description != null ? post.description : "",
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 3,
              style: TextStyle(
                  color: themeData.textTheme.display3.color, fontSize: 12),
            ),
          ),
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
    makeBody(ListPostModels list) {
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list.items.length,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(list.items[index]);
          },
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              title: Text(AppLocalizations.of(context).translate('APP')),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () => Navigator.pushNamed(context, '/post/createAndUpdate'),
                )
              ],
            ),
            body: StreamBuilder<Response>(
                stream: PostService.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {  
                    ListPostModels list = ListPostModels.fromJson(
                        snapshot.data.data['listPostModels']);
                    return makeBody(list);
                  }
                  return showLoading();
                })));
  }
}
