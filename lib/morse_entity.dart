import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'color_manager.dart';

class MorseEntity extends StatefulWidget {
  const MorseEntity({Key? key}) : super(key: key);

  @override
  State<MorseEntity> createState() => _McConverterState();
}

class _McConverterState extends State<MorseEntity> {
  String morseCode = '';
  String englishText = '';
  void convertMorseToEnglish() {
    setState(() {
      englishText = decodeMorseCode(morseCode);
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
      '...-..-': '\$',
      '.-...': '&',
      '-..-.': '#',
    };


    List<String> words = morseCode.trim().split('  ');
    List<String> decodeWords = [];
    for (String word in words) {
      List<String> letters = word.split(' ');
      List<String> decodedLetters = [];

      for (String letter in letters) {
        if (morseCodeMap.containsKey(letter)) {
          decodedLetters.add(morseCodeMap[letter]!);
        }
      }
      decodeWords.add(decodedLetters.join(''));
    }
    return decodeWords.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);
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
      '...-..-': '\$',
      '.-...': '&',
      '-..-.': '#',
      '....': 'H',
    };
    var entryKey = morseCodeMap.entries.map((entry) => entry.key);
    var valueKey = morseCodeMap.entries.map((entry) => entry.value);
    return Scaffold(
      backgroundColor: ColorManager.panDarkBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.panDarkBlue,
        title: const Text('Morse Code Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.h),
        child: Wrap(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
                child: PageView.builder(
                  controller: controller,
                  itemCount: morseCodeMap.length,
                  itemBuilder: ((context, index) {
                    final List<String> entryKeyList = entryKey.toList();
                    final List<String> valueKeyList=valueKey.toList();
                    final String currentKey = entryKeyList[index];
                    final String currentValue = valueKeyList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration:  BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            border: Border.all(color: Colors.white.withOpacity(0.5),width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                currentKey,
                                style: const TextStyle(
                                  fontSize: 60,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                currentValue,
                                style: const TextStyle(
                                  fontSize: 60,
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 1.h,),
              SmoothPageIndicator(
                controller: controller, // PageController
                count: 8,
                // forcing the indicator to use a specific direction
                textDirection: TextDirection.ltr,
                effect:  WormEffect(
                    dotColor: Colors.orangeAccent.withOpacity(0.5),
                    activeDotColor: Colors.deepOrange.withOpacity(0.5)),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 5.h),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      morseCode = value;
                    });
                  },
                  style: TextStyle(color: Colors.white,fontSize: 24),
                  decoration: InputDecoration(
                    labelText: 'Enter Morse Code',
                    labelStyle: TextStyle(color: Colors.greenAccent),
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.1,
                child: Lottie.asset(
                  'assets/128791-hybrid-logo.json',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                onPressed: convertMorseToEnglish,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64),
                  child: Text('Convert',style: TextStyle(fontSize: 24),),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Translated Code:',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                height: 5.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  englishText,
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),

              ),
            ],
          ),
        ]),
      ),
    );
  }
}
