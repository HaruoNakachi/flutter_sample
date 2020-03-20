import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/src/common/theme.dart';

class CreatePostPage extends StatelessWidget {
  final themeData = AppConceptThemeProvider.get();
  CreatePostPage({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(AppLocalizations.of(context).translate('ADD_POST')),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Center(
                child: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppLocalizations.of(context).translate('CANCEL'),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: FlatButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).translate('SAVE'),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: GestureDetector(child: Image.asset(imageDefault)),
            ),
            SizedBox(height: 50),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context).translate('POST_TITLE'),
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .translate('POST_DESCRIPTION'),
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white70,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
