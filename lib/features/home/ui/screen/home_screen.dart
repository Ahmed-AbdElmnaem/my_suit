import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/constance/constance.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/routing/routes.dart';
import 'package:my_suit/core/widgets/custom_app_bar.dart';
import 'package:my_suit/core/widgets/custom_text_field.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/home/ui/widget/category_item.dart';
import 'package:my_suit/features/home/ui/widget/custom_carousel_slider.dart';
import 'package:my_suit/features/home/ui/widget/custom_drawer.dart';
import 'package:my_suit/features/home/ui/widget/custom_fliter_bottom_sheet.dart';
import 'package:my_suit/features/home/ui/widget/suit_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<SuitModel> suits = [
    SuitModel(
      id: '1',
      name: '2-Piece Suit',
      image:
          'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',
      brand: 'HUGO BOSS',
      type: '2-Piece Suit Set',
      price: 6000,
      availableSizes: ['S', 'M', 'L', 'XL'],
      availableColors: [Colors.black, Colors.grey, Colors.blueGrey],
      isFavorite: false,
    ),
    SuitModel(
      id: '2',
      name: '2-Piece Suit',
      image:
          'https://i.pinimg.com/736x/bf/e9/28/bfe928a68fd3fee348909f1bdf6d5419.jpg',
      brand: 'ARMANI',
      type: '2-Piece Suit Set',
      price: 3750,
      availableSizes: ['S', 'M', 'L', 'XL'],
      availableColors: [Colors.black, Colors.grey, Colors.blueGrey],
      isFavorite: true,
    ),

    SuitModel(
      id: '3',
      name: '3-Piece Suit',
      image:
          'https://i.pinimg.com/736x/79/a3/ce/79a3ceef3a190b65563e46f17cdc6145.jpg',
      brand: 'ZARA',
      type: '3-Piece Suit Set',
      price: 4250,
      availableSizes: ['S', 'M', 'L', 'XL'],
      availableColors: [Colors.black, Colors.grey, Colors.blueGrey],
      isFavorite: false,
    ),

    SuitModel(
      id: '4',
      name: '3-Piece Suit',
      image:
          'https://i.pinimg.com/736x/5d/36/ab/5d36ab81838f9debbbc6035b44327e1c.jpg',
      brand: 'Ralph Lauren',
      type: '3-Piece Suit Set',
      price: 2500,
      availableSizes: ['S', 'M', 'L', 'XL'],
      availableColors: [Colors.black, Colors.grey, Colors.blueGrey],
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': LocaleKeys.new_arrivals.tr(),
        'image':
            'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',
        'products': suits, // كل المنتجات الجديدة
      },
      {
        'title': LocaleKeys.classic.tr(),
        'image': 'https://m.media-amazon.com/images/I/51otI3krjlL._AC_.jpg',
        'products': suits.where((suit) => suit.type.contains('2')).toList(),
      },
      {
        'title': LocaleKeys.casual.tr(),
        'image':
            'https://www.justinmichaelemmanuel.com/wp-content/uploads/2023/10/casual-suits-for-men-886jin-1.jpg',
        'products': suits.where((suit) => suit.brand == 'ZARA').toList(),
      },
      {
        'title': LocaleKeys.formal.tr(),
        'image':
            'https://i.pinimg.com/736x/c7/5a/5d/c75a5d12c0811eecb3819819452a0150.jpg',
        'products': suits.where((suit) => suit.type.contains('3')).toList(),
      },
      {
        'title': LocaleKeys.accessories.tr(),
        'image': 'https://suits.ie/wp-content/uploads/2024/09/139615.jpg',
        'products': [...suits.where((suit) => suit.type.contains('4'))],
      },
      {
        'title': LocaleKeys.bestsellers.tr(),
        'image':
            'https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/Jackets/default/Summer/C25126_1.jpg',
        'products': suits.take(2).toList(),
      },
    ];

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          onNavigate: (route) {
            Navigator.of(context).pushNamed(route);
          },
        ),
        appBar: CustomAppBar(
          onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black,
                        Colors.black87,
                        Colors.black54,
                        Colors.black12,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.0.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: AppTextFormField(
                          hintStyle: const TextStyle(color: Colors.black54),
                          backgroundColor: Colors.grey[200],
                          hintText: LocaleKeys.search_hint.tr(),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => const FilterBottomSheet(),
                              );
                            },
                            child: Image.asset(Constance.imageFilter),
                          ),
                          suffixIcon: const Icon(Icons.search),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.search_validator.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                      25.0.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CustomCarouselSlider(
                              imageUrls: [
                                'https://cdn.shopify.com/s/files/1/0018/2697/9901/files/WEBSITE_BANNERS_4_79b6d392-e279-44db-89d6-33884de2f1ab.png?v=1583338680',
                                'https://www.bestmenswear.com/Images/Debs/website/2024/DebsBanner24-Mobile-ViewSuits2.jpg',
                                'https://pbs.twimg.com/media/GGi5_VxWkAAsClE.jpg',
                              ],
                              onTap: (index) {
                                debugPrint("Clicked on image $index");
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(child: 30.0.height),

              /// Categories Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 100,
                    child: AnimationLimiter(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => 16.0.width,
                        itemBuilder: (_, index) {
                          final cat = categories[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: CategoryItem(
                                  title: cat['title']!,
                                  image: cat['image']!,
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.categoryDetails,
                                      arguments: {
                                        'title': cat['title'],
                                        'products': cat['products'],
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: 30.0.height),
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final suit = suits[index];
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 400),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9.0 / 2,
                          ),
                          child: SuitCard(suit: suit, addToCart: false),
                        ),
                      ),
                    ),
                  );
                }, childCount: suits.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
