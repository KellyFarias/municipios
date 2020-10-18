import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:municipios/modelos/municipio.dart';


class MunicipioInfomation extends StatefulWidget {
  final Municipios municipios;
  MunicipioInfomation(this.municipios);
  @override
  _MunicipioInfomationState createState() => _MunicipioInfomationState();
}

final municipiosReference = FirebaseDatabase.instance.reference().child('municipios');

class _MunicipioInfomationState extends State<MunicipioInfomation> {

  List<Municipios> items;

  //String productImage;//nuevo

  @override
  void initState() {   
    super.initState();
    //productImage = widget.product.productImage;//nuevo
    //print(productImage);//nuevo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Municipio Information'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[                
                new Text("Name : ${widget.municipios.nombre}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Significado : ${widget.municipios.significado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Cabecera Municipal : ${widget.municipios.cabecera}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Superficie : ${widget.municipios.superficie}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Principales Aspectos :", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Elevaciones : ${widget.municipios.elevaion}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Rios o Canales : ${widget.municipios.riocanal}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Cuerpos de Agua : ${widget.municipios.cuerpoagua}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Municipio más Poblado: ${widget.municipios.maspoblado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Municipio más extenso: ${widget.municipios.masextenso}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Municipio menos Poblado: ${widget.municipios.menospoblado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Mas Industrializado : ${widget.municipios.industrializado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Clima : ${widget.municipios.superficie}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Localización :Lat. ${widget.municipios.latitud} , Long. ${widget.municipios.longitud}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}