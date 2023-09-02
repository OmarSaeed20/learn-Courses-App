part of 'learn_bloc.dart';

class LearnState extends Equatable {
  final int count;

  const LearnState({required this.count});

  @override
  List<Object?> get props => [count];
}

class InitialStates extends LearnState {
  const InitialStates() : super(count: 0);

  @override
  List<Object> get props => [count];
}

/* final class LearnLoadingState extends LearnState {
  const LearnLoadingState() : super(count: 0);
}

final class LearnSuccessState extends LearnState {
  const LearnSuccessState({required super.count}) ;
}

final class LearnFealirState extends LearnState {
  const LearnFealirState() : super(count: 0);
}
 */