// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, use_super_parameters, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  int? hd2aValue;
  int? hd3aValue;
  int? hd4aValue;

  int? aValue;
  int? bValue;
  int? cValue;
  int? hasil1Value;
  double? hasil2Value;
  int? bulatValue;
  int? bonusktrValue;
  int? totalhdValue;
  int? totalbersihValue;

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
    var sizeHasil = 20.0;

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

                        if (bonusValue != null &&
                            okValue != null &&
                            hd2aValue != null &&
                            hd3aValue != null &&
                            hd4aValue != null) {
                          int angka2 = 60;
                          int angka3 = 350;
                          int angka4 = 2500;

                          int a = hd2aValue! * angka2;
                          int b = hd3aValue! * angka3;
                          int c = hd4aValue! * angka4;

                          int hasil1 = bonusValue! * okValue!;
                          double hasil2 = hasil1 / 100;
                          int bulat = hasil2.round();
                          int bonusktr = okValue! - bulat;

                          int totalhd = a + b + c;

                          int totalbersih = totalhd - bonusktr;

                          aValue = a;
                          bValue = b;
                          cValue = c;
                          hasil1Value = hasil1;
                          hasil2Value = hasil2;
                          bulatValue = bulat;
                          bonusktrValue = bonusktr;
                          totalhdValue = totalhd;
                          totalbersihValue = totalbersih;
                        } else {
                          print("Input tidak valid.");
                        }
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

                    bonusController.text = '';
                    omsetKotorController.text = '';
                    hd2AController.text = '0';
                    hd3AController.text = '0';
                    hd4AController.text = '0';
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
                                title: Text('Total hadiah x 2a'),
                                content: Text(
                                  aValue != null
                                      ? '${hd2aValue.toString()} x 60 = ${aValue.toString()}'
                                      : '0',
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Total hadiah x 3a'),
                                content: Text(
                                  bValue != null
                                      ? '${hd3aValue.toString()} x 350 = ${bValue.toString()}'
                                      : '0',
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Total hadiah x 2a'),
                                content: Text(
                                  cValue != null
                                      ? '${hd4aValue.toString()} x 2500 = ${cValue.toString()}'
                                      : '0',
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
                    ],
                  ),
                ),
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
                      'Hasil',
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
                      Text(
                        '${okValue.toString()} / ${bulatValue.toString()} / ${bonusktrValue.toString()}',
                        style: TextStyle(
                            fontSize: sizeHasil, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '2aX${hd2aValue.toString()}=${aValue.toString()} | 3aX${hd3aValue.toString()}=${bValue.toString()} | 4aX${hd4aValue.toString()}=${cValue.toString()}',
                        style: TextStyle(
                            fontSize: sizeHasil, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'thd=${totalhdValue} / ${totalbersihValue}',
                        style: TextStyle(
                            fontSize: sizeHasil, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
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
                      'Detail',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.percent),
                          Text('Presentase'),
                          Text('${bonusValue}%'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.money_off),
                          Text('OmsKtr'),
                          Text('${okValue}'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.money),
                          Text('Bonus'),
                          Text('${bulatValue}'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.attach_money),
                          Text('OmsBrsh'),
                          Text('${bonusktrValue}'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.gif_box),
                          Text('TtlHd'),
                          Text('${totalhdValue}'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_balance),
                          Text('Saldo'),
                          Text('${totalbersihValue}'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
