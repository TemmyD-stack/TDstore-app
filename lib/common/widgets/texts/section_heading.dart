import 'package:flutter/material.dart';

class TSectionHeader extends StatelessWidget {
  const TSectionHeader({
    super.key,
    this.textColor,
    this.showActionButton = true,
    this.onPressed,
    required this.title,
    this.btnTitle = "View All",
  
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, btnTitle;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(btnTitle))
      ],
    );
  }
}

