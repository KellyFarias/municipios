import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:municipios/modelos/municipio.dart';
//nuevo para imagenes
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';

File image;
String filename;

class MunicipioScreen extends StatefulWidget {
  final Municipios municipio;
  MunicipioScreen(this.municipio);
  @override
  _MunicipioScreenState createState() => _MunicipioScreenState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('municipios');

class _MunicipioScreenState extends State<MunicipioScreen> {

  List<Municipios> items;

  TextEditingController _claveController;
  TextEditingController _nombreController;
  TextEditingController _significadoController;
  TextEditingController _cabeceraController;
  TextEditingController _superficieController;
  TextEditingController _altitudController;
  TextEditingController _elevacionController;
  TextEditingController _rioController;
  TextEditingController _cuerpoaguaController;
  TextEditingController _maspobladoController;
  TextEditingController _masextensoController;
  TextEditingController _menospobladoController;
  TextEditingController _industrializadosController;
  TextEditingController _climaController;
  TextEditingController _latitudController;
  TextEditingController _longitudController;
  String nuevo;
  
   //nuevo imagen
  

 /* pickerCam() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }*/

 /* pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }*/
  
  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }
  //fin nuevo imagen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _claveController=new TextEditingController(text: widget.municipio.clave);
    _nombreController = new TextEditingController(text: widget.municipio.nombre);
    _significadoController = new TextEditingController(text: widget.municipio.significado);
    _cabeceraController = new TextEditingController(text: widget.municipio.cabecera);
    _superficieController = new TextEditingController(text: widget.municipio.superficie);
    _altitudController = new TextEditingController(text: widget.municipio.altitud);
    _elevacionController=new TextEditingController(text: widget.municipio.elevaion);
    _rioController=new TextEditingController(text: widget.municipio.riocanal);
    _cuerpoaguaController=new TextEditingController(text: widget.municipio.cuerpoagua);
    _maspobladoController=new TextEditingController(text: widget.municipio.maspoblado);
    _masextensoController=new TextEditingController(text: widget.municipio.masextenso);
    _menospobladoController=new TextEditingController(text: widget.municipio.menospoblado);
    _industrializadosController=new TextEditingController(text: widget.municipio.industrializado);
    _climaController=new TextEditingController(text: widget.municipio.clima);
    _latitudController=new TextEditingController(text: widget.municipio.latitud);
    _longitudController=new TextEditingController(text: widget.municipio.longitud); 
    nuevo=  widget.municipio.clave.toString();
    print('clave es:'+nuevo);
  //productImage = widget.product.productImage;
   // print(productImage);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Municipios'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
       
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.album), labelText: 'Información General'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                 TextField(
                  controller: _claveController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.widgets), labelText: 'Clave'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _nombreController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _significadoController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.ac_unit), labelText: 'Significado'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _cabeceraController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Cabecera Municipal'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _superficieController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on), labelText: 'Superficie'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _altitudController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.shop), labelText: 'Altitud'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.album), labelText: 'Principales Aspectos'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _elevacionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Elevaciones'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _rioController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Rios o Canales'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),TextField(
                  controller: _cuerpoaguaController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Cuerpos de Agua'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _maspobladoController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Municipio mas Poblado'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _masextensoController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Municipio mas extenso'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _menospobladoController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Municipio Menos Poblado'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _industrializadosController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Municipio más Industrializado'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0,left: 5.0),
                ),
                Divider(),
                TextField(
                  controller: _climaController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Clima'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _latitudController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Latitud'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _longitudController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.announcement), labelText: 'Longitud'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      //nuevo imagen
                      if (widget.municipio.clave == null) {
                        
                        municipioReference.child(_claveController.text).set({
                          'nombre': _nombreController.text,
                          'significado': _significadoController.text,
                          'cabecera': _cabeceraController.text,
                          'superficie': _superficieController.text,
                          'altitud': _altitudController.text,
                          'elevacion': _elevacionController.text,
                          'riocanal': _rioController.text,
                          'cuerpoagua': _cuerpoaguaController.text,
                          'maspoblado': _maspobladoController.text,
                          'masextenso': _masextensoController.text,
                          'menospoblado': _menospobladoController.text,
                          'industrializado': _industrializadosController.text,
                          'clima': _climaController.text,
                          'latitud': _latitudController.text,
                          'longitud': _longitudController.text,
                          
                          
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                       

                        municipioReference.push().set({
                          'nombre': _nombreController.text,
                          'significado': _significadoController.text,
                          'cabecera': _cabeceraController.text,
                          'superficie': _superficieController.text,
                          'altitud': _altitudController.text,
                          'elevacion': _elevacionController.text,
                          'riocanal': _rioController.text,
                          'cuerpoagua': _cuerpoaguaController.text,
                          'maspoblado': _maspobladoController.text,
                          'masextenso': _masextensoController.text,
                          'menospoblado': _menospobladoController.text,
                          'industrializado': _industrializadosController.text,
                          'clima': _climaController.text,
                          'latitud': _latitudController.text,
                          'longitud': _longitudController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.municipio.clave!= null)
                        ? Text('Editar')
                        : Text('Agregar')),
                        
              ],
            ),
          ),
        ),
      ),
    );
  }
}