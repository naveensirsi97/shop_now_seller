import 'package:emart_seller_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductsDetail extends StatelessWidget {
  const ProductsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: boldText(text: 'Product Title', size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              aspectRatio: 16 / 9,
              autoPlay: true,
              height: 280,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/images/emartlogo.png',
                  //  data['p_imgs'][index],
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                );
              },
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: 'Product title', size: 16.0),
                  // Text(
                  //   title!,
                  //   style:
                  //       const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  // ),
                  Row(
                    children: [
                      boldText(
                          text: 'Category', color: Colors.grey, size: 16.0),
                      20.widthBox,
                      normalText(
                          text: 'Subcategory', color: Colors.grey, size: 16.0),
                    ],
                  ),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    // value: double.parse(data['p_rating']),
                    value: 3.0,
                    onRatingUpdate: (value) {},
                    count: 5,
                    maxRating: 5,
                    normalColor: Colors.blueGrey,
                    selectionColor: Colors.amber,
                    size: 25,
                    //  stepInt: true,false,
                  ),
                  10.heightBox,
                  boldText(text: '\$300.0', size: 18.0),
                  // Text(
                  //   '${data['p_price']}'.numCurrency,
                  //   style: const TextStyle(
                  //       fontWeight: FontWeight.w700,
                  //       fontSize: 16,
                  //       color: redColor),
                  // ),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Color:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            60.widthBox,
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    //  .color(Color(data['p_colors'][index]).withOpacity(1.0))
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make()
                                    .onTap(() {}),
                              ),
                            )
                          ],
                        ),
                        20.heightBox,
                        Row(
                          children: [
                            const Text(
                              'Quantity:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            50.widthBox,
                            const Text(
                              '20 items',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  20.heightBox,
                  boldText(text: 'Description'),
                  10.heightBox,
                  normalText(text: 'Description of this item ')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
