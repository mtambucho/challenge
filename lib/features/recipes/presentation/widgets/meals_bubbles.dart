import 'package:challenge/constants/colors.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:flutter/material.dart';

class MealsBubbles extends StatelessWidget {
  const MealsBubbles(
      {super.key,
      required this.onSelected,
      required this.selected,
      required this.canChangeCategory});
  final void Function(MealType) onSelected;
  final MealType selected;
  final bool canChangeCategory;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          MealType.values.length,
          (index) => _Item(
            size: width / MealType.values.length,
            image: MealType.values[index].imageURL(),
            text: MealType.values[index].toString(),
            onTap: canChangeCategory
                ? () => onSelected.call(MealType.values[index])
                : null,
            isSelected: selected.index == index,
          ),
        ));
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.image,
    required this.text,
    required this.onTap,
    required this.size,
    required this.isSelected,
  });
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                // width: size - 16,
                height: size - 16,
                fit: BoxFit.fill,
                color: isSelected ? null : AppColors.darkGrey,
              ),
              Text(text,
                  style: TextStyle(
                    color: isSelected ? null : AppColors.darkGrey,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 11,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
