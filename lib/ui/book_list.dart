import 'package:flutter/material.dart';
import '../models/book.dart';

Widget buildList(AsyncSnapshot<BookModel> snapshot) {
  return Expanded( // Widgetの中を固定の比率で表示する
    child: ListView.builder(
      itemCount: (snapshot.hasData) ? snapshot.data.items.length : 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${snapshot.data.items[index].title}'),
        );
      },
    ),
  );
}
