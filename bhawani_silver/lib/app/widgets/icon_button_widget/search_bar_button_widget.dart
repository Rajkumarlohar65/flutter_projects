import 'package:flutter/material.dart';
import '../my_search_delegate.dart';

class SearchBarButtonWidget extends StatelessWidget {
  const SearchBarButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: MySearchDelegate());
      },
      child: const Icon(Icons.search),
    );
  }
}
