import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_theme.dart';
import 'home_page.dart';
import 'package:share_plus/share_plus.dart';


class Detail_page extends StatefulWidget {
  const Detail_page({Key? key}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // theme: ThemeData.light(),
      darkTheme: AppTheme.darkTheme,
      // darkTheme: ThemeData.dark(),
      themeMode: (AppTheme.isDark) ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "contacts",
            style: TextStyle(
                color: (AppTheme.isDark) ? Colors.black : Colors.white),
          ),
          actions: [
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(flex: 5),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: (res.image != null)
                        ? FileImage(res.image as File)
                        : null,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: () {
                      // Global.allContacts.remove(res);
                      Global.allContacts.remove(res);

                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/update', arguments: res);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${res.first_name} ${res.last_name}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "+91 ${res.phone_num}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.green,
                    mini: true,
                    onPressed: () async {
                      Uri url = Uri.parse("tel:+91${res.phone_num}");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Can't be Lunched..."),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Icon(Icons.call),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.amber,
                    mini: true,
                    onPressed: () async {
                      Uri url = Uri.parse("sms:+91${res.phone_num}");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("can't ba Launched..."),
                          backgroundColor: Colors.redAccent,
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                    child: const Icon(Icons.message),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.lightBlue,
                    mini: true,
                    onPressed: () async {
                      Uri url = Uri.parse(
                          "mailto:${res.email}?subject=Demo&body=Hello");

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("can't be Launched..."),
                          backgroundColor: Colors.redAccent,
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                    child: const Icon(Icons.email),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.deepOrangeAccent,
                    mini: true,
                    onPressed: () async {
                      await Share.share("+91 ${res.phone_num}");
                    },
                    child: const Icon(Icons.share),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.black.withOpacity(0.7),
                indent: 20,
                endIndent: 20,
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
