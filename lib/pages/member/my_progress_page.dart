import 'dart:convert';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madcw2_fitness/models/bmi_history_result.dart';
import 'package:madcw2_fitness/util/api.dart';
import 'package:madcw2_fitness/util/app_theme.dart';
import 'package:madcw2_fitness/util/constants.dart';
import 'package:madcw2_fitness/util/dialogs.dart';
import 'package:madcw2_fitness/widgets/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProgressPage extends StatefulWidget {
  const MyProgressPage({super.key});

  @override
  State<MyProgressPage> createState() => _MyProgressPageState();
}

class _MyProgressPageState extends State<MyProgressPage> {
  List<double> bmiHistory = [];

  int initialHeight = 165;
  int initialWeight = 73;
  double initialBMI = 27.0;

  double variableBMI = 0.0;
  String variableBmiStatusText = '';
  Color variableBmiStatusColor = Colors.transparent;
  int variableHeight = 0;
  int variableWeight = 0;

  bool isLoading = false;

  Future<void> loadBMIHistory() async {
    setState(() {
      isLoading = true;
    });

    var headers = {'accept': 'text/plain'};
    var requestData = {"memberId": "7"};
    var response = await Api.sendGetRequest(
      viewProgressRoute,
      data: requestData,
      headers: headers,
    );
    if (response.statusCode == 200) {
      List<BMIHistoryResult> results = jsonDecode(response.body)
          .map<BMIHistoryResult>((json) => BMIHistoryResult.fromJson(json))
          .toList();

      Map<String, int> bmiMap = {};
      List<double> bmis = [];

      results.forEach((bmiEntry) {
        DateFormat dateFormat = DateFormat('yyyy-MM-dd');
        var formattedDate =
            dateFormat.format(DateTime.parse(bmiEntry.progressDate).toLocal());
        if (bmiEntry.bmi > 0) {
          bmiMap[formattedDate] = bmiEntry.bmi;
        }
        bmis.add(double.parse(bmiEntry.bmi.toString()));
      });

      setState(() {
        bmiHistory = bmis;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setState(() {
      isLoading = true;
    });
    variableHeight = initialHeight;
    variableWeight = initialWeight;
    calculateBMI();
    await loadBMIHistory();
    setState(() {
      isLoading = false;
    });
  }

  void calculateBMI() {
    if (variableHeight == 0 || variableWeight == 0) {
      setState(() {
        variableBMI = 0.0;
      });
    }

    try {
      double cal = ((variableWeight / variableHeight / variableHeight) * 10000)
          .ceilToDouble();
      setState(() {
        variableBMI = cal;
      });

      /// calculate bmi status by the latestBMI value
      if (variableBMI < 18.5) {
        setState(() {
          variableBmiStatusText = 'Underweight';
          variableBmiStatusColor = AppTheme.bmiUnderweightColor;
        });
      } else if (variableBMI >= 18.5 && variableBMI <= 24.9) {
        setState(() {
          variableBmiStatusText = 'Normal';
          variableBmiStatusColor = AppTheme.bmiNormalColor;
        });
      } else if (variableBMI >= 25 && variableBMI <= 29.9) {
        setState(() {
          variableBmiStatusText = 'Overweight';
          variableBmiStatusColor = AppTheme.bmiOverweightColor;
        });
      } else if (variableBMI >= 30 && variableBMI <= 34.9) {
        setState(() {
          variableBmiStatusText = 'Obese';
          variableBmiStatusColor = AppTheme.bmiObeseColor;
        });
      } else if (variableBMI >= 35) {
        setState(() {
          variableBmiStatusText = 'Extremely Obese';
          variableBmiStatusColor = AppTheme.bmiExtremelyObeseColor;
        });
      }
    } catch (e) {
      setState(() {
        variableBMI = 0.0;
      });
    }
  }

  Future<void> saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      "memberId": prefs.getString("id"),
      'height': '$variableHeight',
      'weight': '$variableWeight',
      'bmi': '$variableBMI',
      'progressDate': DateTime.now().toLocal().toIso8601String(),
    };
    var headers = {'accept': '*/*', 'Content-Type': 'application/json'};
    var response = await Api.sendPostRequest(saveProgressRoute,
        data: jsonEncode(data), headers: headers);
    if (response.statusCode == 200) {
      showMessageDialog(
          context, "Success", "Your progress data was saved succesfully.", 'OK',
          () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MY PROGRESS',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
          ),
        ),
      ),
      body: isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Initial",
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: 390,
                      height: 101,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      // add vertical divider
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Height ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff052452),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "$initialHeight cm",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Weight ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff052452),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "$initialWeight Kg",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "BMI",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffe51561),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                initialBMI.toStringAsFixed(1),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Calculate BMI ",
                          style: TextStyle(
                            color: Color(0xffe51561),
                            fontSize: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await saveProgress();
                            setState(() {
                              isLoading = false;
                            });
                          },
                          icon: Icon(
                            Icons.save,
                            color: Color(0xffe51561),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyProgressIncrementableTile(
                          title: "Height",
                          onIncrement: (number) {
                            setState(() {
                              variableHeight = number;
                            });
                            calculateBMI();
                          },
                          onDecrement: (number) {
                            setState(() {
                              variableHeight = number;
                            });
                            calculateBMI();
                          },
                          number: initialHeight,
                        ),
                        MyProgressIncrementableTile(
                          title: "Weight",
                          onIncrement: (number) {
                            setState(() {
                              variableWeight = number;
                            });
                            calculateBMI();
                          },
                          onDecrement: (number) {
                            setState(() {
                              variableWeight = number;
                            });
                            calculateBMI();
                          },
                          number: initialWeight,
                        ),
                        Container(
                          width: 120,
                          height: 124,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "BMI",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffe51561),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '$variableBMI',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                variableBmiStatusText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: variableBmiStatusColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      "Your Progress",
                      style: TextStyle(
                        color: Color(0xff052351),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: const Size.fromHeight(40.0).width,
                      height: 300.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Sparkline(
                        lineWidth: 2.0,
                        lineColor: Colors.purple,
                        useCubicSmoothing: true,
                        cubicSmoothingFactor: 0.2,
                        averageLine: true,
                        averageLabel: true,
                        kLine: const ['max', 'min', 'first', 'last'],
                        gridLineLabelPrecision: 3,
                        enableGridLines: true,
                        data: bmiHistory,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class MyProgressIncrementableTile extends StatefulWidget {
  final String title;
  final int number;
  final Function onIncrement;
  final Function onDecrement;

  const MyProgressIncrementableTile({
    super.key,
    required this.title,
    required this.number,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<MyProgressIncrementableTile> createState() =>
      _MyProgressIncrementableTileState();
}

class _MyProgressIncrementableTileState
    extends State<MyProgressIncrementableTile> {
  int currentNumber = 0;

  @override
  void initState() {
    super.initState();
    currentNumber = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 124,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff052351),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "$currentNumber",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff16c79a),
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    currentNumber++;
                  });
                  widget.onIncrement(currentNumber);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xff2f89c8),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff2f89c8),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  setState(() {
                    if (currentNumber > 0) {
                      currentNumber--;
                    }
                  });
                  widget.onDecrement(currentNumber);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xff2f89c8),
                    ),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Color(0xff2f89c8),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
