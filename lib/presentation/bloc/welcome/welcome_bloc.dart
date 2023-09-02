import 'package:equatable/equatable.dart';

import '/index.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) { 
    on<OnChangePage>((event, emit) => _onChanegdPage(emit, event));
    on<NextPage>((event, emit) => _nextPage(emit, event));
    on<PrviusePage>((event, emit) => _previusePage(emit, event));
    on<GetStartedPressed>((event, emit) => _getStartedPressed(emit, event));
  }

  void _onChanegdPage(Emitter<WelcomeState> emit, OnChangePage event) {
    emit(WelcomeState(currentPage: event.index));
    // debugPrint("currentPage ${state.currentPage}  &&  index ${event.index}");
  }

  void _nextPage(Emitter<WelcomeState> emit, NextPage event) {
    if (state.currentPage != 2) {
      event.pageController.animateToPage(
        state.currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      emit(WelcomeState(currentPage: state.currentPage + 1));
    }
  }

  void _previusePage(Emitter<WelcomeState> emit, PrviusePage event) {
    debugPrint("${state.currentPage}");
    if (state.currentPage > 0) {
      event.pageController.animateToPage(
        state.currentPage - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
      emit(WelcomeState(currentPage: state.currentPage - 1));
    }
  }

  void _getStartedPressed(Emitter<WelcomeState> emit, GetStartedPressed event) {
    debugPrint("${state.currentPage}");
    if (state.currentPage == 2) {
      i<NavigationService>().pushNamedAndRemoveUntil(Routes.signup);
      /* Navigator.of(event.context)
          .pushNamedAndRemoveUntil(Routes.signup, (route) => false); */
      /* Navigator.of(event.context).push(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      ); */
    }
  }
}
