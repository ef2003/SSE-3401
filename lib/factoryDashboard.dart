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
      body: SingleChildScrollView(
        child: Column(children: [
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
                                Expanded(
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
                                SizedBox(
                                  height: 30,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, bottom: 20.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                                      BorderRadius.circular(
                                                          15))),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                                        padding:
                                            const EdgeInsets.only(right: 10),
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
      ),
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
