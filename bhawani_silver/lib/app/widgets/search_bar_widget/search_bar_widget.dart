import 'package:BhawaniSilver/app/widgets/search_bar_widget/my_search_delegate.dart';
import 'package:flutter/material.dart';
import '../../core/values/app_color.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showSearch(context: context, delegate: MySearchDelegate()),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: AppColor.lightBlack,
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text("Search Bhawani Silver",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.lightBlack, fontSize: 15)),
              const Spacer(),
              const Icon(
                Icons.mic,
                color: AppColor.lightBlack,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
