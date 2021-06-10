import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/custom_bordered_text_field.dart';
import 'package:takasburada/widgets/custom_chip.dart';
import 'package:takasburada/widgets/custom_label.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: containerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBorderedTextField(hint: "search"),
          SizedBox(
            height: containerPadding,
          ),
          CustomLabel(label: "most searched"),
          SizedBox(
            height: containerPadding,
          ),
          SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Container(
              height: chipHeight * 2 + containerPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: chipHeight,
                    child: Wrap(
                      spacing: containerPadding,
                      children: mostSearchedProducts
                          .where(
                            (mostSearchedProduct) =>
                                mostSearchedProducts
                                        .indexOf(mostSearchedProduct) %
                                    2 ==
                                0,
                          )
                          .toList()
                          .map(
                            (mostSearchedProduct) => CustomChip(
                                text: mostSearchedProduct, onTap: () {}),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: containerPadding,
                  ),
                  SizedBox(
                    height: chipHeight,
                    child: Wrap(
                      spacing: containerPadding,
                      children: mostSearchedProducts
                          .where(
                            (mostSearchedProduct) =>
                                mostSearchedProducts
                                        .indexOf(mostSearchedProduct) %
                                    2 ==
                                1,
                          )
                          .toList()
                          .map(
                            (mostSearchedProduct) => CustomChip(
                                text: mostSearchedProduct, onTap: () {}),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> mostSearchedProducts = [
  "iphone 11",
  "arctis 1",
  "playstation 4",
  "mi 10t pro",
  "pixel 5",
  "xbox one x",
];
