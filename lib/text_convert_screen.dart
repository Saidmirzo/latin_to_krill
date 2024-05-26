import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latin_to_ktill/converter.dart';

class TextConverterScreen extends StatefulWidget {
  const TextConverterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextConverterScreenState createState() => _TextConverterScreenState();
}

class _TextConverterScreenState extends State<TextConverterScreen> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController resultController = TextEditingController();

  // String _convertedText = "";
  Converter converter = Converter();

  void _convertToLatin() {
    setState(() {
      resultController.text = converter.cyrillicToLatin(_controller.text);
    });
  }

  void _convertToCyrillic() {
    setState(() {
      resultController.text = converter.latinToCyrillic(_controller.text);
    });
  }

  void _copyToClipboard() {
    if (resultController.text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: resultController.text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to Clipboard')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Result is empty')),
      );
    }
  }

  void _clearAll() {
    _controller.clear();
    resultController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 35),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: null,
                    expands: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _convertToLatin,
                      child: const Text('To Latin'),
                    ),
                    ElevatedButton(
                      onPressed: _convertToCyrillic,
                      child: const Text('To Cyrillic'),
                    ),
                    ElevatedButton(
                      onPressed: _copyToClipboard,
                      child: const Text('Copy result'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Converted Text:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: TextField(
                    controller: resultController,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    readOnly: true,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      labelText: 'Result',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: _clearAll,
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
