import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/donaters_page.dart';
import 'package:flutter_application_1/screens/home.dart';

class UpdateDoners extends StatefulWidget {
  final DocumentSnapshot donordetails;
  const UpdateDoners({super.key,required this.donordetails});

  @override
  State<UpdateDoners> createState() => _UpdateDonersState();
}

class _UpdateDonersState extends State<UpdateDoners> {
   final GlobalKey<FormState>editform=GlobalKey<FormState>();
   final TextEditingController editname=TextEditingController();
   final TextEditingController editphone=TextEditingController();
   final TextEditingController editemail=TextEditingController();
   final TextEditingController editdateofbirth=TextEditingController();
   final TextEditingController editblood=TextEditingController();
   final TextEditingController editdistrict=TextEditingController();
   final TextEditingController editcity=TextEditingController();
    List<String> items = ['AB+ve', 'AB-ve', 'A+ve', 'A-ve','B+ve','B-ve','Oh+ve','Oh-ve','O+ve','O-ve'];
   String? selectedItem;
   final CollectionReference donor =
      FirebaseFirestore.instance.collection('Donor');
    
    @override
  void initState() {
  
    super.initState();
   
  
   


   
  }
    
  @override
  Widget build(BuildContext context) {
     editname.text=widget.donordetails['name'].toString();
   editphone.text=widget.donordetails['phone'].toString();
   editemail.text=widget.donordetails['email'].toString();
   editdateofbirth.text=widget.donordetails['dateofbirth'].toString();
   editblood.text=widget.donordetails['bloodgroup'].toString();
   editdistrict.text=widget.donordetails['district'].toString();
   editcity.text=widget.donordetails['city'].toString();
   final String docId = widget.donordetails.id.toString();
   
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
                            key: editform,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  controller: editname,
                                  
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
                                  controller: editphone,
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
                                  controller: editemail,
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
                                  
                                  controller: editdateofbirth,
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
                                            
                                    controller:editblood ,
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
                                          if(value==null||value.isEmpty||selectedItem==null){
                                            return "Add Your Blood Group";
                                          }
                                          return null;
                                        },),
                                TextFormField(
                                
                                  controller:editdistrict,
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
                                  controller: editcity,
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
                                     editedonor(docId);
                                    },
                                    child: const Text(
                                      "Update",
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

   void  editedonor(docId){
    final data={
      'name':editname.text,
      'phone':editphone.text,
      'email':editemail.text,
      'dateofbirth':editdateofbirth.text,
      'bloodgroup':selectedItem,
      'district':editdistrict.text,
      'city':editcity.text,
    };

  if(editform.currentState!.validate()){
    donor.doc(docId).update(data);
    // .then((value) => Navigator.of(context).pop())
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
                  editblood.text = selectedItem!;
                });
                Navigator.pop(context);
                },
              );
            });
         });
    }
}