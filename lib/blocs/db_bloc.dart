import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_db_editor/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class DbBloc extends Bloc<dynamic, AppState> {
  DbBloc();

  @override
  get initialState => AppState.initialState();

  @override
  Stream<AppState> mapEventToState(AppState state, event) async* {
    if (event is GetDocumentsFromCollection) {
      QuerySnapshot documents =
          await Firestore.instance.collection(event.path).getDocuments();
      yield state.copyWith(
          currentPath: event.path, currentDirSnapshot: documents);
    }
  }

  @override
  void onTransition(Transition transition) {
    print("${transition.currentState} ➡ ${transition.nextState}");
    super.onTransition(transition);
  }
}

// bloc events
class GetDocumentsFromCollection {
  final String path;

  GetDocumentsFromCollection(this.path);
}


class DBState {
  final int writeCount;

  DBState({this.writeCount});

  DBState.initialState() : writeCount = 0;
}
