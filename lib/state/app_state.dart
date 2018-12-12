import 'package:cloud_firestore/cloud_firestore.dart';

class DbState {
  final String currentCollection;
  final QuerySnapshot currentDirSnapshot;

  DbState({this.currentCollection, this.currentDirSnapshot});

  factory DbState.initialState() =>
      DbState(currentCollection: "", currentDirSnapshot: null);

  DbState copyWith({String currentPath, QuerySnapshot currentDirSnapshot}) =>
      DbState(
          currentCollection: currentPath ?? this.currentCollection,
          currentDirSnapshot: currentDirSnapshot ?? this.currentDirSnapshot);

  @override
  String toString() => "currentCollection: $currentCollection\n"
      "curentDirSnapshot: $currentDirSnapshot";
}
