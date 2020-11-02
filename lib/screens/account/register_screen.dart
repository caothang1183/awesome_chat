import 'package:chatting_with_nncthang/common/constants/constants.dart';
import 'package:chatting_with_nncthang/common/constants/dimens.dart';
import 'package:chatting_with_nncthang/common/constants/routes.dart';
import 'package:chatting_with_nncthang/common/constants/strings.dart';
import 'package:chatting_with_nncthang/common/themes/theme_changer.dart';
import 'package:chatting_with_nncthang/common/widgets.dart';
import 'package:chatting_with_nncthang/redux/actions/navigation_action.dart';
import 'package:chatting_with_nncthang/redux/selectors/app_selector.dart';
import 'package:chatting_with_nncthang/screens/account/widgets/large_raise_button.dart';
import 'package:chatting_with_nncthang/screens/account/widgets/text_form_field.dart';
import 'package:chatting_with_nncthang/screens/account/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = themeProviderSelector(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                left: Dimens.DefaultPadding, right: Dimens.DefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TittlePaddingTop,
                TittleWidget(title: "Register"),
                SizedBox(height: 50),
                TextFormFieldWidget(
                  label: 'Username',
                  controller: _usernameController,
                  focusNode: _usernameFocus,
                  onSubmitted: (term) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                ),
                PaddingTop,
                TextFormFieldWidget(
                  label: "Password",
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  isPassword: true,
                  onSubmitted: (term) {
                    FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                  },
                ),
                PaddingTop,
                TextFormFieldWidget(
                  label: "Confirm Password",
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                  onSubmitted: (term) {
                    _passwordFocus.unfocus();
                  },
                ),
                LargePaddingTop,
                LargeRaiseButtonWidget(
                  label: Strings.BtnSignUp,
                  labelColor: Colors.white,
                  backgroundColor: themeProvider.themeColor().primaryColor,
                  onTap: () {
                    print("tap");
                  },
                ),
                LargeRaiseButtonWidget(
                  label: Strings.BtnBackToSignIn,
                  backgroundColor: Colors.white,
                  onTap: () {
                    storeSelector(context).dispatch(
                      NavigateReplaceAndRemoveUntilAction(
                        route: Routes.loginRoute,
                      ),
                    );
                  },
                ),
                PaddingTop,
                Text(
                  Strings.TermsPrivacyMessage,
                  style: TextStyle(
                    color: themeProvider.themeColor().textColor,
                  ),
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
