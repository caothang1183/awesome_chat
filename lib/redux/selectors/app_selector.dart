import 'package:chatting_with_nncthang/redux/states/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Store<AppState> storeSelector(context) => StoreProvider.of<AppState>(context);

AppState appStateSelector(context) => storeSelector(context).state;
