import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_cached_image.dart';
import 'package:my_suit/core/widgets/custom_text_field.dart';
import 'package:my_suit/features/category/data/model/category_model.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/home/ui/widget/suit_card.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String categoryTitle;
  final List<SuitModel> products;

  const CategoryDetailsScreen({
    super.key,
    required this.categoryTitle,
    required this.products,
  });

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  int selectedIndex = 0;
  late List<CategoryModel> tabs;
  late List<SuitModel> filteredProducts;

  final List<String> imageUrls = [
    'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',
    'https://m.media-amazon.com/images/I/51otI3krjlL._AC_.jpg',
    'https://www.justinmichaelemmanuel.com/wp-content/uploads/2023/10/casual-suits-for-men-886jin-1.jpg',
    'https://i.pinimg.com/736x/c7/5a/5d/c75a5d12c0811eecb3819819452a0150.jpg',
    'https://suits.ie/wp-content/uploads/2024/09/139615.jpg',
    'https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/Jackets/default/Summer/C25126_1.jpg',
  ];

  @override
  void initState() {
    super.initState();

    tabs = [
      CategoryModel(title: LocaleKeys.new_arrivals.tr(), image: imageUrls[0]),
      CategoryModel(title: LocaleKeys.classic.tr(), image: imageUrls[1]),
      CategoryModel(title: LocaleKeys.casual.tr(), image: imageUrls[2]),
      CategoryModel(title: LocaleKeys.formal.tr(), image: imageUrls[3]),
      CategoryModel(title: LocaleKeys.accessories.tr(), image: imageUrls[4]),
      CategoryModel(title: LocaleKeys.bestsellers.tr(), image: imageUrls[5]),
    ];

    filteredProducts = widget.products;
  }

  void _filterProducts(String selectedCategory) {
    setState(() {
      filteredProducts =
          widget.products
              .where(
                (product) => product.type.toLowerCase().contains(
                  selectedCategory.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.categoryTitle.tr(),
          style: Styles.font30W500.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: 16.height),

          /// Search
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppTextFormField(
                hintStyle: const TextStyle(color: Colors.black54),
                suffixIcon: const Icon(Icons.search),
                backgroundColor: Colors.grey[200],
                hintText: LocaleKeys.search_hint.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.search_validator.tr();
                  }
                  return null;
                },
              ),
            ),
          ),

          /// Tabs
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                separatorBuilder: (_, __) => 12.width,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return ChoiceChip(
                    avatarBorder: const CircleBorder(),
                    avatar: CustomCachedImage(
                      imageUrl: tabs[index].image,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    label: Text(
                      tabs[index].title,
                      style: Styles.font16W500.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: Colors.black,
                    backgroundColor: Colors.grey[200],
                    onSelected: (_) {
                      setState(() {
                        selectedIndex = index;
                        _filterProducts(tabs[index].title);
                      });
                    },
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(child: 16.height),

          /// Products
          filteredProducts.isEmpty
              ? SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      LocaleKeys.no_items_found.tr(),
                      style: Styles.font18W400,
                    ),
                  ),
                ),
              )
              : SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = filteredProducts[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 300),
                      columnCount: 1,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: SuitCard(suit: product, addToCart: true),
                        ),
                      ),
                    );
                  }, childCount: filteredProducts.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.58,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
