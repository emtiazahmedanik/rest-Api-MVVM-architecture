import 'package:flutter/material.dart';
import 'package:rest_api_practice/viewmodel/user_viewmodel.dart';

import '../model/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserViewModel userViewModel = UserViewModel();
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  void fetchUsers() async{
    final response =await userViewModel.callApi();
    setState(() {
      users = response;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:users.isEmpty?Center(child: CircularProgressIndicator()): ListView.builder(
            itemCount: users.length,
              itemBuilder: (context,index){
              final user = users[index];
              final gender = user.gender;
              final email = user.email;
              final phone = user.phone;
              final nat = user.nat;
              return Column(
                children: [
                  ListTile(
                    title: Text(email),
                    subtitle: Column(
                      children: [
                        Text(gender),
                        Text(phone),
                        Text(nat)
                      ],
                    ),
                    leading: CircleAvatar(
                      child: Text("$index"),
                    ),
                  ),
                  Divider()
                ],
              );
              }

          )
      ),
    );
  }
}
