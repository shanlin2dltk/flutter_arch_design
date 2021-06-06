import 'package:bloc/bloc.dart';
import 'package:platform_design/apis/songdataprovider.dart';
import 'package:platform_design/blocs/appevents.dart';
import 'package:platform_design/models/song.dart';

import 'appstates.dart';

class SongBloc extends Bloc<AppGenericEvent, SongState> {
  final SongDataProvider songDataProvider = SongDataProvider();

  SongBloc() : super(SongState()); 

  //@override
  //SongState get initialState => SongState();

  @override
  Stream<SongState> mapEventToState(
    AppGenericEvent event,
  ) async* {
    if (event is AppStarted || event is SongReloadEvent) {
      try {
        final List<Song> songList = await songDataProvider.getSongsData();
        yield SuccessfulSongState(songList);
      } catch (e) {
        yield FailureSongState(e.toString());
      }
    }
  }
}