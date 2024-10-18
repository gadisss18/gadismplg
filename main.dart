//masukan package yang dibutuhkan aplikasi
import 'package:english_words/english_words.dart';
//pake bahasa inggris
import 'package:flutter/material.dart';
//paket untuk material ui
import 'package:provider/provider.dart';
//paket untuk interaksi 

//fungsi main (fungsi utama)
void main() {
  runApp(MyApp());
}

//membuat abstrak aplikasi dari stateleswidget (templat aplikasi), aplikasi bernama MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});
//bawah aplikasi ini aakan tetap,  tidak baerubah setalah di - build



//mengganti nilai lama yang sudah ada di templat , dengan nilai nilai yg baru (replace / overwrite)
  @override
  Widget build(BuildContext context) {
    // fungsi nuild adalah fungsi yang membangun ui(mengatur posisi widget dan seterusmya)
    //changenotifierprovider mendergarkan/ mendeteksi semua interaksi yang terjadi di aplikasi+


    return ChangeNotifierProvider(
      create: (context) => MyAppState(),//membuat satu state yang bernama myappstate
      child: MaterialApp(//pada state ini, mengunakan style desain materialui
        title: 'Namer App',//diberi judul namer app
        theme: ThemeData(// data tema aplikasi, diberi warna deeporange
          useMaterial3: true,//versi materialui yang dipakai verssi 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//mendefinisikan isi myappstate
class MyAppState extends ChangeNotifier {
  //state myappstate diisi dengan 2 kata random yang digabungkan. kata rnadom tsb disimpan di variable wordpair
  var current = WordPair.random();
}

//memuat layout pada halaman        
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(//
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('Next'),
          ),

        ],
      ),
    );
  }
}