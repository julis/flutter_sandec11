import 'package:flutter/material.dart';
import 'detail.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new BreakfastPage());
  }
}

class BreakfastPage extends StatefulWidget {
  @override
  _BreakfastPageState createState() => _BreakfastPageState();
}

class _BreakfastPageState extends State<BreakfastPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Container> _menuBreakfast = List();
  var _breakfast = sarapan;

  @override
  void initState() {
    _populateMenuBreakfast();
    super.initState();
  }
  
  _populateMenuBreakfast() {
      _menuBreakfast = _breakfast.map((item){
      final image = item['gambar'];
      final name = item['nama'];
      final ket = item['ket'];

      final container = _buildContainer(image, name, ket);
      return container;
    }).toList();
  }

  Container _buildContainer(String image, String name, String ket) {

    return Container(
        child: Card(
          child: Column(
            children: <Widget>[
              Hero(
                tag: ['image'],
                child: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text(name),
                        action: SnackBarAction(
                          label: 'Detail',
                          textColor: Colors.blue,
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => DetailPageBreakfast(image:image, name:name, ket:ket)
                              )
                            );
                          },
                        ),
                      )
                    );
                  },
                  child: Image.asset(
                    'img/$image',
                    fit: BoxFit.cover,
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
      );
  }

  Future<Null> _refresh() {
  return _populateMenuBreakfast();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        title: Text('List Breakfast'),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: _menuBreakfast,
      ), 
      
    );;
  }
}