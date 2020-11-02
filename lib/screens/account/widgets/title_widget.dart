import 'package:chatting_with_nncthang/common/constants/constants.dart';
import 'package:chatting_with_nncthang/common/constants/dimens.dart';
import 'package:flutter/material.dart';

class TittleWidget extends StatelessWidget {
  final String title;

  const TittleWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 2,
            right: 2,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: _textStyle(themeProviderSelector(context).themeColor().titleShadowColor),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: _textStyle(themeProviderSelector(context).themeColor().titleColor),
          ),
        ],
    );
  }
}

TextStyle _textStyle(Color color){
  return TextStyle(
    fontSize: FontSize.LargeTittle,
    color: color,
    fontWeight: FontWeight.bold,
    // fontStyle: FontStyle.italic,
  );
}
