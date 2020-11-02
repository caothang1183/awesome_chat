import 'package:chatting_with_nncthang/redux/actions/navigation_action.dart';
import 'package:redux/redux.dart';

final navigationReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, NavigateReplaceAction>(_navigateReplace),
  TypedReducer<List<String>, NavigatePushAction>(_navigatePush),
  TypedReducer<List<String>, NavigateReplaceAndRemoveUntilAction>(_navigateReplaceAndRemoveUntil),
]);

List<String> _navigateReplace(
        List<String> route, NavigateReplaceAction action) => [action.route];

List<String> _navigatePush(List<String> route, NavigatePushAction action) {
  var result = List<String>.from(route);
  result.add(action.route);
  return result;
}

List<String> _navigateReplaceAndRemoveUntil(List<String> route, NavigateReplaceAndRemoveUntilAction action) {
  var result = List<String>.from(route);
  if (result.isNotEmpty) {
    result.removeLast();
  }
  return result;
}
