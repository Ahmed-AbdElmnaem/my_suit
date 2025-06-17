import 'package:flutter/material.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/home/ui/widget/suit_card.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: Styles.font30W500.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body:
          suits.isEmpty
              ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your Wishlist is Empty',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  itemCount: suits.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final suit = suits[index];
                    return SuitCard(suit: suit);
                  },
                ),
              ),
    );
  }
}
