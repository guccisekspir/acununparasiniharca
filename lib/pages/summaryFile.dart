import 'package:acununparasiniharca/util/products.dart';
import 'package:flutter/material.dart';



class SummaryPage extends StatefulWidget {
  final List<Products> fullList;

  const SummaryPage({Key key, this.fullList}) : super(key: key);
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  List<Products> purchasedList=[];

  @override
  void initState() {

    for(var i in widget.fullList){
      if(i.piece>0)purchasedList.add(i);
    }




    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.limeAccent, Colors.cyanAccent]),
                        color: Colors.limeAccent,
                        shape: BoxShape.circle),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/acunpp.jpg"),
                    radius: 70,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Container(
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount:
                  purchasedList.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return badgeMaker(purchasedList);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget badgeMaker(List<Products> purchasedList) {
    return FittedBox(

    );
  }
}
