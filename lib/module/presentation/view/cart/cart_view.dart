import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../core/helper/size_helper.dart';
import '../../../../core/theme/text_theme.dart';
import '../../widget/button_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cart",
          style: TextThemes.h4,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: SizeHelper.getWidth(context) * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery to home",
                        style:
                            TextThemes.h4.merge(TextStyle(color: Colors.white)),
                      ),
                      Text(
                        'Jl. Cempaka No. 1',
                        style: TextThemes.p.merge(
                          TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Iconify(
                    Mdi.chevron_right,
                    size: 45,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Order",
              style: TextThemes.h4,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                itemCount: 4,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/makanan-1.jpeg",
                        width: SizeHelper.getWidth(context) * 0.22,
                        height: SizeHelper.getWidth(context) * 0.22,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: SizeHelper.getWidth(context) * 0.65,
                      child: Column(
                        children: [
                          Text(
                            "Nasi Goreng Special Lvl Setan Neraka (sangat pedas)",
                            overflow: TextOverflow.ellipsis,
                            style: TextThemes.h5
                                .merge(TextStyle(fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                width: SizeHelper.getWidth(context) * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Iconify(
                                        Mdi.minus,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text("0"),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Iconify(
                                        Mdi.plus,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Rp. 15.000",
                                style: TextThemes.h5.merge(TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Total : Rp. 15.000",
              style: TextThemes.h4,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              text: "Checkout",
              width: SizeHelper.getWidth(context) * 0.9,
              height: 50,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
