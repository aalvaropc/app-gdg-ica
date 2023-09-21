import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gdgica/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();
  
  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  
  HomeBloc._internal() : super(UnHomeState()); // Pasa el estado inicial al constructor de la superclase

  // @override
  HomeState get initialState => UnHomeState();

  // @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield UnHomeState();
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
      // yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      // yield currentState;
      yield state;
    }
  }
}
