import 'package:equatable/equatable.dart'; 

import '/index.dart';

part 'learn_event.dart';
part 'learn_state.dart';

class LearnBloc extends Bloc<LearnEvent, LearnState> {
  LearnBloc() : super(const InitialStates()) { 
    on<Increment>((event, emit) => _increment(emit));
    on<Decrement>((event, emit) => _decrementt(emit));
  }
  void _increment(Emitter<LearnState> emit) =>
      emit(LearnState(count: state.count + 1));
      
  void _decrementt(Emitter<LearnState> emit) {
    if (state.count > 0) {
      emit(LearnState(count: state.count - 1));
    }
  }
}
