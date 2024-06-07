import 'package:flutter/material.dart';

import '../controller/condutor_controller.dart';

class aba_perfil extends StatefulWidget {
  final String codigo;

  const aba_perfil({Key? key, required this.codigo}) : super(key: key);

  @override
  State<aba_perfil> createState() => _aba_perfilState();
}

class _aba_perfilState extends State<aba_perfil> {
  late List<dynamic>? data;
  String nome = "null";
  String carta = "null";
  String bi = "null";
  void initState(){
    // TODO: implement initState
    //data = get_info_condutor(widget.codigo) as Map<String, dynamic>?;
    print("-------------------------");
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    data = (await get_info_condutor(widget.codigo)) as List?;
    print("-------------------------");

    print(data);
    print(data![0]["nome"]);
    print(data.runtimeType);


    setState(() {
        nome = data![0]["nome"] as String;
        var apelido = data![0]["apelido"] as String;
        nome = nome+" "+apelido;
        carta = data![0]["nr_carta"] as String;
        bi = data![0]["bi"] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child: Text("Nome: $nome", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    )
                )
            ),

            Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child: Text("Carta: $carta", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    )
                )
            ),

            Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child: Text("BI: $bi", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    )
                )
            ),
          ],
        ),

      ),
    );
  }
}
