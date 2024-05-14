import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/donaters_page.dart';
import 'package:flutter_application_1/screens/updatedonors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('Donor');
     
     void deletedonor(id){
      donor.doc(id).delete();
     }
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
                stream: donor.orderBy("name").snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot donorsdata =
                            snapshot.data.docs[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
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
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>  UpdateDoners(donordetails: donorsdata)));
                                            },
                                            icon: const Icon(Icons.edit_note),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              deletedonor(donorsdata.id);
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          showDetails[index] =
                                              !showDetails[index];
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
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
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
                                              const Text(
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
                                              const Text(
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
                                              const Text(
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
                                              const Text(
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
                                              const Text(
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
                  return const SizedBox(
                   child: Center(
                  child: Text("No Data Found"),
                   ),
                  );
                },
              )
              ),
          Expanded(
              flex: 1,
              child: SizedBox(
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
