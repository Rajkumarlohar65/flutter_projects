import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/modules/Tabs/category_tab/category_tab_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTab extends GetView<CategoryTabController> {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadCategories();

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: FutureBuilder(
        future: controller.loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading categories'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return GestureDetector(
                  onTap: () {
                    controller.selectCategory(category);
                  },
                  child: Card(
                    color: AppColor.backgroundColor,
                    elevation: 1, // Adjust the elevation as needed
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                    ),
                    margin: const EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: CachedNetworkImage(
                        imageUrl: category['url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
