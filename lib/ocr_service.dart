import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

class OcrResult {
  final String text;
  final List<OcrElement> elements;

  OcrResult({required this.text, required this.elements});
}

class OcrElement {
  final String text;
  final double x;
  final double y;

  OcrElement({required this.text, required this.x, required this.y});
}

class OcrService {
  static const _channel = MethodChannel('efootball.ocr/vision');
  static final _mlKit = TextRecognizer();

  static Future<OcrResult> recognize(File imageFile) async {
    if (Platform.isIOS) {
      return await _recognizeWithVision(imageFile);
    } else {
      return await _recognizeWithMlKit(imageFile);
    }
  }

  // iOS — Apple Vision via platform channel
  static Future<OcrResult> _recognizeWithVision(File imageFile) async {
    try {
      final List<dynamic> result = await _channel.invokeMethod(
        'recognizeText',
        {'imagePath': imageFile.path},
      );

      final elements = result.map((item) {
        final map = item as Map<dynamic, dynamic>;
        return OcrElement(
          text: map['text'] as String,
          x: (map['x'] as num).toDouble(),
          y: (map['y'] as num).toDouble(),
        );
      }).toList();

      final text = elements.map((e) => e.text).join('\n');

      print('VISION OCR — ${elements.length} elements');
      for (final el in elements) {
        print('VISION | x:${el.x.toInt()} y:${el.y.toInt()} | "${el.text}"');
      }

      return OcrResult(text: text, elements: elements);
    } catch (e) {
      print('Vision OCR failed: $e — falling back to ML Kit');
      return await _recognizeWithMlKit(imageFile);
    }
  }

  // Android — ML Kit
  static Future<OcrResult> _recognizeWithMlKit(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final recognized = await _mlKit.processImage(inputImage);

    final elements = <OcrElement>[];
    final buffer = StringBuffer();

    for (final block in recognized.blocks) {
      for (final line in block.lines) {
        buffer.writeln(line.text);
        elements.add(OcrElement(
          text: line.text.trim(),
          x: line.boundingBox.left.toDouble(),
          y: line.boundingBox.top.toDouble(),
        ));
      }
    }

    print('ML KIT OCR — ${elements.length} elements');
    for (final el in elements) {
      print('MLKIT | x:${el.x.toInt()} y:${el.y.toInt()} | "${el.text}"');
    }

    return OcrResult(text: buffer.toString(), elements: elements);
  }

  static void dispose() => _mlKit.close();
}