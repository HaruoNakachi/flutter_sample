import 'dart:convert';  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/services/PostServices.dart';
import 'package:flutterapp/src/common/lib.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DetailPostPage extends StatefulWidget {
  final PostModel data;
  DetailPostPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> with TickerProviderStateMixin {

  Widget build(BuildContext context) {
    return FutureBuilder<QueryResult>(
        future: PostService.getDetail(widget.data.id),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
           
            PostModel post =
                PostModel.fromJson(snapshot.data.data['getPostModel']);
            Image converBase64ToImage(base64Image) {
              var _bytesImage = Base64Decoder().convert(base64Image);
              return Image.memory(_bytesImage);
            } 
            return Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(post.title != null ? post.title : "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            )),
                        background: converBase64ToImage(post.image),
                      ),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () =>  Navigator.pushNamed(context, '/post/createAndUpdate', arguments: post),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              showDialogDeletePost(context, post.id),
                        ),
                        
                      ],
                    ),
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(post.description != null ? post.description : ""),
                ),
              ),
            );
          }
          return showLoading();
        });
  }
}

showDialogDeletePost(context, id) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(
          AppLocalizations.of(context).translate('DELETE'),
          style: TextStyle(color: Colors.white),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                    AppLocalizations.of(context)
                        .translate('ARE_YOU_SURE_YOU_WANT_TO_DELETE_THIS_POST'),
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).translate('ACCEPT'),
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              PostService.remove(id).then((result) {
                if (result.data != null) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                }
              }).catchError((e) {
                return false;
              }).whenComplete(() => null);
            },
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).translate('CANCEL'),
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
