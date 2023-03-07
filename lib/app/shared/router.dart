import 'package:concepta/app/features/details/presentation/screens/details_screen.dart';
import 'package:concepta/app/features/search/presentation/bloc/suggestion/suggestion_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:concepta/infra/router/transition_type.dart';

import '../../infra/router/route_bundle.dart';
import '../features/details/infra/routes/details.dart';
import '../features/details/presentation/bloc/details/details_cubit.dart';
import '../features/search/infra/routes/search.dart';
import '../features/search/presentation/bloc/animation/animation_cubit.dart';
import '../features/search/presentation/screens/search_screen.dart';

class Routes {
  static Map<String, RouteBundle> routeMap = <String, RouteBundle>{
    SearchRoute.path: RouteBundle<SearchRoute, SearchScreen>(
      providers: [
        ({pageState}) => BlocProvider<SearchAnimationCubit>.value(
              value: GetIt.instance<SearchAnimationCubit>(),
            ),
        ({pageState}) => BlocProvider<SearchSuggestionCubit>.value(
              value: GetIt.instance<SearchSuggestionCubit>(),
            ),
      ],
      transitionType: CorePageTransitionType.fade,
    ),
    DetailsRoute.path: RouteBundle<DetailsRoute, DetailsScreen>(
      providers: [
        ({pageState}) => BlocProvider<DetailsCubit>.value(
              value: GetIt.instance<DetailsCubit>(
                param1: pageState,
              ),
            ),
      ],
      transitionType: CorePageTransitionType.wave,
    ),
  };
}
