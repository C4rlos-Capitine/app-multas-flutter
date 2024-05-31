import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multas"),
        backgroundColor: Colors.grey,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Card(
            child: Text("Login"),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Email")
              ),
            ),

          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(50),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Senha"),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/main_screen");}, child: Text("Login"),
              style: ElevatedButton.styleFrom(primary: Colors.grey, ),),
          ),
        ],
      ),
    );
  }
}
