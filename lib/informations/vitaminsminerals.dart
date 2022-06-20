// Vitamins and minerals are micronutrients required by the body to carry out a range of normal functions. However, these micronutrients are not produced in our bodies and must be derived from the food we eat.
// Vitamins are organic substances that are generally classified as either fat soluble or water soluble. Fat-soluble vitamins (vitamin A, vitamin D, vitamin E, and vitamin K) dissolve in fat and tend to accumulate in the body. Water-soluble vitamins (vitamin C and the B-complex vitamins, such as vitamin B6, vitamin B12, and folate) must dissolve in water before they can be absorbed by the body, and therefore cannot be stored. Any water-soluble vitamins unused by the body is primarily lost through urine.
// Minerals are inorganic elements present in soil and water, which are absorbed by plants or consumed by animals. While you’re likely familiar with calcium, sodium, and potassium, there is a range of other minerals, including trace minerals (e.g. copper, iodine, and zinc) needed in very small amounts.

import 'package:flutter/material.dart';

class VitaminsMineralsPage extends StatelessWidget {
  const VitaminsMineralsPage({Key? key}) : super(key: key);

  static const route = '/VitaminsMinerals/';
  static const routename = 'VitaminsMineralsPage';

  @override
  Widget build(BuildContext context) {
    print('${VitaminsMineralsPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
