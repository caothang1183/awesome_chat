import 'package:chatting_with_nncthang/redux/middlewares/log_middleware.dart';
import 'package:chatting_with_nncthang/redux/middlewares/navigation_middleware.dart';
import 'package:chatting_with_nncthang/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appMiddleware() {
  return [
    //log middleware
    ...logMiddleware(),
    // navigation middleware
    ...navigationMiddleware(),
  ];
}
