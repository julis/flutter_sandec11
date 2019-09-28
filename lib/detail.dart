import 'package:flutter/material.dart';

class DetailPageBreakfast extends StatelessWidget {
  
  final String image, name, ket;
  DetailPageBreakfast({Key key, this.image, this.name, this.ket}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blue[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context,false),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: 200.0,
            height: 300.0,
            child: Hero(
              tag: ['image'],
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    'img/$image',
                    fit: BoxFit.cover,
                    ),
                )
              ),
            ),
          ),
          NamePart(name: name),
          KeteranganPart(keterangan: ket)
        ],
      ),
    );
  }
}
          
class NamePart extends StatelessWidget {
  final String name;

  const NamePart({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(name),
          Row(
            children: <Widget>[
              Text('5'),
              Icon(Icons.star)
            ],
          ),
        ],
      ),
    );
  }
}

class KeteranganPart extends StatelessWidget {
  final String keterangan;

  const KeteranganPart({Key key, this.keterangan}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            keterangan, 
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
            ),
        ),
      ),
    );
  }
}