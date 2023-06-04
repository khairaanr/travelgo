import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travelgo/models/user_model.dart';
import 'package:travelgo/services/user_service.dart';
import 'package:travelgo/shared/api_response.dart';
import 'package:travelgo/shared/theme.dart';
import 'package:travelgo/ui/pages/select_role_page.dart';
import 'package:travelgo/ui/pages/user/payment_page.dart';
import 'package:travelgo/ui/widgets/custom_button.dart';
import 'package:travelgo/ui/widgets/custom_text_form_field.dart';
import 'package:travelgo/ui/widgets/detail_book.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  User? user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    ApiResponse res = await getDetailUser();
    if (res.error == null) {
      setState(() {
        user = res.data as User;
      });
    } else if (res.error == "Unauthorized") {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SelectRolePage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${res.error}")));
    }
  }

  var nameInput = TextEditingController();
  var nikInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List listGoing = [
      {"name": "sjf", "nik": 1234567}
    ];
    print(user?.name);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Iconsax.arrow_left_2)),
        title: Text(
          "Book Package",
          style: whiteTextStyle.copyWith(
              fontWeight: semibold, fontSize: 20, letterSpacing: 3),
        ),
        backgroundColor: warnaCoklat,
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultMargin),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Members",
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semibold),
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(defaultRadius))),
                                    title: Text(
                                      "Add member",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: bold, fontSize: 20),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          CustomTextFormField(
                                            title: "Name",
                                            hintText: "Enter name",
                                            controller: nameInput,
                                          ),
                                          CustomTextFormField(
                                            title: "NIK",
                                            hintText: "Enter NIK",
                                            controller: nikInput,
                                          ),
                                          CustomButton(
                                              text: "Add",
                                              textSize: 16,
                                              onPressed: () => setState(() {
                                                    listGoing.add({
                                                      'name': nameInput.text,
                                                      'nik': nikInput.text
                                                    });
                                                    Navigator.of(context).pop();
                                                    nameInput.clear();
                                                    nikInput.clear();
                                                  })),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: brownTextStyle.copyWith(
                                                    fontWeight: medium,
                                                    fontSize: 16),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(Iconsax.add))
                    ],
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listGoing.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: warnaAbu,
                          child: Text(
                            listGoing[index]['name'][0],
                            style: blackTextStyle,
                          ),
                        ),
                        title: Text(
                          listGoing[index]['name'],
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                        subtitle: Text(
                          "NIK : ${listGoing[index]['nik']}",
                          style: greyTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                listGoing.removeAt(index);
                              });
                            },
                            icon: Icon(Iconsax.trash)),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.all(defaultMargin),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: warnaCoklat),
                        borderRadius: BorderRadius.circular(defaultRadius)),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Text(
                            "Checkout Information",
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: semibold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Nama vendor",
                            style: greyTextStyle.copyWith(fontWeight: semibold),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          DetailBook(
                              title: "Members",
                              detail: "${listGoing.length} person"),
                          DetailBook(
                              title: "Trip Price", detail: "xxxxx / pax"),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(color: warnaAbu),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          DetailBook(title: "Total", detail: "xxxxx"),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(color: warnaAbu),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Payment Instruction",
                            style: blackTextStyle.copyWith(
                                fontWeight: bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Please complete your payment before continue the wonderful trip.",
                            style: greyTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Iconsax.card),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama vendor",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "8808-1001-038928",
                                    style: brownTextStyle.copyWith(
                                        fontSize: 16, fontWeight: medium),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                              text: "Payment",
                              textSize: 16,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: PaymentPage(),
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 500)));
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
