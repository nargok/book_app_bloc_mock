import 'package:flutter/material.dart';

import 'bloc/book_bloc.dart';
import 'models/book.dart';
import 'resources/book_api_privider.dart';
import 'bloc/book_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText = 'AWS';

  @override
  void initState() {
    testApiAccess('AWS');
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Search App'),
      ),
      body: StreamBuilder(
        stream: bloc.allBooks,
        builder: (context, AsyncSnapshot<BookModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<BookModel> snapshot) {
    return ListView.builder(
      itemCount: (snapshot.hasData) ? snapshot.data.length : 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${snapshot.data.title}'),
        );
      },
    );
  }

  void testApiAccess(String title) async {
    BookApiProvider api = BookApiProvider();
    BookModel result = await api.fetchBooks(title);
    print(result.items);
  }
}
