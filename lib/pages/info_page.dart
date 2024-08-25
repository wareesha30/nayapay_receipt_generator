import 'package:flutter/material.dart';
import 'package:nayapay_receipt_generator/pages/receipt_page.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  late TextEditingController senderNameController;
  late TextEditingController receiverNameController;
  late TextEditingController amountSentController;
  late TextEditingController destinationBankController;
  late TextEditingController destinationAccountNumberController;

  @override
  void initState() {
    super.initState();
    senderNameController = TextEditingController();
    receiverNameController = TextEditingController();
    amountSentController = TextEditingController();
    destinationBankController = TextEditingController();
    destinationAccountNumberController = TextEditingController();
  }

  @override
  void dispose() {
    senderNameController.dispose();
    receiverNameController.dispose();
    amountSentController.dispose();
    destinationBankController.dispose();
    destinationAccountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset(
                  "assets/images/np.png",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nayapay Invoice Generator",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: senderNameController,
                decoration: const InputDecoration(labelText: 'Sender Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: receiverNameController,
                decoration: const InputDecoration(labelText: 'Receiver Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: amountSentController,
                decoration: const InputDecoration(labelText: 'Amount Sent'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: destinationAccountNumberController,
                decoration: const InputDecoration(
                    labelText: 'Destination Account Number'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Receipt(
                        senderName: senderNameController.text,
                        receiverName: receiverNameController.text,
                        amountSent: amountSentController.text,
                        destinationBank: "Easypaisa",
                        destinationAccountNumber:
                            destinationAccountNumberController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Generate Receipt'),
              ),
              const SizedBox(
                height: 8,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made By Wareesha Khan"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
