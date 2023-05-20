import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelgo/shared/theme.dart';
import 'package:travelgo/ui/pages/user/booking_page.dart';
import 'package:travelgo/ui/widgets/custom_back_button.dart';
import 'package:travelgo/ui/widgets/custom_button.dart';
import 'package:travelgo/ui/widgets/detail_book.dart';
import 'package:travelgo/ui/widgets/detail_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List imgList = [
    {"id": 1, "path": "assets/merapi.png"},
    {"id": 2, "path": "assets/merapii.png"},
    {"id": 3, "path": "assets/merapiii.png"},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: imgList
                        .map((item) => Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(item['path']),
                                      fit: BoxFit.cover)),
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      height: 500,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  SafeArea(
                    child: CustomBackButton(),
                  ),
                  SizedBox(
                      height: 470,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(child: buildIndicator()),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: 32,
                    top: defaultMargin),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trip",
                        style: blackTextStyle.copyWith(
                            fontWeight: bold, fontSize: 32),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Location",
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          DetailItem(
                            title: "Featured Ticket",
                            detail: "Snorkeling",
                            iconUrl: Icon(Iconsax.ticket),
                          ),
                          DetailItem(
                            title: "Language",
                            detail: "Indonesia",
                            iconUrl: Icon(Iconsax.messages),
                          ),
                          DetailItem(
                            title: "Foods",
                            detail: "Bali Foods",
                            iconUrl: Icon(Iconsax.shop),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "About",
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: blackTextStyle,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: warnaCoklat),
                            borderRadius: BorderRadius.circular(defaultRadius)),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Text(
                                "Travel Vendor",
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semibold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Namanya",
                                style: greyTextStyle.copyWith(
                                    fontWeight: semibold),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              DetailBook(title: "Departure", detail: "tanggal"),
                              DetailBook(title: "Duration", detail: "durasi"),
                              DetailBook(title: "Type", detail: "gatau apaan"),
                              DetailBook(title: "Price", detail: "5M"),
                              SizedBox(
                                height: 24,
                              ),
                              CustomButton(
                                  text: "Join Now",
                                  textSize: 16,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(child: BookingPage(), type: PageTransitionType.fade, duration: Duration(milliseconds: 500)));
                                  })
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: currentIndex,
        count: imgList.length,
        effect: ScrollingDotsEffect(
            dotColor: warnaBg.withOpacity(0.5),
            activeDotColor: warnaBg,
            dotWidth: 15,
            dotHeight: 5),
      );
}
