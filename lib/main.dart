import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto 1',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Mintic Reto 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textOrigen= TextEditingController();
final textDestino = TextEditingController();

String Opc1 = "COP";
String Opc2 = "USD";

class Calculadora {
  final titulo; 
  final Color;
  final Icono;

  Calculadora(this.titulo, this.Color, this.Icono);
  
}
List<DropdownMenuItem<String>> dd=<DropdownMenuItem<String>>[
  DropdownMenuItem(value:"USD", child: Text("USD")),
  DropdownMenuItem(value:"EUR", child: Text("EUR")),
  DropdownMenuItem(value:"COP", child: Text("COP")),
];

List<Calculadora> cal = <Calculadora>[
  Calculadora("9", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("8", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("7", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("6", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("5", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("4", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("3", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("2", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("1", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("0", Colors.lightBlue, Icon(Icons.abc)),
  Calculadora("Limpiar", Colors.lightBlue, Icon(Icons.cleaning_services)),
  Calculadora("Calcular", Colors.lightBlue, Icon(Icons.calculate)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
         title: Text(widget.title),
      ),
      body: Padding(padding: EdgeInsets.all(30),
       child: Column(
        children: [
        Row(
          children: [
            Text("Origen : "), 
            DropdownButton(value: Opc1,
            items: dd, 
            onChanged: (String? x){

              setState(() {
               Opc1 = x.toString(); 
              });
              
            }), 
            VerticalDivider(),
            VerticalDivider(),
            VerticalDivider(),
            Text("Convertir : "),
            DropdownButton(value: Opc2,
            items: dd, 
            onChanged: (String? x){

              setState(() {
                Opc2 = x.toString();
              });
            }),
        ],
        ),  
        TextField(
          controller: textOrigen,
          decoration: InputDecoration(labelText: "Moneda Origen", hintText: "0"),
        ),
        TextField(
          controller: textDestino,
          decoration: InputDecoration(labelText: "Moneda Cambio", hintText: "0"),
        ),  
        Expanded(
          child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: cal.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: cal[index].Color,
            child: ListTile(
              title:Center (
                child: index>9? cal[index].Icono: Text(cal[index].titulo)
                ),
                onTap:() {

                  if(index<10){
                  textOrigen.text = textOrigen.text+cal[index].titulo;
                  } else if(index == 10) {
                    textOrigen.text = "";
                    textDestino.text = "";
                  } else {
                    if (Opc1 == "USD" && Opc2 == "COP"){
                      textDestino.text = (double.parse(textOrigen.text)*4980).toString();
                      }
                     else if (Opc1 == "COP" && Opc2 == "USD"){
                      textDestino.text = (double.parse(textOrigen.text)/4980).toString();
                       }
                       else if (Opc1 == "EUR" && Opc2 == "COP"){
                      textDestino.text = (double.parse(textOrigen.text)*4930).toString();
                      }
                     else if (Opc1 == "COP" && Opc2 == "EUR"){
                      textDestino.text = (double.parse(textOrigen.text)/4930).toString();
                       }
                       else if (Opc1 == "EUR" && Opc2 == "USD"){
                      textDestino.text = (double.parse(textOrigen.text)*0.99).toString();
                      }
                     else if (Opc1 == "USD" && Opc2 == "EUR"){
                      textDestino.text = (double.parse(textOrigen.text)/0.99).toString();
                       } else {
                        textDestino.text = textOrigen.text;
                       }
                    }
                  }
                 ),
               ) ;
             },
           ))
         ],
        ),
      ), 
    );
      // This trailing comma makes auto-formatting nicer for build methods.  
  }
}
