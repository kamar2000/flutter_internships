import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);


  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Theme.of(context).backgroundColor,
      width: double.infinity,
      height: 200.0,
      child: Padding(
        padding:  const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Container(

              margin:const EdgeInsets.only(bottom: 10.0),
              height: 70.0,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                image:DecorationImage(
                  image: NetworkImage('https://variety.com/wp-content/uploads/2020/12/Adam_Driver.png'),
                ),
              ),
            ),
            const Text('Abdulrahman Kamar',style:TextStyle(color: Colors.white,fontSize: 20,) ,),
            Text('mr.kamer2000@gmail.com',style:TextStyle(color: Colors.grey[200],fontSize: 14,) ,),


          ],
        ),
      ),
    );
  }
}
