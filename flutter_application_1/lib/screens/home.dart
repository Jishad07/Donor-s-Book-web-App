import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/donaters_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('Donor');
  // bool showDetails = false;
   List<bool> showDetails = List.filled(10, false);
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
              child: StreamBuilder(
                stream: donor.snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot donorsdata =
                            snapshot.data.docs[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // color: Colors.amber,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.red,
                                        child: Text(donorsdata['bloodgroup']),
                                      ),
                                      Text(
                                        donorsdata['name'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit_note),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          showDetails[index] = !showDetails[index];
                                        });
                                      },
                                      child: Icon(!showDetails[index]
                                          ? Icons.arrow_drop_down_outlined
                                          : Icons.arrow_drop_up_sharp)),
                                  Visibility(
                                    visible: showDetails[index],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Donor's Details",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Name: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(donorsdata['name'])
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Phone Number: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(donorsdata['phone']
                                                  .toString())
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Email: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(donorsdata['email'])
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Date Of Birth: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(donorsdata['dateofbirth'])
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "District: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(donorsdata['district'])
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "City/Town: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(donorsdata['city'])
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  }
                  return Container(
                    child: Text("mujeebaka"),
                  );
                },
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => const Donaters_page()));
                      },
                      child: const Text(
                        "Create Blood Donater",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              ))
        ],
      ),
    );
  }
}





                        // height: 80,
                      //   color: Colors.white,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Container(
                      //             child: CircleAvatar(
                      //               backgroundColor: Colors.red,
                      //               radius: 30,
                      //               child: Center(child: Text(donorsdata['bloodgroup'])),
                      //             ),
                      //           ),
                      //           SizedBox(height: 10,),
                      //            Container(
                                 
                      //             // color: Colors.amber,
                      //            child: const Column(
                      //             children: [
                      //               Text("Donor's Details"),
                      //               Divider(
                                      
                      //                 color: Colors.black,
                      //               )
                      //             ],
                      //            ),
                      //           )
                           
                              
                      //         ],
                      //       ),
                      //       Column(
                      //         children: [
                      //           Text(donorsdata['name'],style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      //           Text(donorsdata['phone'].toString())
                      //         ],
                      //       ),
                      //        Row(
                      //         children: [
                      //           IconButton(onPressed: (){}, icon: const Icon(Icons.edit_note_outlined)),
                      //             IconButton(onPressed: (){}, icon:const  Icon(Icons.delete,),color: Colors.red,)
                      //         ],
                              
                      //        ), 
                             
                      //     ],
                          
                      //   ),
                        
                      // ),