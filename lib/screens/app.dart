import 'package:chatting_with_nncthang/common/constants/routes.dart';
import 'package:chatting_with_nncthang/common/constants/strings.dart';
import 'package:chatting_with_nncthang/common/themes/theme_changer.dart';
import 'package:chatting_with_nncthang/redux/middlewares/app_middleware.dart';
import 'package:chatting_with_nncthang/redux/reducers/app_reducer.dart';
import 'package:chatting_with_nncthang/redux/states/app_state.dart';
import 'package:chatting_with_nncthang/screens/account/forget_password_screen.dart';
import 'package:chatting_with_nncthang/screens/account/login_screen.dart';
import 'package:chatting_with_nncthang/screens/account/register_screen.dart';
import 'package:chatting_with_nncthang/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  final ThemeProvider themeProvider;

  const App({
    Key key,
    @required this.themeProvider,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: appMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    widget.themeProvider.getCurrentState();
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: Strings.AppName,
        theme: widget.themeProvider.getThemeData(),
        initialRoute: Routes.loginRoute,
        onGenerateRoute: (RouteSettings settings) => _generateRoute(settings),
      ),
    );
  }
}

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case Routes.registerRoute:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case Routes.forgotPasswordRoute:
      return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
