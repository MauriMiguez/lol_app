import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    required this.length,
    required this.currentIndex,
    super.key,
  });

  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Dot(
            isSelected: index == currentIndex,
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    required this.isSelected,
    super.key,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSelected ? 16 : 10,
      height: isSelected ? 16 : 10,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFC89B3C),
          width: 2,
        ),
        color: isSelected ? const Color(0xFFC89B3C) : null,
        shape: BoxShape.circle,
      ),
    );
  }
}
