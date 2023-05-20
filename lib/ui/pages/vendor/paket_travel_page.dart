import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelgo/ui/widgets/custom_button.dart';

import '../../../shared/theme.dart';

class PaketTravelPage extends StatefulWidget {
  const PaketTravelPage({super.key});

  @override
  State<PaketTravelPage> createState() => _PaketTravelPageState();
}

class _PaketTravelPageState extends State<PaketTravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: Column(
                  children: [
            SizedBox(
              height: 32,
            ),
            Text(
              "TRAVEL PACKAGES",
              style: blackTextStyle.copyWith(
                  fontWeight: semibold, fontSize: 24, letterSpacing: 3),
            ),
            SizedBox(height: 16,),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  shadowColor: warnaCoklat,
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Title", style: blackTextStyle.copyWith(fontWeight: semibold, fontSize: 20),),
                                SizedBox(height: 8,),
                                Text("Lokasi", style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: () {}, icon: Icon(Iconsax.edit),),
                                IconButton(onPressed: () {}, icon: Icon(Iconsax.trash),),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16,),
                        Container(height: 2, width: double.infinity, decoration: BoxDecoration(color: warnaAbu),),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Duration", style: titleFontStyle,),
                                Text("3 Days", style: blackTextStyle,)
                              ],
                            ),
                            Column(
                              children: [
                                Text("Departure", style: titleFontStyle,),
                                Text("2023-11-16", style: blackTextStyle,)
                              ],
                            ),
                            Column(
                              children: [
                                Text("Type", style: titleFontStyle,),
                                Text("Open Trip", style: blackTextStyle,)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
            }),
            CustomButton(text: "Add Package", textSize: 16, onPressed: () {})
                  ],
                ),
          )),
    );
  }

  TextStyle titleFontStyle = blackTextStyle.copyWith(fontWeight: semibold);
}
