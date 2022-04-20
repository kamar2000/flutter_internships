
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget
{
  List<UserModel> users=[
    UserModel(
      id: 1,
      name: 'Ahmed Mohamed',
      phone: '+201010952433',
    ),
    UserModel(id: 2,
      name: 'Abdelrahman Kamar',
      phone:'+201552061165',
    ),
    UserModel(
      id: 3,
      name: 'Alaa Mohamed',
      phone: '+201117832455',
    ),
    UserModel(
      id: 4,
      name: 'Tamer Omar',
      phone: '+20121552663',
    ),
    UserModel(id: 5,
      name: 'Zaha',
      phone:'+2012771236',
    ),
    UserModel(
      id: 6,
      name: 'Salah',
      phone: '+201278332455',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Mohamed',
      phone: '+201010952433',
    ),
    UserModel(id: 2,
      name: 'Abdelrahman Kamar',
      phone:'+201552061165',
    ),
    UserModel(
      id: 3,
      name: 'Alaa Mohamed',
      phone: '+201117832455',
    ),
    UserModel(
      id: 4,
      name: 'Tamer Omar',
      phone: '+20121552663',
    ),
    UserModel(id: 5,
      name: 'Zaha',
      phone:'+2012771236',
    ),
    UserModel(
      id: 6,
      name: 'Salah',
      phone: '+201278332455',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:ListView.separated(itemBuilder:(context,index)=>buildUsersItem(users[index]),
          separatorBuilder:(context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width:double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount:users.length,
      ),
    );
  }
  Widget buildUsersItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight:FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight:FontWeight.bold,
                ),
              ),
              Text(
                '${user.phone}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
