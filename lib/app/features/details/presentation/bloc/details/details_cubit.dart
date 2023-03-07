import 'dart:async';

import 'package:concepta/app/features/details/domain/repositories/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infra/routes/details.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required this.detailRepository,
    required DetailsRoute route,
    DetailsState? initialState,
  }) : super(
          initialState ?? DetailsInitial(name: route.name),
        ) {
    getSuggestion();
  }

  final DetailRepository detailRepository;

  Future<void> getSuggestion() async {
    (await detailRepository.getInfoByName(name: state.name!)).fold(
      (error) => emit(
        DetailsError(error.toString()).mergeWith(state),
      ),
      (data) => emit(
        DetailsSuccess(info: data).mergeWith(state),
      ),
    );
  }
}
