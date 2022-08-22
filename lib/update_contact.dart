import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app_theme.dart';
import 'colors.dart';
import 'home_page.dart';

class Update_page extends StatefulWidget {
  const Update_page({Key? key}) : super(key: key);

  @override
  State<Update_page> createState() => _Update_pageState();
}

class _Update_pageState extends State<Update_page> {
  final _picker = ImagePicker();
  File? image;
  File? image2;

  GlobalKey<FormState> update_contact_key = GlobalKey<FormState>();

  TextStyle labelStyle = const TextStyle(color: Colors.black, fontSize: 18);
  TextStyle hintStyle = const TextStyle(color: Colors.grey, fontSize: 18);

  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController phone_num_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,
                  color: (AppTheme.isDark) ? Colors.black : Colors.white)),
          title: Text(
            "Edit Contact",
            style: TextStyle(
                color: (AppTheme.isDark) ? Colors.black : Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (update_contact_key.currentState!.validate()) {
                    update_contact_key.currentState!.save();
                    Contact c1 = Contact(
                        first_name: firstName,
                        last_name: lastName,
                        email: email,
                        phone_num: phoneNumber,
                        image: image);
                    int i = Global.allContacts.indexOf(res);
                    Global.allContacts[i] = c1;
                    Navigator.of(context).pop();
                    first_name_controller.clear();
                    last_name_controller.clear();
                    phone_num_controller.clear();
                    email_controller.clear();

                    setState(() {
                      firstName = "";
                      lastName = "";
                      phoneNumber = "";
                      email = "";
                      image = null;
                    });
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
                icon: Icon(Icons.check,
                    color: (AppTheme.isDark) ? Colors.black : Colors.white)),
          ],
        ),
        body: Column(
          children: [
            /* SizedBox(
              height: 40,
            ),*/
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Expanded(
                flex: 2,
                child: Stack(children: [
                  Positioned(
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 70,
                        /*     backgroundImage:
                            (res.image != null) ? FileImage(res.image!) : null,*/
                        backgroundImage: (res.image != null)
                            ? FileImage(res.image as File)
                            : (image2 != null)
                            ? FileImage(image2 as File)
                            : null,
                        child: (res.image != null)
                            ? const Text("")
                            : (image2 != null)
                            ? const Text("")
                            : const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: 10,
                    child: FloatingActionButton(
                      elevation: 0,
                      mini: true,
                      onPressed: () async {
                        XFile? pickedImage =
                        await _picker.pickImage(source: ImageSource.camera);

                        setState(() {
                          image = File(pickedImage!.path);
                          image2 = File(pickedImage.path);
                          //   pickedImage = image2 as XFile;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Form(
                  key: update_contact_key,
                  child: Container(
                    // height: 100,
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //first name
                        Text(
                          "First name",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              firstName = val;
                            });
                          },
                          controller: first_name_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "${res.first_name}",
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        // last name

                        Text(
                          "Last name",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              lastName = val;
                            });
                          },
                          controller: last_name_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "${res.last_name}",
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        //phone number

                        Text(
                          "Phone number",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              phoneNumber = val;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          controller: phone_num_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "${res.phone_num}",
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        // Email

                        Text(
                          "Email",
                          style: labelStyle,
                        ),
                        TextFormField(
                          validator: (val) {
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          controller: email_controller,
                          decoration: InputDecoration(
                            hintStyle: hintStyle,
                            hintText: "${res.email}",
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
