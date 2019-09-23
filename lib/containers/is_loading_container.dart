// File created by
// Lung Razvan <long1eu>
// on 16/09/2019

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:unsplash/models/app_state.dart';

class IsLoadingContainer extends StatelessWidget {
  const IsLoadingContainer({Key key, this.builder}) : super(key: key);

  final ViewModelBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      builder: builder,
      converter: (Store<AppState> store) => store.state.isLoading,
    );
  }
}
