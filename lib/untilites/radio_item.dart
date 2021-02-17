import 'package:flutter/material.dart';
import 'package:flutter_workshop/untilites/radio.model.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: new Center(
              child: new Text('${this._item.index + 1}',
                  style: new TextStyle(
                      color:
                      _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? Colors.blue
                  : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Colors.blue
                      : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 25.0),
            child: Text(_item.text),
          )
        ],
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 5),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.blueAccent),
    //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //   ),
    //   child: RadioListTile<int>(
    //     title: Text(this._item.text),
    //     value: this.index + 1,
    //     groupValue: this._selectedOrderStatus,
    //     onChanged: (int value) {
    //       setState(() {
    //         this._selectedOrderStatus = value;
    //       });
    //     },
    //   ),
    // )
  }
}