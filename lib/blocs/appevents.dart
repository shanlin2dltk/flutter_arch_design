import 'package:equatable/equatable.dart';

abstract class AppGenericEvent extends Equatable {
  const AppGenericEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppGenericEvent {}

class SongReloadEvent extends AppGenericEvent {}
class LoadNewsEvent extends AppGenericEvent {}