import 'package:contact_dairy/update_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'add_contact.dart';
import 'detail_page.dart';
import 'home_page.dart';

void main() {
/*  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.amber,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light));*/
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(
    const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (Context) => const MyApp(),
        '/add': (Context) => const add_contact_page(),
        '/detail': (Context) => const Detail_page(),
        '/update': (Context) => const Update_page(),
      },
    );
  }
}
