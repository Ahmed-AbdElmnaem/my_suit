import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_text_field.dart';
import 'package:my_suit/features/category/data/model/category_model.dart';
import 'package:my_suit/features/category/ui/widgets/custom_card_categroy.dart';

import '../../../../core/localization/locale_keys.dart' show LocaleKeys;

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<String> imageUrls = [
    'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',
    'https://m.media-amazon.com/images/I/51otI3krjlL._AC_.jpg',
    'https://www.justinmichaelemmanuel.com/wp-content/uploads/2023/10/casual-suits-for-men-886jin-1.jpg',
    'https://i.pinimg.com/736x/c7/5a/5d/c75a5d12c0811eecb3819819452a0150.jpg',
    'https://suits.ie/wp-content/uploads/2024/09/139615.jpg',
    'https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/Jackets/default/Summer/C25126_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(title: LocaleKeys.new_arrivals.tr(), image: imageUrls[0]),
      CategoryModel(title: LocaleKeys.classic.tr(), image: imageUrls[1]),
      CategoryModel(title: LocaleKeys.casual.tr(), image: imageUrls[2]),
      CategoryModel(title: LocaleKeys.formal.tr(), image: imageUrls[3]),
      CategoryModel(title: LocaleKeys.accessories.tr(), image: imageUrls[4]),
      CategoryModel(title: LocaleKeys.bestsellers.tr(), image: imageUrls[5]),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          LocaleKeys.categories.tr(),
          style: Styles.font30W500.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppTextFormField(
                hintStyle: const TextStyle(color: Colors.black54),
                suffixIcon: const Icon(Icons.search),
                backgroundColor: Colors.grey[300],
                hintText: 'Search for suits',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a search term';
                  }
                  return null;
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final cat = categories[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: 2,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            Routes.categoryDetails,
                            arguments: {'title': cat.title},
                          );
                        },
                        child: CustomCardCategroy(cat: cat),
                      ),
                    ),
                  ),
                );
              }, childCount: categories.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
