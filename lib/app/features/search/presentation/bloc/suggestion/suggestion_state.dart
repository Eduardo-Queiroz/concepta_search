import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:equatable/equatable.dart';

class SearchSuggestionState {
  SearchSuggestionState({
    this.query = '',
    this.suggestions = const [],
  });

  String query;
  List<String> suggestions;

  String get title {
    if (query.isEmpty && suggestions.isEmpty) {
      return 'No Recent Searchs';
    } else if (query.isEmpty && suggestions.isNotEmpty) {
      return 'Recent Searchs';
    } else if (query.isNotEmpty && suggestions.isEmpty) {
      return 'No Found Packages';
    }
    return '';
  }

  bool get hasTitle => query.isEmpty || suggestions.isEmpty;

  mergeWith(SearchSuggestionState state) {
    query = query.isEmpty ? state.query : query;
    suggestions = suggestions.isEmpty ? state.suggestions : suggestions;
    return this;
  }
}

class SearchSuggestionInitial extends SearchSuggestionState
    with EquatableMixin {
  @override
  List<Object?> get props => <Object?>[];
}

class SearchSuggestionAutocomplete extends SearchSuggestionState
    with EquatableMixin {
  SearchSuggestionAutocomplete({super.query});

  @override
  List<Object?> get props => <Object?>[super.query];
}

class SearchSuggestionLoading extends SearchSuggestionState
    with EquatableMixin {
  @override
  List<Object?> get props => <Object?>[];
}

class SearchSuggestionError extends SearchSuggestionState with EquatableMixin {
  SearchSuggestionError(this.error);

  final String error;
  @override
  List<Object?> get props => <Object?>[];
}

class SearchSuggestionSuccess extends SearchSuggestionState
    with EquatableMixin {
  SearchSuggestionSuccess({super.suggestions});

  @override
  List<Object?> get props => <Object?>[super.query];
}

class SearchSuggestionClear extends SearchSuggestionState with EquatableMixin {
  SearchSuggestionClear();

  @override
  List<Object?> get props => <Object?>[super.query];
}
