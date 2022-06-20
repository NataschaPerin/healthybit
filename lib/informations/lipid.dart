// In childhood, after the third year of life, and are to adolescence, 30 percent of daily intake should be provided by fats. The same is true for the adult who is physically active, while in the sedentary individual it should drop to 25%. In addition to quantity, it is necessary to take care of the quality of fats and thus choose the right ones: 1-Monounsaturated fats of mainly vegetable origin, and of which olive oil is particularly rich, should provide up to 20% of total calories; 2- Saturated fats (of mainly animal origin) should not exceed 7-10% of total calories; 3-Polyunsaturated fats provided mainly by seed oils, provide about 7% of total calories and provide two categories of good fats: Omega 3, found in 'fatty' fish (such as tuna) of which we should consume 0. 7-1.5 g per day and Omega 6 (requirement 4-6 g per day) found in seeds and nuts;

import 'package:flutter/material.dart';

class LipidPage extends StatelessWidget {
  const LipidPage({Key? key}) : super(key: key);

  static const route = '/Lipid/';
  static const routename = 'LipidPage';

  @override
  Widget build(BuildContext context) {
    print('${LipidPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations'),
      ),
    );
  }
}
