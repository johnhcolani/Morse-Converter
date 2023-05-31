import 'package:flutter/material.dart';

void main() {
  runApp(const MyMorseCodeApp());
}

class MyMorseCodeApp extends StatelessWidget {
  const MyMorseCodeApp({super.key});

    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morse Code Converter',

        home: McConverter(),
      );

  }
}

class McConverter extends StatefulWidget {
  const McConverter({Key? key}) : super(key: key);

  @override
  State<McConverter> createState() => _McConverterState();
}

class _McConverterState extends State<McConverter> {
  String morseCode='';
  String englishText = '';
  void convertMorseToEnglish(){
    setState(() {
      englishText=decodeMorseCode(morseCode);
    });
  }

  String decodeMorseCode(String morseCode) {
    final Map<String, String> morseCodeMap = {
      '.-': 'A',
      '-...': 'B',
      '-.-.': 'C',
      '-..': 'D',
      '.': 'E',
      '..-.': 'F',
      '--.': 'G',
      '....': 'H',
      '..': 'I',
      '.---': 'J',
      '-.-': 'K',
      '.-..': 'L',
      '--': 'M',
      '-.': 'N',
      '---': 'O',
      '.--.': 'P',
      '--.-': 'Q',
      '.-.': 'R',
      '...': 'S',
      '-': 'T',
      '..-': 'U',
      '...-': 'V',
      '.--': 'W',
      '-..-': 'X',
      '-.--': 'Y',
      '--..': 'Z',
      '.----': '1',
      '..---': '2',
      '...--': '3',
      '....-': '4',
      '.....': '5',
      '-....': '6',
      '--...': '7',
      '---..': '8',
      '----.': '9',
      '-----': '0',
      '.-.-.-': '.',
      '--..--': ',',
      '..--..': '?',
      '-..-.': '/',
      '-....-': '-',
      '-.--.': '(',
      '-.--.-': ')',
      '.--.-.': '@',
      '.-..-.': '"',
      '---...': ':',
      '-.-.-.': ';',
      '.-.-.': '+',
      '-...-': '=',
      '.----.': "'",
      '-.-.--': '!',
      '..--.-': '_',
      '...-..-':'\$',
      '.-...': '&',
      '-..-.' : '#'
    };
    List<String> words=morseCode.trim().split(' / ');
    List<String> decodeWords =[];
    for (String word in words){
      List<String>letters =word.split(' ');
      List<String> decodedLetters=[];

      for (String letter in letters){
        if(morseCodeMap.containsKey(letter)){
          decodedLetters.add(morseCodeMap[letter]!);
        }
              }
      decodeWords.add(decodedLetters.join(''));
    }
    return decodeWords.join(' ');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morse Code Converter'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    morseCode = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter Morse Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: convertMorseToEnglish,
                  child: const Text('Convert'),),
              const SizedBox(height: 16.0),
              const Text(
                'English Text:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                englishText,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
