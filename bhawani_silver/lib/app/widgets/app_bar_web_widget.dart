import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/core/values/app_string.dart';
import 'package:BhawaniSilver/app/widgets/search_bar_widget/my_search_delegate.dart';
import 'package:flutter/material.dart';

class AppBarWebWidget extends StatelessWidget {
  final Function(int) onTabSelected;  // Callback function to update tab index

  const AppBarWebWidget({super.key, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColor.blueGrey,
      child: Row(
        children: [
          InkWell(
            onTap: ()=> onTabSelected(0),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home, color: AppColor.whiteColor,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(AppString.splashAppName, style: TextStyle(color: AppColor.whiteColor),),

                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => showSearch(context: context, delegate: MySearchDelegate()),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(5), // Adjust the radius as needed
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                                    ?.copyWith(
                                    color: AppColor.lightBlack, fontSize: 15),),

                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.mic,
                              color: AppColor.lightBlack,
                              size: 25,
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () =>  onTabSelected(1),
                    child: const Row(
                      children: [
                        Icon(Icons.category_outlined, color: AppColor.whiteColor,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => onTabSelected(2),
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_bag, color: AppColor.whiteColor,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => onTabSelected(3),
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_cart, color: AppColor.whiteColor,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: ()=> onTabSelected(4),
                      child: const Icon(Icons.account_circle, color: AppColor.whiteColor,)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
