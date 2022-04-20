import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body:Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,

                  children:  [
                    const CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage(
                        'https://variety.com/wp-content/uploads/2020/12/Adam_Driver.png?w=760',
                      ),
                    ),
                    const CircleAvatar(

                      radius: 23.0,
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 1.0,
                        end: 1.0,
                      ),
                      child: IconButton(
                        iconSize: 30,
                        color: Colors.blue,
                        icon: const Icon(

                          Icons.camera_alt_outlined,
                        ), onPressed: (){},

                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(

                          labelText:'Username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          labelText:'Phone',
                          border: InputBorder.none,
                          prefix: Icon(
                            Icons.phone_android,
                          ),
                        ),


                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                          labelText:'Bio',
                          border: InputBorder.none,
                        ),


                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
