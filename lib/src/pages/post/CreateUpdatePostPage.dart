import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/services/PostServices.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/src/common/lib.dart';
import 'package:flutterapp/src/common/theme.dart';

class CreateUpdatePostPage extends StatefulWidget {
  final PostModel data;
  CreateUpdatePostPage({Key key, this.data}) : super(key: key);
  @override
  _CreateUpdatePostPageState createState() => _CreateUpdatePostPageState();
}

class _CreateUpdatePostPageState extends State<CreateUpdatePostPage> {
  final themeData = AppConceptThemeProvider.get();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool _isLoading = false;
  String _title;
  String _description;



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
                  onPressed: () {
                    if (_key.currentState.validate() && !_isLoading) {
                      setState(() {
                        _isLoading = true;
                      });
                      _key.currentState.save();
                      if (widget.data != null) {
                        PostService.update(widget.data.id,_title, _description).listen((result) { 
                            if (result.data != null) {
                              Navigator.pop(context, true);
                          }
                        });
                      } else {
                        PostService.add(_title, _description).listen((result) {
                           if (result.data != null) {
                            Navigator.of(context).pop();
                          }
                        });
                      }
                    } else {
                      setState(() {
                        _validate = true;
                        _isLoading = false;
                      });
                    }
                  },
                  child: Text(AppLocalizations.of(context).translate('SAVE'),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      )),
      body: 
      Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Form(
                  key: _key,
                  autovalidate: _validate,
                  child: Column(children: <Widget>[
                  
                    Container(
                      child: TextFormField(
                        initialValue:
                            widget.data != null ? widget.data.title : "",
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)
                              .translate('POST_TITLE'),
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white70,
                        ),
                        validator: (value) => value.length > 0
                            ? null
                            : AppLocalizations.of(context)
                                .translate('POST_TITLE_REQUIRED'),
                        onSaved: (String val) {
                          _title = val;
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: TextFormField(
                        initialValue:
                            widget.data != null ? widget.data.description : "",
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)
                              .translate('POST_DESCRIPTION'),
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white70,
                        ),
                        validator: (value) => value.length > 0
                            ? null
                            : AppLocalizations.of(context)
                                .translate('POST_DESCRIPTION_REQUIRED'),
                        onSaved: (String val) {
                          _description = val;
                        },
                      ),
                    )
                  ])),
            ),
          ),
          showLoadingPage(_isLoading)
        ],
      ),
    );
  }
}
