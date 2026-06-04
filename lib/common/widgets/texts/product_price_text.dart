import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currentSign = '\$',
    required this.priceText,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currentSign, priceText;
  final bool isLarge, lineThrough;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text( 
      currentSign + priceText, 
      maxLines: 1, 
      overflow: TextOverflow.ellipsis, 
      style: isLarge 
      ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
      : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}
