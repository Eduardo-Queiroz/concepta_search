import 'dart:async';

import 'package:concepta/app/features/search/domain/repositories/search_repository.dart';
import 'package:concepta/infra/util/animation_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'suggestion_state.dart';

const minTermLength = 2;

class SearchSuggestionCubit extends Cubit<SearchSuggestionState> {
  SearchSuggestionCubit({
    required this.searchRepository,
    SearchSuggestionState? initialState,
  }) : super(initialState ?? SearchSuggestionInitial());

  final SearchRepository searchRepository;
  Timer? _debounce;

  Future<void> getSuggestion({
    String query = '',
  }) async {
    emit(SearchSuggestionAutocomplete(query: query).mergeWith(state));
    emit(SearchSuggestionLoading().mergeWith(state));
    (await searchRepository.getSuggestionsByTerms(terms: state.query)).fold(
      (error) => emit(
        SearchSuggestionError(error.toString()).mergeWith(state),
      ),
      (data) => emit(
        SearchSuggestionSuccess(suggestions: data.suggestions).mergeWith(state),
      ),
    );
  }

  void inputValue(String inputValue) {
    if (inputValue.length == minTermLength) {
      getSuggestion(query: inputValue);
    } else if (inputValue.length > minTermLength) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        getSuggestion(query: inputValue);
      });
    }
  }

  void selectSuggestion({required String name}) =>
      searchRepository.selectSuggestion(name: name);

  void inputClear() {
    Future.delayed(CoreDelay().long, () {
      emit(SearchSuggestionClear());
    });
  }
}
