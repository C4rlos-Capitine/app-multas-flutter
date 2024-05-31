import 'package:flutter/material.dart';
import 'package:multas_v2/views/aba_multas.dart';
import 'package:multas_v2/views/aba_perfil.dart';
import 'package:multas_v2/controller/condutor_controller.dart';

class dados_condutor extends StatefulWidget {
  final String codigo;
  const dados_condutor({Key? key, required this.codigo}) : super(key: key);


  @override
  State<dados_condutor> createState() => _dados_condutorState();
}

class _dados_condutorState extends State<dados_condutor> {
  late Map<String, dynamic>? data;
  @override
  void initState() {
    // TODO: implement initState
    data = get_info_condutor(widget.codigo) as Map<String, dynamic>?;
    print("-------------------------");
    print(data);
    super.initState();
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
            bottom: const TabBar(tabs:[
              Tab(icon: Icon(Icons.person_add_rounded), child: Text("Dados Pessoais"),),
              Tab(icon: Icon(Icons.list_alt), child: Text("Multas"))
            ]),
          ),
          body: TabBarView(
            children: [
              aba_perfil(data),
              aba_multas()
            ],
          ),
        ),
      ),
    );
  }
}
