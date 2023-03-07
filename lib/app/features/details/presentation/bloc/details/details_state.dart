import 'package:concepta/app/features/details/domain/entities/detail.dart';
import 'package:equatable/equatable.dart';

class DetailsState {
  DetailsState({
    this.name,
    this.info,
  });

  String? name;
  DetailEntity? info;

  mergeWith(DetailsState state) {
    name = name ?? state.name;
    info = info ?? state.info;
    return this;
  }
}

class DetailsInitial extends DetailsState with EquatableMixin {
  DetailsInitial({
    required super.name,
  });

  @override
  List<Object?> get props => <Object?>[];
}

class DetailsLoading extends DetailsState with EquatableMixin {
  @override
  List<Object?> get props => <Object?>[];
}

class DetailsError extends DetailsState with EquatableMixin {
  DetailsError(this.error);

  final String error;
  @override
  List<Object?> get props => <Object?>[];
}

class DetailsSuccess extends DetailsState with EquatableMixin {
  DetailsSuccess({required super.info});

  @override
  List<Object?> get props => <Object?>[super.name];
}
