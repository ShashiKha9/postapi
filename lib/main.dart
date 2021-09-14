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
  var title = TextEditingController();
  var body = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.postData();
  }
 Future postData() async{
   final res = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
       body:{
     "title": title.text,
         "body": body.text
       } ,

   );
   return res;
   final user = (res.body);
print(res.body);


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
                labelText:"title"


            ),
           controller: title,
          ),
          TextFormField(
            validator: (value){
    if(value == null){
      return " add a body";
    }

    },
            decoration: InputDecoration(
                labelText:"body"
            ),
            controller: body,

          ),
          ElevatedButton(onPressed: postData,
            
           child: Text("lOGIN")),
          
          FutureBuilder(
            future: postData(),
              builder: (context,AsyncSnapshot  snapshot){
              if(snapshot.data != null){
                return ListView.builder(
                itemBuilder:( context,index){
                  return Card(
                  child:  ListTile(
                  title: Text(snapshot.data[index]['title']),
                 subtitle: Text(snapshot.data[index]['body']),
                  ),
                  );

    });
    }
return CircularProgressIndicator();
          })
        ],
        




      ),
      

    );


  }
}
