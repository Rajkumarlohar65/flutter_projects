import 'package:BhawaniSilver/app/modules/overview_of_product/views/overview_of_product_view_android.dart';
import 'package:BhawaniSilver/app/modules/overview_of_product/views/overview_of_product_view_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/overview_of_product_controller.dart';

class OverviewOfProductView extends GetView<OverviewOfProductController> {
  const OverviewOfProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const OverviewOfProductViewWeb() : const OverviewOfProductViewAndroid();
  }
}
