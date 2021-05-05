import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState()=> _MyAppState();
}



  class _MyAppState extends State<MyApp>{
var fetchData;//={};
_fetchData()async{
         CollectionReference collectionreference = FirebaseFirestore.instance.collection('data');
         collectionreference.snapshots().listen((snapshot){
        setState(() {
          fetchData=snapshot.docs[0].data ;
          print("Fetch Data is:"+ fetchData.toString());
          _toast("Fetch Data is "+ fetchData.toString());
        });
         });


}

_addData()async{
  var data={
    'email': 'Thirumalai01@gmail.com',
    'password': '123456'
  };
   CollectionReference collectionreference = FirebaseFirestore.instance.collection('data');
   collectionreference.add(data);
   print("Add data successful");
   _toast("Add data successful!");

}
_updateData()async{
  var updateData={
    'email': 'ravichandran21@gmail.com',
    'password':'3323443'
  };
  CollectionReference collectionreference=FirebaseFirestore.instance.collection('data');
  QuerySnapshot querysnapshot=await collectionreference.get();
  querysnapshot.docs[0].reference.update(updateData);
  print('Update successful');
  _toast("Update data succesful");
}
_deleteData()async{
  CollectionReference collectionreference=FirebaseFirestore.instance.collection('data');
  QuerySnapshot querysnapshot=await collectionreference.get();
  querysnapshot.docs[0].reference.delete();
  print('Delete successfuly');
  _toast("delete data succesful");
}
_toast(String msg){
  return Fluttertoast.showToast(
    msg:msg,
    toastLength:Toast.LENGTH_SHORT,
    gravity:ToastGravity.BOTTOM,
    timeInSecForIosWeb:1,
    backgroundColor:Colors.indigo,
    textColor:Colors.white,
    fontSize:16.0);
  
}

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(title:Text("Firebase Example"),),
        body: Center(child:Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          crossAxisAlignment:CrossAxisAlignment.center,

          children:<Widget> [
          MaterialButton(
            color: Colors.green[400],
            child: Text("Add Data"),
            onPressed: _addData,
            ),
          MaterialButton(
            color: Colors.blue[600],
            child: Text("Fetch Data"),
            onPressed: _fetchData,
            ),
          MaterialButton(
            color: Colors.purple[600],
            child: Text("Update Data"),
            onPressed: _updateData,
            ),
          MaterialButton(
            color: Colors.red[400],
            child: Text("Delete Data"),
            onPressed: _deleteData,
            ),

          Text(fetchData.toString()),


        ],),)
        
        )
      
      
      );
   
}
}