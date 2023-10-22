import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GenerateQRPage> createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  TextEditingController textController = TextEditingController();
  bool showQr = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Input string to generate',
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Generate QR'),
                    onPressed: () {
                      setState(() {
                        showQr = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            showQr ? QrImageView(
              data: textController.text,
              version: QrVersions.auto,
              size: 200.0,
            ) : const SizedBox(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
