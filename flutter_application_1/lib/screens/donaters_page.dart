import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class Donaters_page extends StatefulWidget {
  const Donaters_page({super.key});

  @override
  State<Donaters_page> createState() => _Donaters_pageState();
}

class _Donaters_pageState extends State<Donaters_page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name=TextEditingController();
  final TextEditingController phone=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController dateofbirth  =TextEditingController();
  final TextEditingController district=TextEditingController();
  final TextEditingController city=TextEditingController();
  final TextEditingController blood=TextEditingController();
   String? selectedItem;
   List<String> items = ['AB+ve', 'AB-ve', 'A+ve', 'A-ve','B+ve','B-ve','Oh+ve','Oh-ve','O+ve','O-ve'];
   final CollectionReference donor =
      FirebaseFirestore.instance.collection('Donor');
        

  

  @override
  Widget build(BuildContext context) {
    
    double paddingwidth = MediaQuery.of(context).size.width*0.2;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomPaint(
          painter: SShapePainter(),
          child: AppBar(
            title: const Text(
              "Donor registration",
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Card(
        child: Column(
          children: [
             Expanded(
              flex: 2, 
              child: Column(
                children: [
                  Text("Donor Registration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red[200]),),
                 const Text("Thank you for your interest in becoming a donor! Your generosity has the potential to save lives and make a meaningful impact on others. Please complete the registration form below to join our donor community."
                 ,style: TextStyle(color: Colors.black),)
                ],
              )),
            Expanded(
                flex: 9,
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Card(
                        
                        color: Colors.grey[300],
                        child: Padding(
                          padding:  EdgeInsets.only(left:paddingwidth,right: paddingwidth,top: 10,bottom: 10),
                          child: Form(
                            key: _formKey,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  controller: name,
                                  
                                 textInputAction: TextInputAction.next, // Set the desired text input action
                                 textCapitalization: TextCapitalization.sentences, 
                                  cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                             focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                        
                                        hintText: "Full Name"),
                                        validator: (value) {
                                          if(value==null||value.isEmpty){
                                            return "Enter  your Name";
                                          }
                                          return null;
                                        },),
                                TextFormField(
                                  controller: phone,
                                  cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                             focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                        hintText: "Phone Number"),
                                        validator: (value) {

                                            RegExp regex = RegExp(r'^[0-9]{10}$');
                                            
                                          if(value==null||value.isEmpty){
                                            return "Enter Your Phone Number";
                                          }else if(!regex.hasMatch(value)){
                                            return "Invalid Phone Number";
                                          }
                                          return null;
                                        },),
                                TextFormField(
                                  controller: email,
                                  cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                             focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                        hintText: "Email"),
                                        validator: (value) {
                                          RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                          if(value==null||value.isEmpty){
                                            return "Enter your Email";
                                          }
                                          else if(!regex.hasMatch(value)){
                                            return "Invalid Email";
                                          }
                                          return null;
                                        },),
                                TextFormField(
                                  
                                  controller: dateofbirth,
                                  cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                             focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                        suffix: const Text("YYYY-MM-DD",style: TextStyle(color: Colors.black38),),
                                        hintText: "Date of birth"),
                                        validator: (value) {
                                          RegExp regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                                          if(value==null||value.isEmpty){
                                            return "Select Your DateOf Birth";
                                          }else if(!regex.hasMatch(value)){
                                           return " Correct Date Formate";
                                          }
                                          return null;
                                        },),
                                           TextFormField(
                                  controller: blood,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: (){
                                        showtablelist(context);
                                      }, icon:const Icon(Icons.arrow_drop_down)),
                                        border: OutlineInputBorder(
                                           
                                            borderRadius: BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                          
                                        hintText: "Blood Group"),
                                        
                                        validator: (value) {
                                          if(value==null||value.isEmpty){
                                            return "Add Your Blood Group";
                                          }
                                          return null;
                                        },),
                                TextFormField(
                                
                                  controller:district,
                                  cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                             focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                        hintText: "District"),
                                        validator: (value) {
                                          if(value==null||value.isEmpty){
                                            return "Enter Your District";
                                          }
                                          return null;
                                        },),
                                TextFormField(
                                  controller: city,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                           
                                            borderRadius: BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:const  BorderSide(
                                              color: Colors.red),
                                                  
                                        ),
                                        hintText: "City/Town"),
                                        validator: (value) {
                                          if(value==null||value.isEmpty){
                                            return "Enter your City/Town";
                                          }
                                          return null;
                                        },),
                                ElevatedButton(
                                    onPressed: () {
                                      adddonor();
                                    },
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.red),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void  adddonor(){
    final data={
      'name':name.text,
      'phone':phone.text,
      'email':email.text,
      'dateofbirth':dateofbirth.text,
      'bloodgroup':blood.text,
      'district':district.text,
      'city':city.text,
    };

  if(_formKey.currentState!.validate()){
    donor.add(data);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Home()));
  }
  else{
   
  }
  }
   void showtablelist(BuildContext context){
      showModalBottomSheet(
        context: context,
         builder: (BuildContext context) {
           return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index){
              return   ListTile(
                title: Text(items[index]),
                onTap: () {
                   setState(() {
                  selectedItem = items[index];
                  blood.text = selectedItem!;
                });
                Navigator.pop(context);
                },
              );
            });
         });
    }
}

class SShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;
    Path path = Path()
      ..moveTo(0, size.height) // Start at bottom left
      // ..lineTo(0, size.height * 0.9) // Move up slightly
      ..cubicTo(
          size.width * 0.2,
          size.height * 0.8,
          size.width * 0.8,
          size.height * 0.2,
          size.width,
          size.height * 0) // Draw a cubic bezier curve
      ..lineTo(size.width, size.height) // Draw to bottom right
      ..lineTo(0, size.height); // Complete the shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
    

   