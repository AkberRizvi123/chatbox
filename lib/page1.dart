import 'package:chatbox/userlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/users.dart';

class Frontscreen extends StatefulWidget {
  const Frontscreen({Key? key}) : super(key: key);

  @override
  State<Frontscreen> createState() => _FrontscreenState();
}

class _FrontscreenState extends State<Frontscreen> {
  List<Users> users = [
    Users(
        name: "Max",
        messageText: "Awesome Setup",
        imageURL: "images/user1.jpg",
        time: "Now"),
    Users(
        name: "Samuel",
        messageText: "That's Great",
        imageURL: "images/user2.png",
        time: "Yesterday"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            "Chats"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),

                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                )),
            ListView.builder(
              itemCount: users.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (context, index) {
                return UserList(
                    name: users[index].name,
                    messageText: users[index].messageText,
                    imageUrl: users[index].imageURL,
                    time: users[index].time,
                    isMessageRead: (index == 0) ? true : false);

              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
