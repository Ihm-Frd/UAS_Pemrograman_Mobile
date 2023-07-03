// import 'dart:js_util';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:project_uas_tampilkan_api/model.dart';
import 'package:project_uas_tampilkan_api/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M.Ilham Firdaus_312010313',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Menampilkan API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Blog> listBlog = [];
  Repository repository = Repository();

  Future<void> getData() async {
    listBlog = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final blog = listBlog[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Al-Fatihah     : ${blog.ar}'),
              Text('Terjemah      : ${blog.id}'),
              Text('\nAyat               : ${blog.nomor}'),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: listBlog.length,
      ),
    );
  }
}
