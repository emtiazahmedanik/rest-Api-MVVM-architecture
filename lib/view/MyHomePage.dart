import 'package:flutter/material.dart';
import 'package:rest_api_practice/view/user_profile_page.dart';
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
              final name = "${user.name.title} ${user.name.firstName} ${user.name.lastName}";
              final pic = user.picture.medium;
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          UserProfilePage(index: index, users: users)));
                    },
                    child: ListTile(
                      title: Text(name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                      subtitle: Text(email),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(pic,fit: BoxFit.cover,),
                      ),
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
