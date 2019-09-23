import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:unsplash/data/unsplash_api.dart';
import 'package:unsplash/middleware/app_middleware.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/presentation/search_page.dart';
import 'package:unsplash/reducers/reducer.dart';
import 'package:unsplash/services/http_service.dart';

void main() {
  final HttpService unsplashHttpService =
      HttpService('https://api.unsplash.com');
  final UnsplashApi unsplashApi = UnsplashApi(unsplashHttpService,
      '27dd39ff411a407c42f6ffc5f0b6cea8a8600f9cf57e1dcc75f24b5838b4efbd');
  final AppMiddleware middleware = AppMiddleware(unsplashApi);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: middleware.items,
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.store}) : super(key: key);

  final Store<AppState> store;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Unsplash Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchPage(),
      ),
    );
  }
}
