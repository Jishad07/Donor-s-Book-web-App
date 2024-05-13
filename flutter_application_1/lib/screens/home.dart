import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/donaters_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final CollectionReference donor=FirebaseFirestore.instance.collection('Donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
             child:StreamBuilder(
              stream: donor.snapshots(),
              builder:(context,AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot donorsdata=snapshot.data.docs[index];
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 80,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 30,
                                    child: Center(child: Text(donorsdata['bloodgroup'])),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                 Container(
                                 
                                  // color: Colors.amber,
                                 child: const Column(
                                  children: [
                                    Text("Donor's Details"),
                                    Divider(
                                      
                                      color: Colors.black,
                                    )
                                  ],
                                 ),
                                )
                           
                              
                              ],
                            ),
                            Column(
                              children: [
                                Text(donorsdata['name'],style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                Text(donorsdata['phone'].toString())
                              ],
                            ),
                             Row(
                              children: [
                                IconButton(onPressed: (){}, icon: const Icon(Icons.edit_note_outlined)),
                                  IconButton(onPressed: (){}, icon:const  Icon(Icons.delete,),color: Colors.red,)
                              ],
                              
                             ), 
                             
                          ],
                          
                        ),
                        
                      ),
                      
                    );
                  },);
                }
                return Container(
                  child: Text("mujeebaka"),
                );
              },)
             ),
             Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Donaters_page()));
                    }, 
                    child:const Text(
                      "Create Blood Donater",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white),)),
                ),
              ))
        ],
      ),
    );
  }
}