import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travelgo/ui/pages/user/user_detail_page.dart';

import '../../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Text(
                  "PACKAGES",
                  style: blackTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 24, letterSpacing: 3),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(defaultMargin),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: DetailPage(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration: Duration(milliseconds: 400),
                                        reverseDuration:
                                            Duration(milliseconds: 400)));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/merapi.png'),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(
                                              defaultRadius))),
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius),
                                        gradient: LinearGradient(
                                            end: Alignment.topCenter,
                                            begin: Alignment.bottomCenter,
                                            colors: [
                                              warnaHitam.withOpacity(0.5),
                                              Colors.transparent
                                            ])),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "TRIP",
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 24),
                                        ),
                                        Text(
                                          "LOCATION",
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 36,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Type",
                                              style: whiteTextStyle,
                                            ),
                                            Text(
                                              "Price",
                                              style: whiteTextStyle,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
