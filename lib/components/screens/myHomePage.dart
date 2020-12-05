import 'package:flutter/material.dart';
import 'package:flutter_demo/components/screens/showMessage.dart';
import 'package:flutter_demo/mockData/mockKittens.dart';
import 'package:flutter_demo/models/kitten.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Kitten> kittensList = [];
  @override
  void initState() {
    super.initState();
    kittensList = MockData().kittens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemCount: kittensList.length,
            itemBuilder: _listItemBuilder));
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    var _mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, kittensList[index])),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Card(
          elevation: 18.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: kittensList[index].id,
                  child: Image.network(
                    kittensList[index].imageUrl,
                    scale: 1.0,
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.fill,
                    height: _mediaQuery.height * 0.20,
                    width: _mediaQuery.width * 0.30,
                  ),
                ),
              ),
              Text(
                kittensList[index].name,
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(contentPadding: EdgeInsets.zero, children: <Widget>[
      Container(
          height: MediaQuery.of(context).size.height * 0.50,
          child: Image.network(kitten.imageUrl, fit: BoxFit.fill)),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(kitten.name, style: localTheme.textTheme.headline),
            Text('${kitten.age} months old',
                style: localTheme.textTheme.subhead),
            SizedBox(height: 16.0),
            Text(kitten.description, style: localTheme.textTheme.body1),
            Wrap(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(this.context, true);
                    setState(() {
                      _adoptme(kitten.id);
                    });
                  },
                  child: Text('Adopt me'),
                )
              ],
            ),
          ],
        ),
      )
    ]);
  }

    void _adoptme(int id) {
    kittensList.removeWhere((element) => element.id == id);
    ShowMessage.showAlertSuccess(this.context, "Thanks for adopting me!");
  }
}
