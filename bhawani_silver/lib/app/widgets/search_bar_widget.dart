import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/widgets/icon_button_widget/more_option_button_widget.dart';
import 'package:flutter/material.dart';

import '../modules/home/my_search_delegate.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const SearchBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: MySearchDelegate());
      },
      child: AppBar(
        titleSpacing: 0.0,
        title: Hero(
            tag: AppString.appBarTag,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search),
                ),
                Expanded(child: Text(AppString.appBarHint)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MoreOptionButtonWidget(),
                )
              ],
            )),
      ),
    );
  }
}
