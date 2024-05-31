import 'package:flutter/material.dart';
import 'package:multas_v2/views/dados_condutor.dart';
import '../controller/condutor_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
class aba_home extends StatefulWidget {
  const aba_home({Key? key}) : super(key: key);

  @override
  State<aba_home> createState() => _aba_homeState();
}

class _aba_homeState extends State<aba_home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context, BuildContext parentContext) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _textEditingController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Invalido';
                      },
                      decoration: InputDecoration(hintText: 'Codigo do condutor'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    // Get the text value from the TextEditingController
                    String codigo = _textEditingController.text;

                    // Pass the extracted text value to your function
                    var check = await check_cod_condutor(codigo);
                    if(check){
                      //Navigator.of(context).pop();
                      Navigator.of(parentContext).push(
                        MaterialPageRoute(builder: (context) => dados_condutor(codigo: codigo)),
                      );

                      //Navigator.pushNamed(context, "/dados_condutor", arguments: {'codigo': codigo});
                      print(check);
                    }else{
                      Fluttertoast.showToast(
                          msg: "Condutor não encontrado!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.redAccent,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                    // Optionally, close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text('Ver'),
                ),
              ],
            );
          },
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 50),
        Container(
          width: 400.0,
          height: 50.0,
          child: Card(
            child: Text("Bem Vindo ao aplicativo de multas", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),),
            color: Colors.green,
          ),
        ),
        SizedBox(height: 50),
        Container(
          width: 300.0,
          height: 30.0,

          child: ElevatedButton.icon(onPressed: () async{ await showInformationDialog(context, context);}, icon: Icon(Icons.app_registration), label: Text("Registar Infração")),
        ),
        SizedBox(height: 50),
        Container(
          width: 300.0,
          height: 30.0,
          child: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.app_registration), label: Text("Ver dados de um condutor")),
        )
      ],
    );
  }
}
