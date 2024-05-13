import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/donaters_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
             child:Container(
              color: Colors.amber,
             )),
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