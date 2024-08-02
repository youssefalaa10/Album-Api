import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/remote/dio_helper.dart';

import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumService albumService;

  AlbumBloc(this.albumService) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await albumService.fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}
