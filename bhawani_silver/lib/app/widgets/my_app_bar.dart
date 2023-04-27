import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/widgets/my_search_delegate.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MyAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 0.0,
        title: Hero(
            tag: AppString.appBarTag,
            child: TextField(
                decoration: const InputDecoration(
                  hintText: AppString.appBarHint,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  prefixIcon: Icon(Icons.search),
                ),
                readOnly: true,
                onTap: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                }
                )
        )
    );
  }
}
