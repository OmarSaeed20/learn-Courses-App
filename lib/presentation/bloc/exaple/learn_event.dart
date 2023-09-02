part of 'learn_bloc.dart';
 
sealed class LearnEvent {}

class Increment extends LearnEvent {}

class Decrement extends LearnEvent {}
