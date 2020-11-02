import 'package:chatting_with_nncthang/common/constants/constants.dart';
import 'package:chatting_with_nncthang/common/constants/dimens.dart';
import 'package:chatting_with_nncthang/common/constants/images.dart';
import 'package:chatting_with_nncthang/common/constants/routes.dart';
import 'package:chatting_with_nncthang/common/constants/strings.dart';
import 'package:chatting_with_nncthang/common/themes/theme_changer.dart';
import 'package:chatting_with_nncthang/common/widgets.dart';
import 'package:chatting_with_nncthang/redux/actions/navigation_action.dart';
import 'package:chatting_with_nncthang/redux/selectors/app_selector.dart';
import 'package:chatting_with_nncthang/screens/account/widgets/large_raise_button.dart';
import 'package:chatting_with_nncthang/screens/account/widgets/logo_widget.dart';
import 'package:chatting_with_nncthang/screens/account/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _animationController;
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  _fieldFocusChange( FocusNode currentFocus, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  changeMode(bool enableDarkMode) {
    if (enableDarkMode) {
      _animationController.reverse(from: 0.5);
    } else {
      _animationController.forward(from: 0.5);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    _usernameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = themeProviderSelector(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: Dimens.DefaultPadding,
              right: Dimens.DefaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TittlePaddingTop,
                RotationTransition(
                  turns: _animationController,
                  child: LogoWidget(
                    onToggleCallBack: (v) async {
                      await themeProvider.toggleThemeData();
                      changeMode(themeProvider.enableDarkMode);
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: SizedBox(
                            height: 40,
                            child: Text(
                              "You are now change the App into\n"
                              "${themeProvider.enableDarkMode ? "Dark" : "Light"} Mode",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: FontSize.DefaultFontSize,
                                height: 1.4,
                                color: themeProvider.enableDarkMode
                                    ? Color(0xFF35303F)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextFormFieldWidget(
                  label: 'Username',
                  controller: _usernameController,
                  focusNode: _usernameFocus,
                  onSubmitted: (term) {
                    _fieldFocusChange(_usernameFocus, _passwordFocus);
                  },
                ),
                PaddingTop,
                TextFormFieldWidget(
                  label: "Password",
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordFocus,
                  isPassword: true,
                  onSubmitted: (value) {
                    _passwordFocus.unfocus();
                  },
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                    right: 10,
                    bottom: Dimens.DefaultPadding,
                    top: Dimens.DefaultPadding,
                  ),
                  child: Text(
                    Strings.ForgotPassword,
                    style: TextStyle(
                      decorationThickness: 1.0,
                      color: themeProvider.themeColor().textColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                LargeRaiseButtonWidget(
                  label: Strings.BtnSignIn,
                  labelColor: Colors.white,
                  backgroundColor: themeProvider.themeColor().primaryColor,
                  onTap: () {
                    print("tap");
                  },
                ),
                LargeRaiseButtonWidget(
                  label: Strings.BtnSignInGoogle,
                  prefixIcon: AppIcons.googleIcon,
                  backgroundColor: Colors.white,
                  onTap: () {
                    print("tap");
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaddingTop,
                    Text(
                      Strings.RegisterMessage,
                      style: TextStyle(
                        color: themeProvider.themeColor().textColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        storeSelector(context).dispatch(
                          NavigatePushAction(
                            route: Routes.registerRoute,
                          ),
                        );
                      },
                      child: Text(
                        Strings.Register,
                        style: TextStyle(
                          color: themeProvider.themeColor().primaryColor,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                PaddingTop,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
