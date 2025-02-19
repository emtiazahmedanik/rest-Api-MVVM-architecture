import 'package:flutter/material.dart';
import 'package:rest_api_practice/model/user_model.dart';

class UserProfilePage extends StatelessWidget {
  final List<User>? users;
  final int index;
  const UserProfilePage({super.key,required this.index,required this.users});
  

  @override
  Widget build(BuildContext context) {
    final user = users![index];
    return Scaffold(
      body: SafeArea(
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                //alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  AspectRatio(
                      aspectRatio: 16/9,
                    child: Image.network(user.picture.large,fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: -30,
                    left: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.network(user.picture.medium,fit: BoxFit.cover,)),

                          )),

                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.edit,size: 20,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("${user.name.title} ${user.name.firstName} ${user.name.lastName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 5.0),
                    child: Text("${user.nat}",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,),),
                  ),
                  Icon(Icons.contact_support_outlined,size:12 ,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: InkWell(
                      onTap: (){
                        showModalBottomSheet(context: context, builder: (context){
                          return Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  SizedBox(height: 20,),
                                  Text.rich(
                                    TextSpan(
                                      text: "Email: ",
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                      children: [
                                        TextSpan(
                                          text: "${user.email}",
                                          style: TextStyle(fontWeight: FontWeight.w400)
                                        )
                                      ]
                                    )
                                  ),
                                  Text.rich(
                                      TextSpan(
                                          text: "Phone: ",
                                          style: TextStyle(fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                                text: "${user.phone}",
                                                style: TextStyle(fontWeight: FontWeight.w400)
                                            )
                                          ]
                                      )
                                  ),
                                  Text.rich(
                                      TextSpan(
                                          text: "Address: ",
                                          style: TextStyle(fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                                text: "${user.address.country} - ${user.address.city} - ${user.address.state} - ${user.address.postcode}",
                                                style: TextStyle(fontWeight: FontWeight.w400)
                                            )
                                          ]
                                      )
                                  ),
                                  Text.rich(
                                      TextSpan(
                                          text: "Street: ",
                                          style: TextStyle(fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                                text: "${user.address.streetModel.name} - ${user.address.streetModel.number}",
                                                style: TextStyle(fontWeight: FontWeight.w400)
                                            )
                                          ]
                                      )
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                        child: Text("Contact Info",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500,),)),
                  ),
                ],
              )

            ],
          )
      ),
    );
  }
}
