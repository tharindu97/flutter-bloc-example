import 'package:blocexample/api/services.dart';
import 'package:blocexample/bloc/albums/bloc.dart';
import 'package:blocexample/views/albums_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
        child: AlbumsScreen(),
      ),
    );
  }
}
