import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_suit/core/helpers/extensions.dart';
import 'package:my_suit/core/localization/locale_keys.dart';
import 'package:my_suit/core/theming/styles.dart';
import 'package:my_suit/core/widgets/custom_button.dart';
import 'package:my_suit/core/widgets/custom_cached_image.dart';
import 'package:my_suit/features/category/data/model/category_model.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const FilterBottomSheet(),
    );
  }

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(500, 2000);

  final Set<String> _selectedColors = <String>{};
  final Set<String> _selectedSizes = <String>{};
  final Set<String> _selectedAudience = <String>{};
  final Set<String> _selectedTransactionTypes = <String>{};
  final Set<String> _selectedCategories = <String>{};

  late final List<CategoryModel> _categories;

  // Constants -----------------------------------------------------------------

  static const List<String> _sizes = ['S', 'M', 'L', 'XL'];
  static const double _kSheetMaxHeightFactor = 0.8;

  static const List<String> _audienceTypes = ['male', 'child'];

  static const List<String> _transactionTypes = ['rent', 'sale'];

  static const Map<String, Color> _colors = {
    'أسود': Colors.black,
    'رمادي': Colors.grey,
    'كُحلي': Colors.blueGrey,
    'بيچ': Color(0xFFD7CCC8),
  };

  @override
  void initState() {
    super.initState();
    _categories = _buildCategories();
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight =
        MediaQuery.of(context).size.height * _kSheetMaxHeightFactor;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Material(
        color: Colors.white,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Handle(),
                24.0.height,
                Text(LocaleKeys.filter_serch.tr(), style: Styles.font20W600),
                24.0.height,
                _buildPriceSection(),
                24.0.height,
                _buildColorSection(),
                16.0.height,
                _buildSizeSection(),
                16.0.height,
                _buildAudienceSection(),
                16.0.height,
                _buildTransactionSection(),
                16.0.height,
                _buildCategorySection(),
                34.0.height,
                _buildApplyButton(),
                14.0.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  //  Sections
  // ---------------------------------------------------------------------------

  Widget _buildPriceSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.price.tr(), style: Styles.font16W600),
      RangeSlider(
        inactiveColor: Colors.grey,
        activeColor: Colors.black,
        values: _priceRange,
        min: 0,
        max: 5000,
        divisions: 50,
        labels: RangeLabels(
          _priceRange.start.round().toString(),
          _priceRange.end.round().toString(),
        ),
        onChanged: (values) => setState(() => _priceRange = values),
      ),
    ],
  );

  Widget _buildColorSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.select_color.tr(), style: Styles.font16W500),
      8.0.height,
      Wrap(
        spacing: 12,
        children:
            _colors.entries
                .map(
                  (e) => _buildChoiceChip(
                    id: e.key,
                    label: e.key,
                    selectedSet: _selectedColors,
                    background: e.value.withOpacity(0.2),
                    avatarColor: e.value,
                  ),
                )
                .toList(),
      ),
    ],
  );

  Widget _buildSizeSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.select_size.tr(), style: Styles.font16W500),
      8.0.height,
      Wrap(
        spacing: 12,
        children:
            _sizes
                .map(
                  (s) => _buildChoiceChip(
                    id: s,
                    label: s,
                    selectedSet: _selectedSizes,
                  ),
                )
                .toList(),
      ),
    ],
  );

  Widget _buildAudienceSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.audience.tr(), style: Styles.font16W500),
      8.0.height,
      Wrap(
        spacing: 12,
        children:
            _audienceTypes
                .map(
                  (type) => _buildChoiceChip(
                    id: type,
                    label: _getAudienceLabel(type),
                    selectedSet: _selectedAudience,
                  ),
                )
                .toList(),
      ),
    ],
  );

  Widget _buildTransactionSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.transaction.tr(), style: Styles.font16W500),
      8.0.height,
      Wrap(
        spacing: 12,
        children:
            _transactionTypes
                .map(
                  (t) => _buildChoiceChip(
                    id: t,
                    label: _getTransactionLabel(t),
                    selectedSet: _selectedTransactionTypes,
                  ),
                )
                .toList(),
      ),
    ],
  );

  Widget _buildCategorySection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.categories.tr(), style: Styles.font16W500),
      8.0.height,
      SizedBox(
        height: 70,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          separatorBuilder: (_, __) => 14.0.width,
          itemBuilder: (context, index) {
            final cat = _categories[index];
            final bool selected = _selectedCategories.contains(cat.title);
            return ChoiceChip(
              avatarBorder: const CircleBorder(),
              avatar: CustomCachedImage(
                imageUrl: cat.image,
                borderRadius: BorderRadius.circular(50),
              ),
              label: Text(
                cat.title,
                style: Styles.font16W500.copyWith(
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
              selected: selected,
              selectedColor: Colors.black,
              backgroundColor: Colors.grey[200],
              onSelected:
                  (_) => setState(() {
                    selected
                        ? _selectedCategories.remove(cat.title)
                        : _selectedCategories.add(cat.title);
                  }),
            );
          },
        ),
      ),
    ],
  );

  Widget _buildApplyButton() => CustomButton(
    text: LocaleKeys.confirm_filter.tr(),
    backgroundColor: CupertinoColors.black,
    textColor: Colors.white,
    onPressed: () => Navigator.of(context).pop(_buildResult()),
  );

  // ---------------------------------------------------------------------------
  //  Helpers
  // ---------------------------------------------------------------------------

  /// Choice chip widget that separates the "value" stored في الـ Set
  /// عن النص المعروض للمستخدم.
  Widget _buildChoiceChip({
    required String id,
    required String label,
    required Set<String> selectedSet,
    Color? background,
    Color? avatarColor,
  }) {
    final bool selected = selectedSet.contains(id);
    return ChoiceChip(
      label: Text(
        label,
        style: Styles.font16W500.copyWith(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
      selected: selected,
      selectedColor: Colors.black,
      backgroundColor: background ?? Colors.grey[200],
      avatar:
          avatarColor == null
              ? null
              : CircleAvatar(radius: 6, backgroundColor: avatarColor),
      onSelected:
          (_) => setState(() {
            selected ? selectedSet.remove(id) : selectedSet.add(id);
          }),
    );
  }

  Map<String, dynamic> _buildResult() => {
    'priceRange': _priceRange,
    'colors': _selectedColors.toList(),
    'sizes': _selectedSizes.toList(),
    'audience': _selectedAudience.toList(),
    'transactionTypes': _selectedTransactionTypes.toList(),
    'categories': _selectedCategories.toList(),
  };

  // ---------------------------------------------------------------------------
  //  Local helpers (labels)
  // ---------------------------------------------------------------------------

  String _getAudienceLabel(String key) {
    switch (key) {
      case 'male':
        return LocaleKeys.audience_male.tr();
      case 'child':
        return LocaleKeys.audience_child.tr();
      default:
        return key;
    }
  }

  String _getTransactionLabel(String key) {
    switch (key) {
      case 'rent':
        return LocaleKeys.transaction_rent.tr();
      case 'sale':
        return LocaleKeys.transaction_sale.tr();
      default:
        return key;
    }
  }

  // ---------------------------------------------------------------------------
  //  Dummy data
  // ---------------------------------------------------------------------------

  List<CategoryModel> _buildCategories() => [
    CategoryModel(
      title: LocaleKeys.new_arrivals.tr(),
      image:
          'https://i.pinimg.com/736x/e1/2d/07/e12d07981ec3276d384b9ad5ebef46c3.jpg',
    ),
    CategoryModel(
      title: LocaleKeys.classic.tr(),
      image: 'https://m.media-amazon.com/images/I/51otI3krjlL._AC_.jpg',
    ),
    CategoryModel(
      title: LocaleKeys.casual.tr(),
      image:
          'https://www.justinmichaelemmanuel.com/wp-content/uploads/2023/10/casual-suits-for-men-886jin-1.jpg',
    ),
    CategoryModel(
      title: LocaleKeys.formal.tr(),
      image:
          'https://i.pinimg.com/736x/c7/5a/5d/c75a5d12c0811eecb3819819452a0150.jpg',
    ),
    CategoryModel(
      title: LocaleKeys.accessories.tr(),
      image: 'https://suits.ie/wp-content/uploads/2024/09/139615.jpg',
    ),
    CategoryModel(
      title: LocaleKeys.bestsellers.tr(),
      image:
          'https://cdn.suitsupply.com/image/upload/ar_10:21,b_rgb:efefef,bo_200px_solid_rgb:efefef,c_pad,g_north,w_2600/b_rgb:efefef,c_lfill,g_north,dpr_1,w_768,h_922,f_auto,q_auto,fl_progressive/products/Jackets/default/Summer/C25126_1.jpg',
    ),
  ];
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 6,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
