import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/widgets/my_search_delegate.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){showSearch(context: context, delegate: MySearchDelegate());},
      child: AppBar(
          titleSpacing: 0.0,
          title: Hero(
              tag: AppString.appBarTag,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(width: 20,),
                    Text(AppString.appBarHint),
                  ],
                ),
              )
          )
      ),
    );
  }
}