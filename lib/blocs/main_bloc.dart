import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firestore_db_editor/state/app_state.dart';

class MainBloc extends Bloc<dynamic, AppState> {
  @override
  get initialState => AppState.initialState();
  BehaviorSubject currentPage = BehaviorSubject<int>(seedValue: 0);

  @override
  Stream<AppState> mapEventToState(AppState state, event) async* {
    if (event is ChangeToPage) {
      yield state.copyWith();
    }
  }
}

class ChangeToPage {
  final int page;

  ChangeToPage(this.page);
}

class AppState {
  AppState();

  AppState.initialState();

  AppState copyWith() {}
}
