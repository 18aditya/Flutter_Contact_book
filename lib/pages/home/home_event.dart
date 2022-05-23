part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitHomePage extends HomeEvent {
  InitHomePage();
}

class FetchAllContact extends HomeEvent {
  FetchAllContact();
}

class FetchRecentContact extends HomeEvent {
  FetchRecentContact();
}
