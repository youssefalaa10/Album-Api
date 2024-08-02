import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/view/Home/home_screen.dart';
import 'modules/view/cubit/album_cubit.dart';
import 'modules/view/cubit/album_event.dart';
import 'network/remote/dio_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AlbumBloc(AlbumService())..add(FetchAlbums()),
        child: const AlbumPage(),
      ),
    );
  }
}
