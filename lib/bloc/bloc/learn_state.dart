part of 'learn_bloc.dart';

class LearnState {
  int count;

  LearnState({required this.count});
}

class InitialStates extends LearnState {
  InitialStates() : super(count: 0);
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