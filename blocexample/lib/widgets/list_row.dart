import 'package:blocexample/model/albums_list.dart';
import 'package:blocexample/widgets/txt.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;
  ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.title),
          Divider(),
        ],
      ),
    );
  }
}
