import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sse3401___lab5/invitationPage.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: factoryDashboard()));
}

class factoryDashboard extends StatefulWidget {
  const factoryDashboard({Key? key}) : super(key: key);

  @override
  _factoryDashboardState createState() => _factoryDashboardState();
}

class _factoryDashboardState extends State<factoryDashboard> {
  int currentIndex = 1;
  int factoryName = 1;
  Color factory1 = Colors.blue;
  Color factory2 = Colors.grey;
  Color factory3 = Colors.grey;
  Color factory4 = Colors.grey;

  final List<Map<String, String>> engineerList = [
    {'name': 'Ben', 'phNum': '+60109219938'},
    {'name': 'Testing 1', 'phNum': '+601234567891'},
    {'name': 'Hello', 'phNum': '+60123456789'},
  ];

  Widget _buildFactoryDashboard(int factoryName) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.61,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 221, 221),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: currentIndex == 1
                    ? factoryName == 2
                        ? SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '1549.7kW',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildSensorData('Steam Pressure',
                                            '34.19', 'bar', 'images/F2.1.png'),
                                        _buildSensorData('Steam Flow', '22.82',
                                            'T/H', 'images/F2.2.png')
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildSensorData('Water Level', '55.41',
                                            '%', 'images/F2.3.png'),
                                        _buildSensorData('Power Frequency',
                                            '50.08', 'Hz', 'images/F2.4.png')
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 50),
                                            Text(
                                              '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}',
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : factoryName == 1
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '⚠️ ABD1234 IS UNREACHABLE !',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildSensorData(
                                                'Steam Pressure',
                                                '0.0',
                                                'bar',
                                                'images/F1.1.png'),
                                            _buildSensorData('Steam Flow',
                                                '0.0', 'T/H', 'images/F1.2.png')
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildSensorData('Water Level',
                                                '0.0', '%', 'images/F1.3.png'),
                                            _buildSensorData('Power Frequency',
                                                '0.0', 'Hz', 'images/F1.4.png')
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 50),
                                                Text(
                                                  '-- : --',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )
                                              ]),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container()
                    : Container()),
          ]),
    );
  }

  Widget _buildSensorData(
      String title, String value, String unit, String image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(title, style: TextStyle(fontSize: 17)),
              SizedBox(
                height: 92,
                width: 92,
                child: Image.asset(image),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$value",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  Text(
                    "$unit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThreshold(String title, String value, String unit) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 2)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$value ",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 2.5,
                ),
                Text(
                  "$unit",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget factoryButton(int index, String text, IconData icon) {
    Size screenSize = MediaQuery.of(context).size;
    double buttonWidth = screenSize.width * 0.4;
    double buttonHeight = screenSize.height * 0.12;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          factoryName = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 8,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(buttonWidth, buttonHeight),
        side: BorderSide(
          width: factoryName == index ? 2 : 0,
          color: factoryName == index ? Colors.blue : Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 30),
          Text(
            text,
            style: const TextStyle(
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(178, 251, 247, 247),
      appBar: AppBar(
        title: Text(
          'Factory $factoryName',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        currentIndex == 1
            ? _buildFactoryDashboard(factoryName)
            : currentIndex == 0
                ? factoryName == 1
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.61,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 221, 221),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.48,
                                child: Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.separated(
                                      itemCount: engineerList.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 10,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: ListTile(
                                            title: Text(
                                              engineerList[index]['name']!,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            subtitle: Text(
                                                engineerList[index]['phNum']!,
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const invitationPage()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.61,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 221, 221),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                : currentIndex == 2 && factoryName == 1
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.61,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 221, 221),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: const Text(
                                        "Minimum Threshold",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      size: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.edit,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildThreshold(
                                      "Steam\nPressure", "29", "bar"),
                                  _buildThreshold("Steam\nFlow", "22", "T/H"),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildThreshold("Water\nLevel", "53", "%"),
                                  _buildThreshold(
                                      "Power\nFrequency", "48", "Hz"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.61,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 221, 221),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
        SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              factoryButton(1, 'Factory 1', Icons.factory),
              const SizedBox(
                width: 20,
              ),
              factoryButton(2, 'Factory 2', Icons.factory),
              const SizedBox(
                width: 20,
              ),
              factoryButton(3, 'Factory 3', Icons.factory),
              const SizedBox(
                width: 20,
              ),
              factoryButton(4, 'Factory 4', Icons.factory),
            ],
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ]),
    );
  }
}




























  // int _selectedIndex = 0; // Initial index of bottom navigation bar
  // int _selectedFactory = 1; // Initial factory selection

  // // Sample contact data
  // final List<Map<String, String>> _contacts = [
  //   {'name': 'Ben', 'phone': '+60109219938'},
  //   {'name': 'Testing 1', 'phone': '+601234567891'},
  //   {'name': 'Hello', 'phone': '+601234567891'},
  // ];

  // // Function to build each factory data section
  // Widget _buildFactoryData(int factoryNumber) {
  //   // Placeholder data (replace with actual data fetching logic)
  //   final isReachable = factoryNumber == 2;
  //   final steamPressure = isReachable ? 34.19 : 0.0;
  //   final steamFlow = isReachable ? 22.82 : 0.0;
  //   final waterLevel = isReachable ? 55.41 : 0.0;
  //   final powerFrequency = isReachable ? 50.08 : 0.0;

  //   return Column(
  //     children: [
  //       // Factory status
  //       isReachable
  //           ? const SizedBox.shrink()
  //           : const Padding(
  //               padding: EdgeInsets.all(8.0),
  //               child: Text(
  //                 "⚠️ ABD1234 IS UNREACHABLE !",
  //                 style:
  //                     TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //       // Data metrics
  //       _buildMetricRow("Steam Pressure", steamPressure, "bar",
  //           "assets/steam_pressure.png"),
  //       _buildMetricRow(
  //           "Steam Flow", steamFlow, "t/h", "assets/steam_flow.png"),
  //       _buildMetricRow(
  //           "Water Level", waterLevel, "%", "assets/water_level.png"),
  //       _buildMetricRow("Power Frequency", powerFrequency, "Hz",
  //           "assets/power_frequency.png"),
  //       const SizedBox(height: 16),
  //       Text("2024-04-26 13:45:25"), // Placeholder timestamp
  //     ],
  //   );
  // }

  // // Function to build each metric row
  // Widget _buildMetricRow(
  //     String title, double value, String unit, String imagePath) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       Column(
  //         children: [
  //           Text(title),
  //           SizedBox(
  //             height: 100,
  //             width: 100,
  //             child: Image.asset(imagePath), // Replace with actual image widget
  //           ),
  //           Text("$value $unit"),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // void _onFactorySelected(int factoryIndex) {
  //   setState(() {
  //     _selectedFactory = factoryIndex;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Factory Monitor'),
  //     ),
  //     body: _selectedIndex == 1 && _selectedFactory == 1
  //         ? ListView.builder(
  //             itemCount: _contacts.length,
  //             itemBuilder: (context, index) {
  //               return Card(
  //                 child: ListTile(
  //                   title: Text(_contacts[index]['name']!),
  //                   subtitle: Text(_contacts[index]['phone']!),
  //                 ),
  //               );
  //             },
  //           )
  //         : _buildFactoryData(
  //             _selectedFactory), // Show factory data for other selections
  //     bottomNavigationBar: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         // Scrollable row of factory buttons
  //         SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             children: [
  //               for (int i = 1; i <= 5; i++)
  //                 ElevatedButton(
  //                   onPressed: () => _onFactorySelected(i),
  //                   child: Text("Factory $i"),
  //                 ),
  //             ],
  //           ),
  //         ),
  //         // Bottom navigation bar
  //         BottomNavigationBar(
  //           items: const <BottomNavigationBarItem>[
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.person),
  //               label: 'Profile',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.home),
  //               label: 'Contacts',
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.settings),
  //               label: 'Settings',
  //             ),
  //           ],
  //           currentIndex: _selectedIndex,
  //           onTap: _onItemTapped,
  //         ),
  //       ],
  //     ),
  //     floatingActionButton: _selectedIndex == 1 && _selectedFactory == 1
  //         ? FloatingActionButton(
  //             onPressed: () {}, // Add contact action
  //             child: const Icon(Icons.add),
  //           )
  //         : null, // Hide FAB for other views
  //   );
  // }




















  // int currentIndex = 1;
  // int factoryName = 1;
  // Color factory1 = Colors.blue;
  // Color factory2 = Colors.grey;
  // Color factory3 = Colors.grey;
  // Color factory4 = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(178, 251, 247, 247),
      // appBar: AppBar(
      //   title: Text(
      //     'Factory $factoryName',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      //   ),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.settings),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 height: MediaQuery.of(context).size.height * 0.61,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 224, 221, 221),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: currentIndex == 1
//                     ? factoryName == 2
//                         ? SingleChildScrollView(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Text(
//                                   '1549.7kW',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 30),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.22,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Steam Pressure',
//                                               style: TextStyle(fontSize: 17)),
//                                           Image.asset('images/F2.1.png'),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text('34.19',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 23)),
//                                               Text(' bar',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15)),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.22,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Steam Flow',
//                                               style: TextStyle(fontSize: 17)),
//                                           Image.asset('images/F2.2.png'),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text('22.82',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 23)),
//                                               Text(' T/H',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15)),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.22,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Water Level',
//                                               style: TextStyle(fontSize: 17)),
//                                           Image.asset('images/F2.3.png'),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text('55.41',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 23)),
//                                               Text(' %',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15)),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.22,
//                                       padding: EdgeInsets.all(10),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Power Frequency',
//                                               style: TextStyle(fontSize: 17)),
//                                           Image.asset('images/F2.4.png'),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text('50.08',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 23)),
//                                               Text(' Hz',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 15)),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
                                // SizedBox(height: 15),
                                // Text(
                                //   '${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}',
                                //   style: TextStyle(fontSize: 18),
                                // )
//                               ],
//                             ),
//                           )
//                         : factoryName == 1
//                             ? SingleChildScrollView(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           '⚠️  ABD1234 IS UNREACHABLE !',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 22),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.4,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.22,
//                                           padding: EdgeInsets.all(10),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('Steam Pressure',
//                                                   style:
//                                                       TextStyle(fontSize: 17)),
//                                               Image.asset('images/F1.1.png'),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text('0.0',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 23)),
//                                                   Text(' bar',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 15)),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.4,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.22,
//                                           padding: EdgeInsets.all(10),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('Steam Flow',
//                                                   style:
//                                                       TextStyle(fontSize: 17)),
//                                               Image.asset('images/F1.2.png'),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text('0.0',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 23)),
//                                                   Text(' T/H',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 15)),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.4,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.22,
//                                           padding: EdgeInsets.all(10),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('Water Level',
//                                                   style:
//                                                       TextStyle(fontSize: 17)),
//                                               Image.asset('images/F1.3.png'),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text('0.0',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 23)),
//                                                   Text(' %',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 15)),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.4,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.22,
//                                           padding: EdgeInsets.all(10),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('Power Frequency',
//                                                   style:
//                                                       TextStyle(fontSize: 17)),
//                                               Image.asset('images/F1.4.png'),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text('0.0',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 23)),
//                                                   Text(' Hz',
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 15)),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 9),
//                                     Text(
//                                       '-- : --',
//                                       style: TextStyle(fontSize: 23),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             : Container()
//                     : currentIndex == 0
//                         ? factoryName == 1
                            // ? Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       SizedBox(
                            //         height: 20,
                            //       ),
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         width:
                            //             MediaQuery.of(context).size.width * 0.8,
                            //         height: MediaQuery.of(context).size.height *
                            //             0.12,
                            //         child: Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 10.0, top: 20),
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.only(
                            //                     left: 25.0),
                            //                 child: Text('Ben',
                            //                     style: TextStyle(fontSize: 23)),
                            //               ),
                            //               Row(
                            //                 children: [
                            //                   Container(
                            //                     height: 10,
                            //                     width: 10,
                            //                     decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(20),
                            //                       color: Colors.grey.shade700,
                            //                     ),
                            //                   ),
                            //                   SizedBox(
                            //                     width: 15,
                            //                   ),
                            //                   Text('+60109219938',
                            //                       style:
                            //                           TextStyle(fontSize: 23)),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         height: 20,
                            //       ),
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         width:
                            //             MediaQuery.of(context).size.width * 0.8,
                            //         height: MediaQuery.of(context).size.height *
                            //             0.12,
                            //         child: Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 10.0, top: 20),
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.only(
                            //                     left: 25.0),
                            //                 child: Text('Testing 1',
                            //                     style: TextStyle(fontSize: 23)),
                            //               ),
                            //               Row(
                            //                 children: [
                            //                   Container(
                            //                     height: 10,
                            //                     width: 10,
                            //                     decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(20),
                            //                       color: Colors.grey.shade700,
                            //                     ),
                            //                   ),
                            //                   SizedBox(
                            //                     width: 15,
                            //                   ),
                            //                   Text('+601234567891',
                            //                       style:
                            //                           TextStyle(fontSize: 23)),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(height: 20),
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         width:
                            //             MediaQuery.of(context).size.width * 0.8,
                            //         height: MediaQuery.of(context).size.height *
                            //             0.12,
                            //         child: Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 10.0, top: 20),
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.only(
                            //                     left: 25.0),
                            //                 child: Text('Hello',
                            //                     style: TextStyle(fontSize: 23)),
                            //               ),
                            //               Row(
                            //                 children: [
                            //                   Container(
                            //                     height: 10,
                            //                     width: 10,
                            //                     decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(20),
                            //                       color: Colors.grey.shade700,
                            //                     ),
                            //                   ),
                            //                   SizedBox(
                            //                     width: 15,
                            //                   ),
                            //                   Text('+60123456789',
                            //                       style:
                            //                           TextStyle(fontSize: 23)),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                                  // SizedBox(
                                  //   height: 75,
                                  // ),
                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: Padding(
                                  //     padding:
                                  //         const EdgeInsets.only(right: 20.0),
                                  //     child: SizedBox(
                                  //       width:
                                  //           MediaQuery.of(context).size.width *
                                  //               0.20,
                                  //       height: 50,
                                  //       child: ElevatedButton(
                                  //         onPressed: () {
                                  //           Navigator.of(context).push(
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     const invitationPage()),
                                  //           );
                                  //         },
                                  //         style: ElevatedButton.styleFrom(
                                  //             shape: RoundedRectangleBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         15))),
                                  //         child: Icon(
                                  //           Icons.add,
                                  //           size: 30,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                            //     ],
                            //   )
                            // : Container()
//                         : factoryName == 1
//                             ? Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 30.0, left: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text('Minimum Treshold',
//                                             style: TextStyle(
//                                                 fontSize: 23,
//                                                 fontWeight: FontWeight.bold)),
//                                         SizedBox(
//                                           width: 15,
//                                         ),
                                        // Icon(
                                        //   Icons.info,
                                        //   size: 20,
                                        // ),
//                                         SizedBox(
//                                           width: 23,
//                                         ),
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //     // Handle button press
                                        //   },
                                        //   child: Icon(
                                        //     Icons.edit,
                                        //     size: 30,
                                        //   ),
                                        // ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           child: Column(
//                                             children: [
//                                               Text('Steam\nPressure',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: 23,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
                                              // Container(
                                              //   width: MediaQuery.of(context)
                                              //           .size
                                              //           .width *
                                              //       0.35,
                                              //   height: MediaQuery.of(context)
                                              //           .size
                                              //           .height *
                                              //       0.07,
                                              //   padding: EdgeInsets.all(10),
                                              //   decoration: BoxDecoration(
                                              //       color: Colors.white,
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               10),
                                              //       border: Border.all(
                                              //           color: Colors.grey,
                                              //           width: 1.5)),
                                                // child: Row(
                                                //   children: [
                                                //     Expanded(
                                                //       flex: 1,
                                                //       child: Padding(
                                                //         padding:
                                                //             const EdgeInsets
                                                //                 .symmetric(
                                                //                 horizontal: 8),
                                                //         child: Text('29',
                                                //             textAlign: TextAlign
                                                //                 .center,
                                                //             style: TextStyle(
                                                //                 fontSize: 25,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold)),
                                                //       ),
                                                //     ),
                                                //     VerticalDivider(
                                                //       color: Colors.grey,
                                                //       thickness: 2.5,
                                                //     ),
                                                //     Text(' bar ',
                                                //         style: TextStyle(
                                                //             fontSize: 17,
                                                //             fontWeight:
                                                //                 FontWeight
                                                //                     .bold))
                                                //   ],
                                                // ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text('Steam\nFlow',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: 23,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.35,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.07,
//                                                 padding: EdgeInsets.all(10),
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     border: Border.all(
//                                                         color: Colors.grey,
//                                                         width: 1.5)),
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       flex: 1,
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .symmetric(
//                                                                 horizontal: 8),
//                                                         child: Text('22',
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                             style: TextStyle(
//                                                                 fontSize: 25,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                       ),
//                                                     ),
//                                                     VerticalDivider(
//                                                       color: Colors.grey,
//                                                       thickness: 2.5,
//                                                     ),
//                                                     Text(' T/H ',
//                                                         style: TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold))
//                                                   ],
//                                                   // children: [
//                                                   //   Padding(
//                                                   //     padding:
//                                                   //         const EdgeInsets.only(
//                                                   //             left: 23),
//                                                   //     child: Text('22',
//                                                   //         style: TextStyle(
//                                                   //             fontSize: 25,
//                                                   //             fontWeight:
//                                                   //                 FontWeight
//                                                   //                     .bold)),
//                                                   //   ),
//                                                   //   SizedBox(
//                                                   //     width: 13,
//                                                   //   ),
//                                                   //   VerticalDivider(
//                                                   //     color: Colors.grey,
//                                                   //     thickness: 2.5,
//                                                   //   ),
//                                                   //   SizedBox(
//                                                   //     width: 2,
//                                                   //   ),
//                                                   //   Text('T/H',
//                                                   //       style: TextStyle(
//                                                   //           fontSize: 17,
//                                                   //           fontWeight:
//                                                   //               FontWeight
//                                                   //                   .bold))
//                                                   // ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 40,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           child: Column(
//                                             children: [
//                                               Text('Water\nLevel',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: 23,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.35,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.07,
//                                                 padding: EdgeInsets.all(10),
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     border: Border.all(
//                                                         color: Colors.grey,
//                                                         width: 1.5)),
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       flex: 1,
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .symmetric(
//                                                                 horizontal: 8),
//                                                         child: Text('53',
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                             style: TextStyle(
//                                                                 fontSize: 25,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                       ),
//                                                     ),
//                                                     VerticalDivider(
//                                                       color: Colors.grey,
//                                                       thickness: 2.5,
//                                                     ),
//                                                     Text(' % ',
//                                                         style: TextStyle(
//                                                             fontSize: 19,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold))
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                           child: Column(
//                                             children: [
//                                               Text('Power\nFrequency',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: 23,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.35,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.07,
//                                                 padding: EdgeInsets.all(10),
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     border: Border.all(
//                                                         color: Colors.grey,
//                                                         width: 1.5)),
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       flex: 1,
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .symmetric(
//                                                                 horizontal: 8),
//                                                         child: Text('48',
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                             style: TextStyle(
//                                                                 fontSize: 25,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                       ),
//                                                     ),
//                                                     VerticalDivider(
//                                                       color: Colors.grey,
//                                                       thickness: 2.5,
//                                                     ),
//                                                     Text(' Hz ',
//                                                         style: TextStyle(
//                                                             fontSize: 17,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold))
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : Container(),
//               ),
              // SizedBox(
              //   height: 20,
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         width: 20,
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             factory1 = Colors.blue;
              //             factory2 = Colors.grey;
              //             factory3 = Colors.grey;
              //             factory4 = Colors.grey;
              //             factoryName = 1;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: factory1, width: 3)),
              //           width: MediaQuery.of(context).size.width * 0.4,
              //           height: MediaQuery.of(context).size.height * 0.12,
              //           padding: EdgeInsets.all(10),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Icon(
              //                 Icons.factory,
              //                 size: 30,
              //               ),
              //               Text('Factory 1', style: TextStyle(fontSize: 23)),
              //             ],
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             factory1 = Colors.grey;
              //             factory2 = Colors.blue;
              //             factory3 = Colors.grey;
              //             factory4 = Colors.grey;

              //             factoryName = 2;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: factory2, width: 3)),
              //           width: MediaQuery.of(context).size.width * 0.4,
              //           height: MediaQuery.of(context).size.height * 0.12,
              //           padding: EdgeInsets.all(10),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Icon(
              //                 Icons.factory,
              //                 size: 30,
              //               ),
              //               Text('Factory 2', style: TextStyle(fontSize: 23)),
              //             ],
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             factory1 = Colors.grey;
              //             factory2 = Colors.grey;
              //             factory3 = Colors.blue;
              //             factoryName = 3;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: factory3, width: 3)),
              //           width: MediaQuery.of(context).size.width * 0.4,
              //           height: MediaQuery.of(context).size.height * 0.12,
              //           padding: EdgeInsets.all(10),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Icon(
              //                 Icons.factory,
              //                 size: 30,
              //               ),
              //               Text('Factory 3', style: TextStyle(fontSize: 23)),
              //             ],
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             factory1 = Colors.grey;
              //             factory2 = Colors.grey;
              //             factory3 = Colors.grey;
              //             factory4 = Colors.blue;
              //             factoryName = 3;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: factory4, width: 3)),
              //           width: MediaQuery.of(context).size.width * 0.4,
              //           height: MediaQuery.of(context).size.height * 0.12,
              //           padding: EdgeInsets.all(10),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Icon(
              //                 Icons.factory,
              //                 size: 30,
              //               ),
              //               Text('Factory 4', style: TextStyle(fontSize: 23)),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
            //   // ),
            // ]),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentIndex,
//           onTap: (int index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: '',
//             ),
//           ]),
//     );
//   }
// }
