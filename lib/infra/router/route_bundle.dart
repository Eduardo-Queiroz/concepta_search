// ignore_for_file: always_specify_types, cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'route_provider.dart';
import 'transition_type.dart';

enum CoreRouteTransition {
  faded,
  normal,
  none,
}

class RouteBundle<ParametersType extends CoreRoute, ScreenType extends Widget> {
  RouteBundle({
    required this.transitionType,
    this.isPrivate,
    this.providers = const [],
  });

  final List<SingleChildWidget Function({ParametersType? pageState})> providers;

  final getIt = GetIt.instance;
  final bool? isPrivate;
  final CorePageTransitionType transitionType;

  // ignore: avoid_annotating_with_dynamic
  bool validateArgs(dynamic args) => args is! ParametersType;

  ParametersType? deeplinkGenerator(Map<String, String>? parameters) =>
      getIt.get<ParametersType>(param1: parameters);

  PageRouteBuilder<ParametersType> createRoute([RouteSettings? settings]) {
    final transition = CorePageTransition<ParametersType>(type: transitionType);
    final List<SingleChildWidget> blocProviders = providers
        .map((bloc) => bloc(pageState: settings?.arguments as ParametersType?))
        .toList();
    if (settings?.arguments != null) {
      final screen = GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: getIt<ScreenType>(
          param1: settings!.arguments as ParametersType,
        ),
      );
      return transition.provider(
        Scaffold(
          body: MultiProvider(
            providers: [
              ...blocProviders,
              Provider(
                create: (_) => settings.arguments as ParametersType,
              )
            ],
            child: screen,
          ),
        ),
        settings,
      );
    } else {
      final screen = GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: getIt<ScreenType>(),
      );
      if (providers.isNotEmpty) {
        return transition.provider(
          Scaffold(
            body: MultiProvider(
              providers: providers.map((bloc) => bloc()).toList(),
              child: screen,
            ),
          ),
          settings,
        );
      }
      return transition.provider(
        Scaffold(
          body: screen,
        ),
        settings,
      );
    }
  }
}
