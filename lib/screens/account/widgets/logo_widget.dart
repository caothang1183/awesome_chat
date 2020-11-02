import 'package:chatting_with_nncthang/common/constants/constants.dart';
import 'package:chatting_with_nncthang/common/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatefulWidget {
  final ValueChanged onToggleCallBack;

  const LogoWidget({
    Key key,
    this.onToggleCallBack,
  }) : super(key: key);

  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onToggleCallBack(1);
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 3,
            right: 3,
            child: SvgPicture.asset(
              AppIcons.linkIcon,
              height: 150,
              width: 150,
              color: themeProviderSelector(context).themeColor().titleShadowColor,
            ),
          ),
          SvgPicture.asset(
            AppIcons.linkIcon,
            height: 150,
            width: 150,
            color: themeProviderSelector(context).themeColor().primaryColor,
          ),
        ],
      ),
    );
  }
}
