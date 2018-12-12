import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DirectoryPageView extends StatelessWidget {
  final List<DocumentSnapshot> stuff;

  const DirectoryPageView({Key key, this.stuff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: stuff.length,
      itemBuilder: (BuildContext context, int index) {
        return ListView.builder(
          itemCount: stuff[index].data.length,
          itemBuilder: (BuildContext context, int index2) {
            var value = stuff[index].data.values.toList()[index2];
            return ListTile(
                leading: Text("${stuff[index].data.keys.toList()[index2]}: "),
                title: value is Map
                    ? ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                                leading: Text(value.keys.toList()[index]),
                                title: Text(
                                    value.values.toList()[index].toString())),
                      )
                    : Text(stuff[index].data.keys.toList()[index2] //
                        ));
            //TODO: Keep documents in the same level on the same page.
          },
        );
      },
    );
  }
}
