import 'package:flutter/material.dart';
import 'package:multas_v2/views/aba_multas.dart';
import 'aba_home.dart';
import 'aba_perfil.dart';

class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  void change_screen(String codigo){

    Navigator.pushNamed(context, "/dados_condutor", arguments: {'codigo': codigo});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Multas do Condutor"),
              bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.home_filled), child: Text("Home"),),
                    //Tab(icon: Icon(Icons.person_add_rounded), child: Text("Perfil"),),
                    Tab(icon: Icon(Icons.list_alt), child: Text("Multas"))
                  ]
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                aba_home(),
               // aba_perfil(),
                aba_multas(),
              ],
            ),
          ),
        )
    );
  }
}
