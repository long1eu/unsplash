// File created by
// Lung Razvan <long1eu>
// on 23/09/2019

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:unsplash/actions/actions.dart';
import 'package:unsplash/containers/images_container.dart';
import 'package:unsplash/containers/is_loading_container.dart';
import 'package:unsplash/models/app_state.dart';
import 'package:unsplash/models/unsplash_image.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              if (isLoading)
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(SearchPhotos(controller.text.trim()));
                      }
                    },
                  )
                ],
              ),
              Expanded(
                child: ImagesContainer(
                  builder: (BuildContext context, List<UnsplashImage> images) {
                    return ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int i) {
                        final UnsplashImage image = images[i];
                        return Card(
                          child: Image.network(image.urls.thumb),
                          color: Color(int.parse(image.color.substring(1),
                                  radix: 16))
                              .withOpacity(1.0),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
