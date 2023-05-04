
import 'package:flutter/material.dart';

import '../../core/values/app_string.dart';

class MySearchDelegate extends SearchDelegate{

  final List<String> products = [
    'silver',
    'gold',
    'pen',
    'chain',
    'kada',
    'payal'
  ];

  final List<String> recentSearches = [
    'chain',
    'pen',
    'kada'
  ];

  @override
  String get searchFieldLabel => AppString.searchDelegateHint;

  @override
  TextStyle get searchFieldStyle => const TextStyle(fontSize: 18.0);


  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }


  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          if(query.isEmpty){
            close(context, null);
          }else{
            query = '';
          }
        },
      )
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final List<String> suggestions = query.isEmpty
        ? recentSearches
        : products
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> results = products
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(results[index]),
        );
      },
    );
  }
}