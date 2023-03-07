import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart' show MultiProvider;
import 'package:provider/single_child_widget.dart';

import 'route_provider.dart';
import 'transition_type.dart';

typedef ScreenProviders
    = List<SingleChildWidget Function({CoreRoute? pageState})>;

class RouteBundle<ParametersType extends CoreRoute, ScreenType extends Widget> {
  RouteBundle({
    required this.transitionType,
    this.providers = const [],
  });

  final ScreenProviders providers;
  final getIt = GetIt.instance;
  final CorePageTransitionType transitionType;

  PageRouteBuilder<ParametersType> createRoute([RouteSettings? settings]) {
    final transition = CorePageTransition<ParametersType>(type: transitionType);
    final screenProviders = providers
        .map((provider) => provider(
              pageState: settings?.arguments as ParametersType?,
            ))
        .toList();

    return transition.provider(
      MultiProvider(
        providers: screenProviders,
        child: getIt<ScreenType>(param1: settings?.arguments),
      ),
      settings,
    );
  }
}
