import 'package:bhawani_silver/app/core/theme/app_theme.dart';
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

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Theme(
      data: isDarkMode ? AppTheme.darkTheme() : AppTheme.lightTheme(),
      child: AppBar(
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
      ),
    );
  }
}
