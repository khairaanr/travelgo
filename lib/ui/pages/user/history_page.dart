import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelgo/shared/theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: defaultMargin),
        child: Column(
          children: [
            Text(
              "HISTORY",
              style: blackTextStyle.copyWith(
                  fontWeight: semibold, fontSize: 24, letterSpacing: 3),
            ),
            SizedBox(height: 32,),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: warnaCoklat), borderRadius: BorderRadius.circular(defaultRadius)
                        ),
                        child: ListTile(
                          title: Text("Success", style: blackTextStyle.copyWith(fontWeight: semibold, fontSize: 16),),
                          subtitle: Text("Tanggal(?)", style: greyTextStyle.copyWith(fontWeight: medium),),
                          trailing: Icon(Iconsax.tick_circle, color: Colors.green,),
                        ),
                      ),
                      SizedBox(height: 12,)
                    ],
                  );
                })
          ],
        ),
      )),
    );
  }
}
