import 'package:bhawani_silver/app/core/values/app_string.dart';
import 'package:bhawani_silver/app/widgets/icon_button_widget/more_option_button_widget.dart';
import 'package:bhawani_silver/app/widgets/icon_button_widget/search_bar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      title: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                AppString.splashAppName,
                style: GoogleFonts.alike(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const Hero(tag: AppString.appBarTag, child: SearchBarButtonWidget()),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: MoreOptionButtonWidget()),
        ],
      ),
    );
  }
}
