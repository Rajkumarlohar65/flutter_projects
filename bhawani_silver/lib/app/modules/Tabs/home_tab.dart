import 'package:bhawani_silver/app/search_delegate/my_search_delegate.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: MySearchDelegate().products.length,
          itemBuilder: (context, int index) {
          return ListTile(
            leading: const Icon(Icons.online_prediction),
            title: Text(MySearchDelegate().products[index])
          );
      }),

      // Center(
      //   child: Text("Home"),
      //
      // ),
    );
  }
}
