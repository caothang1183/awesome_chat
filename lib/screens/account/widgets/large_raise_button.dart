import 'package:chatting_with_nncthang/common/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeRaiseButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color labelColor;
  final String label;
  final String prefixIcon;
  final double height;
  final Function onTap;

  const LargeRaiseButtonWidget({
    Key key,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
    this.label = "",
    this.prefixIcon = "",
    this.height = 50.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: onTap,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixIcon.isNotEmpty ? Container(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset(
                  AppIcons.googleIcon,
                  height: 18.0,
                  width: 18.0,
                ),
              ) : Container(),
              Text(
                label,
                style: TextStyle(
                  color: labelColor,
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          animationDuration: Duration(milliseconds: 300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
