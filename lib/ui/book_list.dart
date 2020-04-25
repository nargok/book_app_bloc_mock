import 'package:flutter/material.dart';
import '../models/book.dart';

Widget buildList(AsyncSnapshot<BookModel> snapshot) {
  return ListView.builder(
    itemCount: (snapshot.hasData) ? snapshot.data.items.length : 0,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('${snapshot.data.items[index].title}'),
      );
    },
  );
}
