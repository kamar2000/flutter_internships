import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage:NetworkImage(
                'https://i.pinimg.com/236x/f5/54/14/f55414f09fb552c428e42c576cd5dbe3--christian-rap-build-house.jpg',
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
              Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
          ),
            ),
            onPressed: (){},
          ),
          IconButton(
            icon:CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>buildStoryItem(),
                    separatorBuilder: (context,index)=>SizedBox(width: 15.0,),
                    itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 20.0,),
                  itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/236x/f5/54/14/f55414f09fb552c428e42c576cd5dbe3--christian-rap-build-house.jpg',
            ),
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 2.0,
              end: 2.0,
            ),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abdelrahman Ahmed',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello my firndodooo kabpo kabo',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration:BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Text(
                  '9:15 PM',
                ),
              ],
            ),



          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem() =>Container(
    width: 60.0,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/236x/f5/54/14/f55414f09fb552c428e42c576cd5dbe3--christian-rap-build-house.jpg',
              ),
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2.0,
                end: 2.0,
              ),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Abdelrahman Kamar',
          maxLines: 2,
          overflow:TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
