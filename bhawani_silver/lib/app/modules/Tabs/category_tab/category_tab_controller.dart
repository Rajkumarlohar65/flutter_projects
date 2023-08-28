import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryTabController extends GetxController {
  List<Map<String, dynamic>> categories = [];
  Rx<Map<String, dynamic>> selectedCategory = Rx<Map<String, dynamic>>({});

  Future<void> loadCategories() async {
    try {
      final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('categories').get();

      categories = querySnapshot.docs
          .map<Map<String, dynamic>>((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      update();
    } catch (error) {
      print("Error loading categories: $error");
    }
  }

  void selectCategory(Map<String, dynamic> category) {
    selectedCategory.value = category;
  }

}
