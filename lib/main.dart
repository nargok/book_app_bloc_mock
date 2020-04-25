import 'package:flutter/material.dart';

import 'bloc/book_bloc.dart';
import 'models/book.dart';
import 'resources/book_api_privider.dart';
import 'ui/book_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
//    testApiAccess('AWS');
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
      body: Column(
        children: <Widget>[
          Container(
            width: 230,
            constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
            child: TextField(
              controller: _controller,
              onChanged: (text) {
                print('$text');
                bloc.fetchAllBooks(text);
              },
            ),
          ),
          StreamBuilder(
            stream: bloc.allBooks,
            builder: (context, AsyncSnapshot<BookModel> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(
                  child: Text(
                '本の情報を入力してください',
                style: TextStyle(color: Colors.black38),
              ));
            },
          ),
        ],
      ),
    );
  }

  void testApiAccess(String title) async {
    BookApiProvider api = BookApiProvider();
    BookModel result = await api.fetchBooks(title);
    print(result.items);
  }
}
