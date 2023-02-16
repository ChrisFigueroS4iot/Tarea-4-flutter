import 'dart:convert';

import 'package:list_views_cript/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//Es importante usar un listview y dentro crear listTile
class _HomePageState extends State<HomePage> {
   var exchanges = jsonDecode(CRYPTO_EXCHANGES);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crypto APP")),
      drawer: Drawer(),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Divider() ;
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 34,
                        minHeight: 34,
                        maxWidth: 44,
                        maxHeight: 44,
                      ),
                      child: Image.network(exchanges[index]["image"], fit: BoxFit.cover),
                    ),
            title: Text("${exchanges[index]["name"]}"),
            subtitle: Text("${exchanges[index]["country"]} \n${exchanges[index]["year_established"]}"),
            
            trailing: Stack(alignment: Alignment.center,
            children: [
              Icon(Icons.circle,
              size: 50,
              color: Colors.black,),
              Text("${exchanges[index]["trust_score"]}", style: TextStyle(color: Colors.white),),
            ],)
 
          );
        },
      ),
 
 


     
    );
  }
}
