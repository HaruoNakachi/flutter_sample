import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/generated/app_localizations.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroPage extends StatelessWidget {

  Widget build(BuildContext context) {
      
    final pages = [
      PageViewModel(
          pageColor: const Color(0xFF03A9F4),
          bubble: Image.asset(imageDefault),
          body: Text(
            AppLocalizations.of(context).translate('INTRO_DESCRIPTION_1'),
          ),
          title: Text(
            AppLocalizations.of(context).translate('INTRO_TITLE_1'),
          ),
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          mainImage: Image.asset(
            imageDefault,
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          )),
      PageViewModel(
        pageColor: const Color(0xFF8BC34A),
        iconImageAssetPath: imageDefault,
        body: Text(
         AppLocalizations.of(context).translate('INTRO_DESCRIPTION_2'),
        ),
        title: Text(AppLocalizations.of(context).translate('INTRO_TITLE_2'),),
        mainImage: Image.asset(
          imageDefault,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        iconImageAssetPath: imageDefault,
        body: Text(
          AppLocalizations.of(context).translate('INTRO_DESCRIPTION_3'),
        ),
        title: Text(AppLocalizations.of(context).translate('INTRO_TITLE_3'),),
        mainImage: Image.asset(
          imageDefault,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ];
    return IntroViewsFlutter(
      pages,
      showNextButton: true,
      showBackButton: true,
      backText: Text(AppLocalizations.of(context).translate('BACK')),
      skipText: Text(AppLocalizations.of(context).translate('SKIP')),
      nextText: Text(AppLocalizations.of(context).translate('NEXT')),
      doneText: Text(AppLocalizations.of(context).translate('FINISH')),
      onTapDoneButton: () { 
        Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
      },
      pageButtonTextStyles: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
      ),
    );
  }
}
