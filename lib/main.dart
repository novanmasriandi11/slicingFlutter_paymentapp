import 'package:flutter/material.dart';
import 'package:paymentapp_basic/theme.dart';

void main(List<String> args) {
  runApp(const PaymentApp());
}

class PaymentApp extends StatefulWidget {
  const PaymentApp({super.key});

  @override
  State<PaymentApp> createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget options(int index, String title, String subTitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index ? azure : coolGrey,
            ),
          ),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? const Icon(
                          Icons.check_circle_rounded,
                          color: azure,
                        )
                      : const Icon(
                          Icons.circle_outlined,
                          color: azure,
                        ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: plainTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 91.0,
                  // ),
                  const Spacer(),
                  Text(
                    price,
                    style: priceTextStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 32.0, right: 32.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 267,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Go unlock all features and \n build your own courses bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          SizedBox(
            height: 51.23,
            width: 311,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: azure,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(71),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: btnTextStyle,
                )),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff04112F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              const SizedBox(
                height: 50.0,
              ),
              options(0, 'Monthly', 'Good for starting up', 'Rp.989.000'),
              options(1, 'Quarterly', 'Focus on improvement', 'Rp.3.998.000'),
              options(2, 'Yearly', 'Steady for professional', 'Rp.8.999.000'),
              const SizedBox(
                height: 50.0,
              ),
              selectedIndex == -1 ? const SizedBox() : checkoutButton(),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
