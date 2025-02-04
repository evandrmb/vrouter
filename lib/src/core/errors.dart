/// This exception is raised when a user tries to navigate to a path which is unspecified
class UnknownUrlVError extends Error {
  final String url;

  UnknownUrlVError({required this.url});

  @override
  String toString() => "The url '$url' has no matching route.\n"
      "Consider using VRoute(path: '.*', widget: UnknownPathWidget()) at the bottom of your VRouter routes to catch any wrong route.";

  @override
  StackTrace? get stackTrace => StackTrace.current;
}

/// This exception is raised when a user tries to navigate to a path which is unspecified
class InvalidPushVError extends Error {
  final String url;

  InvalidPushVError({required this.url});

  @override
  String toString() =>
      "The current url is null but you are trying to access the path \"$url\" which does not start with '/'.\n"
      "This is likely because you set a initialUrl which does not start with '/'.";

  @override
  StackTrace? get stackTrace => StackTrace.current;
}
