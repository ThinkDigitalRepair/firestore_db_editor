import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_db_editor/directory_page_view.dart';
import 'package:firestore_db_editor/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firestore_db_editor/blocs/db_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rx_widgets/rx_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase DB Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var collectionTextEditingController = TextEditingController();
    DbBloc dbBloc = DbBloc();
    return BlocProvider<DbBloc>(
        bloc: dbBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Firebase DB Editor"),
          ),
          body: Column(
            children: <Widget>[
              ListTile(
                leading: Text("Collection:"),
                title: TextField(
                  controller: collectionTextEditingController,
                ),
                trailing: FlatButton(
                    onPressed: () => dbBloc.dispatch(GetDocumentsFromCollection(
                        collectionTextEditingController.text)),
                    child: Text("Query")),
              ),
              Expanded(
                child: StreamBuilder<DbState>(
                  stream: dbBloc.state,
                  builder:
                      (BuildContext context, AsyncSnapshot<DbState> snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data.currentDirSnapshot != null) {
                      List<DocumentSnapshot> documentList =
                          snapshot.data.currentDirSnapshot.documents;
                      return DirectoryPageView(
                        stuff: documentList,
                      );
                    } else
                      return Center(child: Text("No Data"));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
