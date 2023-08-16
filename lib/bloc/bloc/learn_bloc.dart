import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'learn_event.dart';
part 'learn_state.dart';

class LearnBloc extends Bloc<LearnEvent, LearnState> {
  LearnBloc() : super(InitialStates()) {
    on<Increment>((event, emit) {
      emit(LearnState(count: state.count + 1));
    });
    on<Decrement>((event, emit) {
      if (state.count > 0) {
        emit(LearnState(count: state.count - 1));
      }
    });
  }
}
