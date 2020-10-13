import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, 'A',
        'Pelunasan dipercepat (cash langsung) + Mendapat Potongan Bunga & Denda'));
    sampleData.add(new RadioModel(false, 'B',
        'Pelunasan Dipercepat (Cicil) + Mendapat Potongn Bunga atau Bunga Berhenti/Flat'));
    sampleData.add(new RadioModel(false, 'C',
        'Pengurangan Cicilan Jauh Lebih Ringan untuk pertagihan/bulanannya'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kartu Kredit"),
        ),
        body: Column(
          children: <Widget>[
            Text("Pilih Jenis Program"),
            new ListView.builder(
                itemCount: sampleData.length,
                itemBuilder: (BuildContext context, int index) {
                  return new InkWell(
                    splashColor: Colors.lightBlue,
                    onTap: () {
                      setState(() {
                        sampleData
                            .forEach((element) => element.isSelected = false);
                        sampleData[index].isSelected = true;
                      });
                    },
                    child: new RadioItem(sampleData[index]),
                  );
                })
          ],
        ),
      ),
    );
  }
}

@override
class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(4.0),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 60.0,
            width: 60.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: new Border.all(
                  width: 3.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          new Container(
              margin: new EdgeInsets.all(8),
              child: new Text(_item.text,
                  style: new TextStyle(
                    fontSize: 12.0,
                  )))
        ],
      ),
    );
  }
}

@override
class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
