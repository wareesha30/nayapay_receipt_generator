import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Receipt extends StatelessWidget {
  final String senderName;
  final String receiverName;
  final String amountSent;
  final String destinationBank;
  final String destinationAccountNumber;

  const Receipt({
    super.key,
    required this.senderName,
    required this.receiverName,
    required this.amountSent,
    required this.destinationBank,
    required this.destinationAccountNumber,
  });
  String generateSimilarString({int length = 20}) {
    String prefix = '6612';
    final random = Random();

    // Adjusting the length to accommodate the prefix
    length -= prefix.length;

    const chars = '0123456789abcdef';
    String randomChars = String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));

    return '$prefix$randomChars';
  }

  String generateFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String lastFourDigits =
        destinationAccountNumber.substring(destinationAccountNumber.length - 4);
    String similarString = generateSimilarString();
    String formattedDate = generateFormattedDate();

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.31,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFF28E2F), Color(0xFFEC413E)])),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.26,
                    width: MediaQuery.sizeOf(context).width * 1,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      child: Column(
                        children: [
                          const Row(children: <Widget>[
                            Expanded(child: Divider()),
                            Text(
                              "  Sent with  ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Expanded(child: Divider()),
                          ]),
                          const SizedBox(
                            height: 8,
                          ),
                          Image.asset(
                            'assets/images/np.png',
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Rs. $amountSent",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 33),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Aligning the row items at the center horizontally

                            children: [
                              Image.asset(
                                'assets/images/ep.png',
                                height: 40,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    receiverName,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 41, 40, 40),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Easypaisa-$lastFourDigits",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TRANSACTION DETAILS',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transaction ID',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        similarString,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transaction time',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'AMOUNT DETAILS',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount Sent',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Rs. $amountSent",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 17),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service Fee (Incl. Tax)',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "Rs. 0",
                        style: TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "Rs. $amountSent",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'ADDITIONAL INFORMATION',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Destination Acc. Title',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        receiverName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Destination Bank',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        destinationBank,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Destination Acc. Number',
                        style: TextStyle(fontSize: 17),
                      ),
                      Row(
                        children: [
                          const Text(
                            "••••",
                            style: TextStyle(
                                color: Color.fromARGB(255, 114, 114, 114),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            lastFourDigits,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 114, 114, 114),
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Source Acc. Title',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        senderName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Channel',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "1Link",
                        style: TextStyle(
                            color: Color.fromARGB(255, 114, 114, 114),
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
