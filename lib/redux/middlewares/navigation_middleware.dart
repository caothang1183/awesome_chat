import 'package:chatting_with_nncthang/redux/actions/navigation_action.dart';
import 'package:chatting_with_nncthang/redux/states/app_state.dart';
import 'package:chatting_with_nncthang/screens/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> navigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
    TypedMiddleware<AppState, NavigateReplaceAndRemoveUntilAction>(
        _navigateReplaceAndRemoveUntil),
  ];
}

_navigateReplaceAndRemoveUntil(
    Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAndRemoveUntilAction).route;
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  next(action);
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).route;
    navigatorKey.currentState.pushReplacementNamed(routeName);
  next(action);
}

_navigate(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).route;
  navigatorKey.currentState.pushNamed(routeName);
  next(action);
}
