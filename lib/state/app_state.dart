import 'package:cloud_firestore/cloud_firestore.dart';

class AppState {
  final String currentCollection;
  final QuerySnapshot currentDirSnapshot;


  AppState({this.currentCollection, this.currentDirSnapshot});

  factory AppState.initialState() =>
      AppState(currentCollection: "", currentDirSnapshot: null);

  AppState copyWith({String currentPath, QuerySnapshot currentDirSnapshot}) =>
      AppState(
          currentCollection: currentPath ?? this.currentCollection,
          currentDirSnapshot: currentDirSnapshot ?? this.currentDirSnapshot);

  @override
  String toString() =>
      "currentCollection: $currentCollection\n"
          "curentDirSnapshot: $currentDirSnapshot";
}
