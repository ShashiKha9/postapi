import 'dart:convert';

import 'package:api/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(MaterialApp(
     home: MyApp()));
}
class MyApp extends StatefulWidget{
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State <MyApp> {
  var nameController = TextEditingController();
  var jobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.postData();
  }
 Future <UserProfile> postData() async{
   final res = await http.post(Uri.parse("https://reqres.in/api/users"),
       body:{
     "name": nameController.text,
         "job": jobController.text,
       } ,
     headers: {
     "Content-Type" : "application/x-www-form-urlencoded"

}
       );
       Map<String, dynamic
       >track =json.decode(res.body);

   final User =  UserProfile.fromJson(track);
print(User.name);

return User;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         TextFormField(
           validator: (value){
             if(value == null){
               return " add a title";
             }

           },
            decoration: InputDecoration(
                labelText:"name"


            ),
           controller: nameController,
          ),
          TextFormField(
            validator: (value){
    if(value == null){
      return " add a body";
    }

    },
            decoration: InputDecoration(
                labelText:"job"
            ),
            controller: jobController,

          ),
          ElevatedButton(onPressed: postData,
           child: Text("lOGIN")),
          SizedBox(
            height: 470,

          child:Column(
            children:[
              Expanded(child:
              FutureBuilder(
                  future: postData(),
                  builder: (context,AsyncSnapshot <UserProfile> snapshot){
                    if(snapshot.data != null){
                      return ListView.builder(

                          itemBuilder:( context,index){
                            return Card(
                              child:  ListTile(
                                title: Text(snapshot.data!.name.toString()),
                                subtitle: Text(snapshot.data!.job.toString()),
                              ),
                            );

                          });
                    }
                    return CircularProgressIndicator();
                  })
              )
            ]

          )
          )
        ],
        




      ),
      

    );


  }
}
