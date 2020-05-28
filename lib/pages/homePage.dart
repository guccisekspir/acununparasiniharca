import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController=ScrollController();
  ScrollController _sscrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CircleAvatar(child: Icon(Icons.event),radius: 70,),
            SizedBox(height: 30,),
            GridView.builder(
              controller: _sscrollController,
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2
            ), itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Text(index.toString()),),
              );
            },)
          ],

        ),
      ),
    );
  }
}
