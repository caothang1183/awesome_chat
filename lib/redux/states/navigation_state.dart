class NavigationState {
  final bool isLoading;
  final List<String> routes;

  NavigationState({
    this.isLoading,
    this.routes,
  });

  NavigationState copyWith({bool isLoading, List<String> routes}) {
    return NavigationState(
      isLoading: isLoading ?? this.isLoading,
      routes: routes ?? this.routes,
    );
  }

  @override
  int get hashCode => isLoading.hashCode ^ routes.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is NavigationState &&
        runtimeType == other.runtimeType &&
        isLoading == other.isLoading &&
        routes == other.routes;

  @override
  String toString() {
    return 'NavigationState{'
      '\nroutes: $routes,'
      '\isLoading: $isLoading,'
      '\n}';
  }
}
