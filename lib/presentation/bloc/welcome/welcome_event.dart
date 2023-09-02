part of 'welcome_bloc.dart';

sealed class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class OnChangePage extends WelcomeEvent {
  final int index;

  const OnChangePage(this.index);

  @override
  List<Object> get props => [index];
}

class NextPage extends WelcomeEvent {
  final int index;
  final PageController pageController;
  const NextPage(this.pageController, this.index);
  @override
  List<Object> get props => [pageController, index];
}

class PrviusePage extends WelcomeEvent {
  final int index;
  final PageController pageController;
  const PrviusePage(this.pageController, this.index);
  @override
  List<Object> get props => [pageController, index];
}

class GetStartedPressed extends WelcomeEvent {
  final BuildContext context;

  const GetStartedPressed(this.context);
}
