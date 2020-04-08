import 'package:flutter/material.dart';

void main() => runApp(ElementosApp());


class ElementosApp extends StatefulWidget {
  @override
  _ElementosAppState createState() => _ElementosAppState();
}


class _ElementosAppState extends State<ElementosApp> {

  final _formkey = GlobalKey<FormState>();

  bool _brasileira = false;
  bool _mexicana = false;

  String radioBt;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text('Elementos App'),
        ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[

             Form(
               key:_formkey,
               child: TextFormField(
                  decoration: InputDecoration(
                  labelText: 'Digite seu nome',
                  ),
                  validator:(value){
                    if(value.isEmpty){
                      return '** Campo Obrigatório';
                    }
                    return null;
                  },
                ),
             ),  

           CheckboxListTile(
             title: Text('Comida Brasileira'),
             subtitle: Text('A melhor do mundo!!'),
             secondary: Icon(Icons.add_box),
             activeColor: Colors.green,
             value: _brasileira, 
             onChanged: (bool result){
                setState(() {
                  _brasileira = result;
                });
             },
             ),

             CheckboxListTile(
             title: Text('Comida Mexicana'),
             subtitle: Text('A mais picante!!'),
             secondary: Icon(Icons.add_box),
             activeColor: Colors.green,
             value: _mexicana, 
             onChanged: (bool result){
                setState(() {
                  _mexicana = result;
                });
             },
             ),

             RadioListTile(
               title: Text('Masculino'),
               value: 'M',
               activeColor: Colors.green,
                groupValue: radioBt,
                 onChanged: (String escolha){
                   setState(() {
                     radioBt = escolha;
                   });
                },
                 ),

            RadioListTile(
               title: Text('Feminino'),
               value: 'F',
               activeColor: Colors.green,
                groupValue: radioBt,
                 onChanged: (String escolha){
                   setState(() {
                     radioBt = escolha;
                   });
                 },
                 ),

             RaisedButton(
               color: Colors.blue,
               onPressed: (){
                 print(
                   'Comida Brasileira: '+_brasileira.toString()+' '+
                   'Comida Mexicana: '+_mexicana.toString()+' '+
                   'Sexo: '+radioBt
                   );
                 if(_formkey.currentState.validate()){
                   print('Formulário Validado!');
                 }  
               },
               child: Text(
                 'Salvar',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 16,
                 ),
                 ),
               ),

          ],
        ),
      ),
      ),

      ),
    );

  }

}

