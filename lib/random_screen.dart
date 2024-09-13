import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:random_number/provider.dart';

class RandomAppScreen extends StatelessWidget {
  const RandomAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child:
              Consumer<NumberProvider>(builder: (context, randomNumber, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      height: 300,
                      width: 300,
                      image: AssetImage(
                        "assets/image.jpeg",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Text(
                    "Guess my Number",
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  randomNumber.userChoice == ''
                      ? const Text("")
                      : randomNumber.appChoice ==
                              int.parse(randomNumber.userChoice)
                          ? const Text(
                              "You win",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            )
                          : const Text(
                              "You lose",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      focusNode: focusNode,
                      controller: randomNumber.controller,
                      onChanged: (value) {
                        randomNumber.userChoice = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter the guessed number here',
                        hintText: 'enter now',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      focusNode.unfocus();
                      randomNumber.userChoice == ''
                          ? showCupertinoDialog(
                              context: context,
                              builder: (_) => CupertinoAlertDialog(
                                title: const Text("You must enter any number"),
                                content: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(50, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text("Back"),
                                  ),
                                ),
                              ),
                            )
                          : randomNumber.appChoice == 0
                              ? randomNumber.appChoiceFunction()
                              : null;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(130, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Enter",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Text(
                    "app choice : ${randomNumber.userChoice == '' ? 'not yet' : randomNumber.appChoice}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      focusNode.unfocus();
                      randomNumber.changeUserChoice('');
                      randomNumber.changeAppChoice(0);
                      randomNumber.controller.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(130, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Try again",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(130, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Back",
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
