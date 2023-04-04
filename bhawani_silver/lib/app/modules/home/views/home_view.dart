import 'package:bhawani_silver/app/my_app_bar.dart';
import 'package:bhawani_silver/app/search_delegate/my_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   actions: [
      //     // TextButton(onPressed: (){
      //     //   AuthenticationHelper().signOut()
      //     //       .then((result){
      //     //     Get.offAllNamed(Routes.LOGIN);
      //     //     Get.snackbar("Activity", "Log out successfully");
      //     //   });
      //     // },style: TextButton.styleFrom(foregroundColor: Colors.white), child: const Text("LOG OUT"),),
      //
      //     IconButton(onPressed: (){
      //       showSearch(
      //           context: context,
      //           delegate: MySearchDelegate());
      //
      //     }, icon: const Icon(Icons.search))
      //   ],
      //   centerTitle: true,
      // ),

      body: Center(
        child: Column(
          children: [
            MyAppBar(key: key),
        Expanded(
          child: ListView.builder(
            itemCount: MySearchDelegate().products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(MySearchDelegate().products[index]),
              );
            },
          ),
        )
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller){
          return Theme(
            
            data: ThemeData(
              canvasColor: Colors.blueGrey
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              selectedItemColor: Colors.orange,
              items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account')
            ],
              onTap: (index){
                controller.changeTabIndex(index);
              },

            ),
          );
        },
      ),

    );
  }

}
