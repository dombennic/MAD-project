import 'package:flutter/material.dart';
import 'cartpage.dart';

class DetailPage extends StatefulWidget {
  final iPath;
  final iName;
  final iPrice;

  const DetailPage({this.iPath, this.iName, this.iPrice});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.iName),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.red, Colors.blue],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: widget.iPath,
            child: Image(
              image: AssetImage(widget.iPath),
              height: 300,
              width: 360,
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.iName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.iPrice,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen2(
                          itemCount: _itemCount,
                          iName: widget.iName,
                        ),
                      ),
                    );
                  }),
              IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() => _itemCount--);
                  }),
              new Text(_itemCount.toString()),
              IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    setState(() => _itemCount++);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
