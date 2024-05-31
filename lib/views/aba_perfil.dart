import 'package:flutter/material.dart';

class aba_perfil extends StatefulWidget {
  final dados;
  const aba_perfil(Map<String, dynamic>? data, {Key? key, this.dados}) : super(key: key);

  @override
  State<aba_perfil> createState() => _aba_perfilState();
}

class _aba_perfilState extends State<aba_perfil> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text("ola2"), Text("Mundo2"), Text("2023")],
    );
  }
}
