import 'package:equatable/equatable.dart';
import 'package:platform_design/models/news.dart';
import 'package:platform_design/models/song.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class InitialAppState extends AppState{}
class NewsState extends AppState{}

class SuccessfulNewsState extends NewsState{
  final List<News> items;

  SuccessfulNewsState(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SuccessfulNewsState { items: ${items.length} }';
}

class FailureNewsState extends NewsState{
  final String error;
  FailureNewsState(this.error)
    : assert(error != null);

  @override
  List<Object> get props => [error];
}

class SongState extends AppState{}

class FailureSongState extends SongState {
  final String error;
  FailureSongState(this.error)
    : assert(error != null);

  @override
  List<Object> get props => [error];
}

class SuccessfulSongState extends SongState {
  final List<Song> items;
  SuccessfulSongState(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SuccessfulSongState { items: ${items.length} }';
}