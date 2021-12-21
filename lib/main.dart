import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop list',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      )),
      home: ShopList(),
    );
  }
}

class ShopList extends StatefulWidget {
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final _shopItems = <String>[];
  final fieldText = TextEditingController();

  void clearText() {
    setState(() {
      _shopItems.add(fieldText.value.text);
    });
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shop List"),
        ),
        body: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Insert shop product',
                    suffixIcon: IconButton(
                        onPressed: clearText, icon: const Icon(Icons.check))),
                controller: fieldText,
              )),
          Expanded(
              child: ListView.builder(
                  itemCount: _shopItems.length,
                  itemBuilder: (context, i) {
                    return _buildRow(_shopItems[i]);
                  }))
        ]));
  }

  Widget _buildRow(String shopItem) {
    return Card(
        child: ListTile(
      title: Text(shopItem),
      trailing: const Icon(Icons.check_box_outline_blank),
      onTap: () {
        setState(() {
          _shopItems.remove(shopItem);
        });
      },
    ));
  }
}
