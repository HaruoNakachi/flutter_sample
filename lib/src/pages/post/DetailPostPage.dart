import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/src/common/global.dart'; 

class DetailPostPage extends StatelessWidget {
  final PostModel data;
  DetailPostPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
               backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(data.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: FadeInImage.assetNetwork(
                    placeholder: imageDefault,
                    image: data.image,
                    fit: BoxFit.cover,
                  )),
                   actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.white,),
                      onPressed: () => showDialogDeletePost(context),
                      )
                  ],
            ),
          ];
        },
        body: Padding(padding: const EdgeInsets.all(10),child: Text(data.description),),
      ),
    );
  }
}

showDialogDeletePost(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(AppLocalizations.of(context).translate('DELETE'), style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(AppLocalizations.of(context).translate('ARE_YOU_SURE_YOU_WANT_TO_DELETE_THIS_POST'),style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).translate('ACCEPT'),style: TextStyle(color: Colors.white)),
            onPressed: () {
               Navigator.of(context).pop();
               Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).translate('CANCEL'),style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}