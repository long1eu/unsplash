// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

import 'dart:async';

import 'package:flutter/material.dart' hide showSearch, SearchDelegate;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unsplash/actions/actions.dart';
import 'package:unsplash/containers/images_container.dart';
import 'package:unsplash/containers/is_loading_container.dart';
import 'package:unsplash/main.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';
import 'package:unsplash/presentation/unsplash_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller;

  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (store == null) {
      store = StoreProvider.of<AppState>(context);
      store.dispatch(const GetRandomPhotos(10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return ImagesContainer(
          builder: (BuildContext context, List<UnsplashImage> images) {
            return Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  if (isLoading)
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final String result = await showSearch<String>(
                        context: context,
                        delegate: QuerySearchDelegate(
                          store: StoreProvider.of<AppState>(context),
                          dispatcher: ActionsDispatcher.of(context),
                          images: images,
                        ),
                      );

                      print('Result received. $result');
                    },
                  ),
                ],
              ),
              body: ImagesGrid(images: images),
            );
          },
        );
      },
    );
  }
}

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({Key key, @required this.images}) : super(key: key);

  final List<UnsplashImage> images;

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.longestSide / 8;
    final double landscapeSize = size * 1.4;
    final double portraitSize = size * 3;

    return StaggeredGridView.countBuilder(
      itemCount: images.length,
      crossAxisCount: 4,
      staggeredTileBuilder: (int i) {
        final UnsplashImage image = images[i];
        return StaggeredTile.extent(
          2,
          image.isLandscape ? landscapeSize : portraitSize,
        );
      },
      itemBuilder: (BuildContext context, int i) {
        final UnsplashImage image = images[i];

        return InkWell(
          child: Container(
            margin: const EdgeInsets.all(4.0),
            child: Material(
              type: MaterialType.card,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(image.urls.thumb),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              color: Color(int.parse(image.color.substring(1), radix: 16)).withOpacity(1.0),
            ),
          ),
          onTap: () {
            print(image.aspectRatio);
          },
        );
      },
    );
  }
}

class QuerySearchDelegate extends SearchDelegate<String> {
  QuerySearchDelegate({this.store, ActionsDispatcher dispatcher, this.images})
      : controller = StreamController<String>() {
    dispatcher.ofType<SetImages>().listen(_onNewResult);
    sub = Observable<String>(controller.stream)
        .distinct()
        .debounceTime(const Duration(milliseconds: 500))
        .listen(_onNewQuery);
  }

  final StreamController<String> controller;
  final Store<AppState> store;
  StreamSubscription<String> sub;
  List<UnsplashImage> images;
  bool isLoading = false;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.trim().isNotEmpty)
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ImagesGrid(images: images);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isNotEmpty) {
      controller.add(query.trim());

      if (isLoading) {
        return Container(
          width: double.infinity,
          child: const CircularProgressIndicator(),
          alignment: AlignmentDirectional.topCenter,
          margin: const EdgeInsets.all(16.0),
        );
      } else {
        return ImagesGrid(images: images);
      }
    } else {
      return ImagesGrid(images: images);
    }
  }

  void _onNewResult(SetImages event) {
    setState(() {
      isLoading = false;
      images = event.images;
    });
  }

  void _onNewQuery(String query) {
    isLoading = true;
    store.dispatch(SearchPhotos(query));
  }
}
