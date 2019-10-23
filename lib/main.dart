import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unsplash/data/unsplash_api.dart';
import 'package:unsplash/middleware/app_middleware.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/presentation/search_page.dart';
import 'package:unsplash/reducers/reducer.dart';
import 'package:unsplash/services/http_service.dart';

void main() {
  final HttpService unsplashHttpService = HttpService('https://api.unsplash.com');
  final UnsplashApi unsplashApi = UnsplashApi(
      unsplashHttpService, '27dd39ff411a407c42f6ffc5f0b6cea8a8600f9cf57e1dcc75f24b5838b4efbd');
  final AppMiddleware middleware = AppMiddleware(unsplashApi);

  final StreamController<dynamic> actionController = StreamController<dynamic>.broadcast();
  final Store<AppState> store = Store<AppState>(
    (AppState state, dynamic action) {
      actionController.add(action);
      return reducer(state, action);
    },
    initialState: AppState.initialState(),
    middleware: middleware.items,
  );

  runApp(MyApp(
    store: store,
    actionsStream: actionController.stream,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.store, this.actionsStream}) : super(key: key);

  final Store<AppState> store;
  final Stream<dynamic> actionsStream;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ActionsDispatcher(
      actions: actionsStream,
      child: StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Unsplash Demo',
          theme: ThemeData.dark(),
          home: const SearchPage(),
        ),
      ),
    );
  }
}

class ActionsDispatcher extends InheritedWidget {
  const ActionsDispatcher({
    Key key,
    @required Widget child,
    @required this.actions,
  })  : assert(actions != null),
        assert(child != null),
        super(key: key, child: child);

  static ActionsDispatcher of(BuildContext context) {
    final ActionsDispatcher dispatcher = context.inheritFromWidgetOfExactType(ActionsDispatcher);
    return dispatcher;
  }

  final Stream<dynamic> actions;

  Stream<T> ofType<T>() => Observable<dynamic>(actions).whereType<T>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
