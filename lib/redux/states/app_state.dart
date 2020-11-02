import 'package:chatting_with_nncthang/redux/states/navigation_state.dart';

class AppState {
  final NavigationState navigationState;

  AppState({
    this.navigationState,
  });

  AppState copyWith({NavigationState navigationState}) {
    return AppState(
      navigationState: navigationState ?? this.navigationState,
    );
  }

  @override
  int get hashCode => navigationState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
        runtimeType == other.runtimeType &&
        navigationState == other.navigationState;

  @override
  String toString() {
    return 'AppState{\n'
      'navigationState: $navigationState,\n'
      '}';
  }
}
