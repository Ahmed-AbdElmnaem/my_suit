import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/widgets/custom_app_bar.dart';
import 'package:my_suit/core/widgets/custom_text_field.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/home/ui/widget/category_item.dart';
import 'package:my_suit/features/home/ui/widget/custom_carousel_slider.dart';
import 'package:my_suit/features/home/ui/widget/suit_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<SuitModel> suits = [
    SuitModel(
      id: '1',
      name: '2-Piece Suit',
      image:
          'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',
      brand: 'HUGO BOSS',
      type: '2-Piece Suit Set',
      price: 299,
    ),
    SuitModel(
      id: '2',
      name: '2-Piece Suit',
      image:
          'https://i.pinimg.com/736x/bf/e9/28/bfe928a68fd3fee348909f1bdf6d5419.jpg',
      brand: 'ARMANI',
      type: '2-Piece Suit Set',
      price: 259,
    ),
    SuitModel(
      id: '3',
      name: '3-Piece Suit',
      image:
          'https://i.pinimg.com/736x/79/a3/ce/79a3ceef3a190b65563e46f17cdc6145.jpg',
      brand: 'ZARA',
      type: '3-Piece Suit Set',
      price: 349,
    ),
    SuitModel(
      id: '4',
      name: '3-Piece Suit',
      image:
          'https://i.pinimg.com/736x/5d/36/ab/5d36ab81838f9debbbc6035b44327e1c.jpg',
      brand: 'Ralph Lauren',
      type: '3-Piece Suit Set',
      price: 399,
    ),
  ];

  final List<Map<String, String>> categories = [
    {
      'title': 'New Arrivals',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQwl4aEtU66RY_2sfsGAVgG2WSRRFvXf2ttw&s',
    },
    {
      'title': 'Casual',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXlFpIPKdx4oHJrYELuUWXe8pKd1-t-CbvtvbTgpssL8gSDW5YOmgWT0YsD6sOxjy6xMQ&usqp=CAU',
    },
    {
      'title': 'Bestsellers',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEomcYxmmRSnX1lvvD7LsdO_tIjJ9MIcBwTA924ASuizMPH_frrWwiF7q9Ju9SFSdJhLc&usqp=CAU',
    },
    {
      'title': 'Formal',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXlFpIPKdx4oHJrYELuUWXe8pKd1-t-CbvtvbTgpssL8gSDW5YOmgWT0YsD6sOxjy6xMQ&usqp=CAU',
    },
    {
      'title': 'Accessories',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXlFpIPKdx4oHJrYELuUWXe8pKd1-t-CbvtvbTgpssL8gSDW5YOmgWT0YsD6sOxjy6xMQ&usqp=CAU',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onMenuTap: () {}, onCartTap: () {}),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
            SliverToBoxAdapter(child: 20.0.height),
            SliverToBoxAdapter(
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
            SliverToBoxAdapter(child: 25.0.height),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 90,
                child: AnimationLimiter(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
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
                              onTap: () {},
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: 20.0.height),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final suit = suits[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 400),
                  columnCount: 2,
                  child: ScaleAnimation(
                    child: FadeInAnimation(child: SuitCard(suit: suit)),
                  ),
                );
              }, childCount: suits.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
