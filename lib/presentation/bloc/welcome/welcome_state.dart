part of 'welcome_bloc.dart';

class WelcomeState extends Equatable {
  final int currentPage;

  const WelcomeState({this.currentPage = 0});

  @override
  List<Object> get props => [currentPage];
}
