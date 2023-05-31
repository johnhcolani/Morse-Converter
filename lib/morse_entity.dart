import 'package:flutter/material.dart';

class MorseEntity extends StatefulWidget {
  const MorseEntity({Key? key}) : super(key: key);

  @override
  State<MorseEntity> createState() => _McConverterState();
}

class _McConverterState extends State<MorseEntity> {
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
        backgroundColor: Colors.teal,
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
                      color: Colors.teal.shade200,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.teal,
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),

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
                style: const TextStyle(fontSize: 24.0,color: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
