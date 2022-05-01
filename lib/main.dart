import 'package:flutter/material.dart';
import 'globals.dart' as globe;

void main() {
  runApp(const MaterialApp(
    title: 'BMI Calculator',
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: Container(
          color: const Color.fromRGBO(28, 33, 56, 1),
          child: Column(children: [
            const top(),
            const SexButtons(),
            const SliderModule(),
            const Options(),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 25),
              width: double.maxFinite,
              height: 100,
              child: Material(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Calculate',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  )),
            )
          ])),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      home: Container(
        color: const Color.fromRGBO(28, 33, 56, 1),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            alignment: Alignment.topLeft,
            child: const Material(
              color: Color.fromRGBO(0, 0, 0, 0),
              child: Text('Your Result',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30)),
            ),
          ),
          results(),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(top: 25),
            width: double.maxFinite,
            height: 100,
            child: Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Text(
                      'Re-Calculate',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}

class SliderModule extends StatefulWidget {
  const SliderModule({Key? key}) : super(key: key);

  @override
  State<SliderModule> createState() => _SliderModuleState();
}

class _SliderModuleState extends State<SliderModule> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(50, 50, 69, 1),
        ),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        height: MediaQuery.of(context).size.height * 0.20,
        child: Column(children: [
          const SizedBox(height: 30),
          const Material(
            color: Color.fromARGB(0, 0, 0, 0),
            child: Text('HEIGHT',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(121, 121, 134, 1))),
          ),
          SizedBox(
              height: 20,
              width: double.infinity,
              child: Text(
                '$_value cm',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              )),
          const SizedBox(height: 10),
          SizedBox(
            height: 15,
            width: double.infinity,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(47, 36, 43, 17),
              body: Slider(
                value: _value.toDouble(),
                min: 1.0,
                max: 250.0,
                activeColor: const Color.fromRGBO(250, 30, 100, 1),
                inactiveColor: Colors.grey,
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue.toInt();
                    globe.height = _value;
                  });
                },
              ),
            ),
          )
        ]));
  }
}

class SexButtons extends StatefulWidget {
  const SexButtons({Key? key}) : super(key: key);

  @override
  State<SexButtons> createState() => _SexButtonsState();
}

class _SexButtonsState extends State<SexButtons> {
  bool male = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 17.5, top: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.45,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: const Color.fromARGB(50, 50, 69, 1),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Column(
                    children: const [
                      SizedBox(height: 15),
                      Icon(Icons.male, size: 100, color: Colors.white),
                      Text(
                        'Male',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    male = true;
                    globe.isMale = true;
                  },
                  focusColor: Colors.grey,
                ),
              )),
          Container(
              margin: const EdgeInsets.only(
                  left: 17.5, right: 10, top: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.45,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: const Color.fromARGB(50, 50, 69, 1),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Column(
                    children: const [
                      SizedBox(height: 15),
                      Icon(Icons.female, size: 100, color: Colors.white),
                      Text(
                        'Female',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {
                    male = false;
                    globe.isMale = male;
                  },
                  focusColor: Colors.grey,
                ),
              ))
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class top extends StatefulWidget {
  const top({Key? key}) : super(key: key);

  @override
  State<top> createState() => _topState();
}

class _topState extends State<top> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: const Color.fromARGB(50, 50, 69, 1),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width),
        SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: const Material(
              color: Color.fromARGB(50, 50, 69, 1),
              child: Text(
                'BMI Calculator',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            )),
      ],
    );
  }
}

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int weight = 0;
  int age = 0;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin:
            const EdgeInsets.only(left: 20, right: 17.5, top: 20, bottom: 10),
        height: MediaQuery.of(context).size.width * 0.45,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(50, 50, 69, 1),
        ),
        child: Column(children: [
          const SizedBox(height: 25),
          const Material(
            color: Color.fromARGB(50, 50, 69, 1),
            child: Text(
              'WEIGHT',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 10),
            ),
          ),
          SizedBox(
              height: 30,
              width: double.infinity,
              child: Material(
                color: const Color.fromARGB(0, 0, 0, 0),
                child: Text(
                  '$weight',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    setState(() {
                      if (weight - 1 > 0) {
                        weight--;
                        globe.weight--;
                      }
                    });
                  },
                  color: const Color.fromRGBO(90, 90, 110, 1),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.remove,
                    size: 50,
                  ),
                  shape: const CircleBorder(),
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    setState(() {
                      weight++;
                      globe.weight++;
                    });
                  },
                  color: const Color.fromRGBO(90, 90, 110, 1),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                  shape: const CircleBorder(),
                ),
              ),
            ],
          )
        ]),
      ),
      Container(
        margin:
            const EdgeInsets.only(left: 17.5, right: 10, top: 20, bottom: 10),
        height: MediaQuery.of(context).size.width * 0.45,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(50, 50, 69, 1),
        ),
        child: Column(children: [
          const SizedBox(height: 25),
          const Material(
            color: Color.fromARGB(50, 50, 69, 1),
            child: Text(
              'AGE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 10),
            ),
          ),
          SizedBox(
              height: 30,
              width: double.infinity,
              child: Material(
                color: const Color.fromARGB(0, 0, 0, 0),
                child: Text(
                  '$age',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    setState(() {
                      if (age - 1 > 0) {
                        age--;
                        globe.age--;
                      }
                    });
                  },
                  color: const Color.fromRGBO(90, 90, 110, 1),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.remove,
                    size: 50,
                  ),
                  shape: const CircleBorder(),
                ),
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  minWidth: 50,
                  onPressed: () {
                    setState(() {
                      age++;
                      globe.age++;
                    });
                  },
                  color: const Color.fromRGBO(90, 90, 110, 1),
                  textColor: Colors.white,
                  child: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                  shape: const CircleBorder(),
                ),
              ),
            ],
          )
        ]),
      ),
    ]);
  }
}

class results extends StatefulWidget {
  const results({Key? key}) : super(key: key);

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.height * 0.7);
    double size_w = (MediaQuery.of(context).size.height * 0.8);
    double bmi = globe.weight / ((globe.height / 100) * (globe.height / 100));
    String s = '';
    String msg = '';
    Color c = Colors.black;
    if (globe.age > 20) {
      if (bmi > 30) {
        s = "Obese";
        c = Colors.red;
        msg = "You are Obese! \nThats not too good!";
      }
      if (bmi > 25 && bmi < 30) {
        s = "Overweight";
        c = Colors.yellow;
        msg =
            "I hope your bulking right now becuase if not \nYour getting close to the danger zone!";
      }
      if (bmi < 25 && bmi > 18.5) {
        s = "Normal";
        c = Colors.green;
        msg = "You are normal weight!";
      }
      if (bmi < 18.5 && bmi > 17) {
        s = "Mild Thinness";
        c = Colors.yellow;
        msg = "Time to start bulking!\nYou have Mild Thiness";
      }
      if (bmi < 17 && bmi > 16) {
        s = "Moderate Thinness";
        c = Colors.orange;
        msg = "You have Moderate Thinness";
      }
      if (bmi < 16) {
        s = "Severe Thinness";
        c = Colors.red;
        msg = "I bet you can't even squat 225 below parallel";
      }
    }
    if (globe.age < 20) {
      double fifth_per;
      double eighty_per;
      double nintyf_per;
      if (globe.isMale == true) {
        fifth_per = 0.23 * globe.age +
            14.33; //i was lazy just got the slope of boy and girl charts for each percentile, this will be wrong at younger ages!
        eighty_per = 0.49 * globe.age + 17.22;
        nintyf_per = 0.63 * globe.age + 18.00;
      } else {
        fifth_per = 0.21 * globe.age + 13.83;
        eighty_per = 0.47 * globe.age + 17.06;
        nintyf_per = 0.86 * globe.age + 17.78;
      }
      if (bmi < fifth_per) {
        s = "Underweight";
        c = Colors.orange;
        msg = "Your underweight";
      }
      if (bmi > fifth_per && bmi < eighty_per) {
        s = "Healthy weight";
        c = Colors.green;
        msg = "Normal weight";
      }
      if (bmi > eighty_per && bmi < nintyf_per) {
        s = "At risk of overweight";
        c = Colors.orange;
      }
      if (bmi > nintyf_per) {
        s = "Overweight";
        c = Colors.red;
      }
    }
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(50, 50, 69, 1),
        ),
        height: size,
        width: size_w,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: size / 6),
            Text(
              s,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: c, fontSize: 20),
            ),
            SizedBox(height: size / 6),
            Material(
              color: Color.fromRGBO(0, 0, 0, 0),
              child: Text(
                bmi.toStringAsPrecision(2),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            SizedBox(height: size / 6),
            Material(
              color: Color.fromRGBO(0, 0, 0, 0),
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 20),
              ),
            )
          ],
        ));
  }
}
