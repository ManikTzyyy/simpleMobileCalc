// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, use_super_parameters

import 'package:flutter/material.dart';
import 'package:simplecalc/data.dart';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
    return MaterialApp(
      title: 'Calc',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 209, 101, 0)),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Maniktzy',
        formattedDate: formattedDate,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.formattedDate})
      : super(key: key);

  final String title;
  final String formattedDate;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? bonusValue;
  int? okValue;
  int? result;
  int? hd2aValue;
  int? hd3aValue;
  int? hd4aValue;

  TextEditingController bonusController = TextEditingController();
  TextEditingController omsetKotorController = TextEditingController();
  TextEditingController hd2AController = TextEditingController(text: '0');
  TextEditingController hd3AController = TextEditingController(text: '0');
  TextEditingController hd4AController = TextEditingController(text: '0');

  final _formKey = GlobalKey<FormState>(); // Key for Form

  @override
  Widget build(BuildContext context) {
    var sizeTtData = 20.0; //font size for title in data
    var sizeSubData = 18.0; //font size for sub in data

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.formattedDate,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: bonusController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Bonus',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: omsetKotorController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Omset Kotor',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: hd2AController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukan Total 2a',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: hd3AController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukan Total 3a',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: hd4AController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukan Total 4a',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 76, 160, 175)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 22),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        bonusValue = int.tryParse(bonusController.text);
                        okValue = int.tryParse(omsetKotorController.text);
                        hd2aValue = int.tryParse(hd2AController.text);
                        hd3aValue = int.tryParse(hd3AController.text);
                        hd4aValue = int.tryParse(hd4AController.text);
                      });
                      calculateResult(bonusValue, okValue, hd2aValue, hd3aValue,
                              hd4aValue)
                          .then((value) {
                        setState(() {
                          result = value;
                          
                        });
                      });
                    }
                  },
                  child: Text('Process'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    bonusValue = null;
                    okValue = null;
                    hd2aValue = null;
                    hd3aValue = null;
                    hd4aValue = null;

                    bonusController.text =
                        ''; 
                    omsetKotorController.text =
                        ''; 
                    hd2AController.text = '';
                    hd3AController.text = '';
                    hd4AController.text = '';
                  });
                },
                child: Text('Reset'),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                      height: 20,
                    ),
                    Text(
                      'Data',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.percent),
                        title: Text(
                          'Bonus',
                          style: TextStyle(
                              fontSize: sizeTtData,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          bonusValue != null
                              ? '${bonusValue.toString()}%'
                              : '0%',
                          style: TextStyle(fontSize: sizeSubData),
                        ),
                        onTap: () {
                          // Action when item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.money),
                        title: Text(
                          'omset kotor',
                          style: TextStyle(
                              fontSize: sizeTtData,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          okValue != null ? '${okValue.toString()}' : '0',
                          style: TextStyle(fontSize: sizeSubData),
                        ),
                        onTap: () {
                          // Action when item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.filter_2),
                        title: Text(
                          'Hd2A',
                          style: TextStyle(
                              fontSize: sizeTtData,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          bonusValue != null ? '${hd2aValue.toString()}' : '0',
                          style: TextStyle(fontSize: sizeSubData),
                        ),
                          onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Hd2A'),
                                content: Text(
                                  hd2aValue != null ? '${hd2aValue.toString()}' : '0',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.filter_3),
                        title: Text(
                          'Hd3A',
                          style: TextStyle(
                              fontSize: sizeTtData,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          bonusValue != null ? '${hd3aValue.toString()}' : '0',
                          style: TextStyle(fontSize: sizeSubData),
                        ),
                        onTap: () {
                          // Action when item is tapped
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.filter_4),
                        title: Text(
                          'Hd4a',
                          style: TextStyle(
                              fontSize: sizeTtData,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          bonusValue != null ? '${hd4aValue.toString()}' : '0',
                          style: TextStyle(fontSize: sizeSubData),
                        ),
                        onTap: () {
                          // Action when item is tapped
                        },
                      ),
                      // ListTile(
                      //   leading: Icon(Icons.calculate),
                      //   title: Text(
                      //     'Result',
                      //     style: TextStyle(
                      //         fontSize: sizeTtData,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      //   subtitle: Text(
                      //     result != null ? '${result.toString()}' : '0',
                      //     style: TextStyle(fontSize: sizeSubData),
                      //   ),
                      //   onTap: () {
                      //     // Action when item is tapped
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
