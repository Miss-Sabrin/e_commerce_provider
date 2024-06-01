import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchPlaceholder extends StatelessWidget {
  const SearchPlaceholder(
      {super.key, required this.searchItemRouter, this.placeHolderTxt});
  final String? placeHolderTxt;
  final VoidCallback? searchItemRouter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        searchItemRouter!();
        // print('tapped');
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
              // style: BorderStyle.none,
              color: Theme.of(context).dividerColor,
              width: 0.3),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              const Gap(10),
              Text(
                placeHolderTxt ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey.shade500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
