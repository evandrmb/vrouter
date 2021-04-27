part of '../main.dart';

class VWidgetBase extends VRouteElementBuilder {
  /// A list of routes which:
  ///   - path NOT starting with '/' will be relative to [path]
  ///   - widget or page will be stacked on top of [widget]
  final List<VRouteElement> stackedRoutes;

  /// The widget which will be displayed for this [VRouteElement]
  final Widget widget;

  /// A LocalKey that will be given to the page which contains the given [widget]
  ///
  /// This key mostly controls the page animation. If a page remains the same but the key is changes,
  /// the page gets animated
  /// The key is by default the value of the current [path] (or [aliases]) with
  /// the path parameters replaced
  ///
  /// Do provide a constant [key] if you don't want this page to animate even if [path] or
  /// [aliases] path parameters change
  final LocalKey? key;

  /// A name for the route which will allow you to easily navigate to it
  /// using [VRouter.of(context).pushNamed]
  ///
  /// Note that [name] should be unique w.r.t every [VRouteElement]
  final String? name;

  /// The duration of [VWidgetBase.buildTransition]
  final Duration? transitionDuration;

  /// The reverse duration of [VWidgetBase.buildTransition]
  final Duration? reverseTransitionDuration;

  /// Create a custom transition effect when coming to and
  /// going to this route
  /// This has the priority over [VRouter.buildTransition]
  ///
  /// Also see:
  ///   * [VRouter.buildTransition] for default transitions for all routes
  final Widget Function(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child)? buildTransition;

  VWidgetBase({
    required this.widget,
    this.stackedRoutes = const [],
    this.key,
    this.name,
    this.transitionDuration,
    this.reverseTransitionDuration,
    this.buildTransition,
  });

  @override
  List<VRouteElement> buildRoutes() => [
        VPageBase(
          pageBuilder: (key, child, name) => VBasePage.fromPlatform(
            key: key,
            child: child,
            name: name,
            buildTransition: buildTransition,
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
          ),
          widget: widget,
          key: key,
          name: name,
          stackedRoutes: stackedRoutes,
        ),
      ];
}