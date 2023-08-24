import 'package:BhawaniSilver/app/core/values/app_color.dart';
import 'package:BhawaniSilver/app/data/model/address.dart';
import 'package:BhawaniSilver/app/modules/select_address/controllers/select_address_controller.dart';
import 'package:BhawaniSilver/app/modules/select_address/views/select_address_view_android.dart';
import 'package:BhawaniSilver/app/modules/select_address/views/select_address_view_web.dart';
import 'package:BhawaniSilver/app/routes/app_pages.dart';
import 'package:BhawaniSilver/app/widgets/card_widget/address_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectAddressView extends GetView<SelectAddressController> {
  const SelectAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const SelectAddressViewWeb() : const SelectAddressViewAndroid();
  }
}
