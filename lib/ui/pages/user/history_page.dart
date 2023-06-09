import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:travelgo/services/history_service.dart';
import 'package:travelgo/services/user_service.dart';
import 'package:travelgo/shared/theme.dart';

import '../../../models/history_model.dart';

class HistoryPage extends StatefulWidget {
  // final String userId;
  const HistoryPage({
    super.key,
    // required this.
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<List<History>> _getHistory() async {
    int userid = await getUserId();
    return getHistory(userid);
  }

  @override
  Widget build(BuildContext context) {
    // String userId = widget.userId;
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
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: FutureBuilder<List<History>>(
                future: _getHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: warnaCoklat,
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Empty"),
                    );
                  }

                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: warnaCoklat),
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius)),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      snapshot.data![index].transactionStatus,
                                      style: blackTextStyle.copyWith(
                                          fontWeight: semibold, fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      DateFormat.yMMMMd().add_jm().format(
                                          snapshot.data![index].updatedAt),
                                      style: greyTextStyle.copyWith(
                                          fontWeight: medium),
                                    ),
                                    trailing: snapshot.data![index]
                                                .transactionStatus ==
                                            "SUCCESS"
                                        ? Icon(
                                            Iconsax.tick_circle,
                                            color: Colors.green,
                                          )
                                        : snapshot.data![index]
                                                    .transactionStatus ==
                                                "PENDING"
                                            ? Icon(
                                                Iconsax.clock,
                                                color: Colors.orange,
                                              )
                                            : Icon(
                                                Iconsax.close_circle,
                                                color: Colors.red,
                                              ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "IDR ${NumberFormat('#,##0', 'en_US').format(snapshot.data![index].transactionTotal)}",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 14, fontWeight: semibold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12,)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        );
                      });
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
