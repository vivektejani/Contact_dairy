import 'dart:io';
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // theme: ThemeData.light(),
      darkTheme: AppTheme.darkTheme,
      // darkTheme: ThemeData.dark(),
      themeMode: (AppTheme.isDark) ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "contacts",
            style: TextStyle(
                color: (AppTheme.isDark) ? Colors.black : Colors.white),
          ),
          actions: [
            /*Switch(
              value: AppTheme.isDark,
              onChanged: (val) {
                setState(() {
                  AppTheme.isDark = val;
                });
              },
            ),*/
            IconButton(
              onPressed: () {
                setState(() {
                  AppTheme.isDark = !AppTheme.isDark;
                });
              },
              icon: Icon(Icons.circle,
                  color: (AppTheme.isDark) ? Colors.black : Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: (AppTheme.isDark) ? Colors.black : Colors.white,
              ),
            )
          ],
        ),
        //  - - - if u wanted to some particuler widget colors change than do below wrap with theme widget//
        /*     floatingActionButton: Theme(
          data: ThemeData(
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.red)),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),*/
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed('/add');
          },
        ),
        body: Container(
            alignment: Alignment.center,
            child: (Global.allContacts.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_box_outlined,
                        size: 100,
                      ),
                      Text(
                        "You do not have any contacts yet.",
                        style: TextStyle(
                            fontSize: 20,
                            color: (AppTheme.isDark)
                                ? Colors.black
                                : Colors.white),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemBuilder: (Context, i) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed('/detail',
                              arguments: Global.allContacts[i]);
                        },
                        leading: CircleAvatar(
                          backgroundImage: (Global.allContacts[i].image != null)
                              ? FileImage(Global.allContacts[i].image as File)
                              : null,
                        ),
                        title: Text(
                            "${Global.allContacts[i].first_name} ${Global.allContacts[i].last_name}"),
                        subtitle:
                            Text("+91 ${Global.allContacts[i].phone_num}"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.phone_rounded,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                      );
                    },
                    itemCount: Global.allContacts.length,
                  )),
      ),
    );
  }
}

class Global {
  static List<Contact> allContacts = [];
}
