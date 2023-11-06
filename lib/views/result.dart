// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';


import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: const Color(0xff764abc),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: 'Result'),
            const Tab(text: 'Date Sheet'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Result(),
          DateSheetSection(),
        ],
      ),
    );
  }
}

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xff764abc))),
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.65,
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ListTile(
                  title: Text('John Doe'),
                  subtitle: Text('Roll No: 123456'),
                ),
                const SizedBox(height: 10),
                const Text('Semester 1 Results'),
                const Divider(
                  thickness: 2.0,
                ),
                DataTable(
                  columnSpacing: 350,
                  columns: const [
                    DataColumn(label: Expanded(child: Text('Subject'))),
                    DataColumn(label: Expanded(child: Text(''))),
                    DataColumn(label: Expanded(child: Text('Marks'))),
                    DataColumn(label: Expanded(child: Text(''))),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('Maths')),
                      DataCell(Text('')),
                      DataCell(Text('90')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Maths')),
                      DataCell(Text('')),
                      DataCell(Text('90')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Science')),
                      DataCell(Text('')),
                      DataCell(Text('85')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('English')),
                      DataCell(Text('')),
                      DataCell(Text('95')),
                      DataCell(Text('')),
                    ]),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Marks: 270'),
                    Text('Percentage: 90%'),
                  ],
                ),

                ///////////////

                const Divider(
                  thickness: 2.0,
                ),
                const SizedBox(height: 10),
                const Text('Semester 2 Results'),
                const Divider(
                  thickness: 2.0,
                ),
                DataTable(
                  columnSpacing: 350,
                  columns: const [
                    DataColumn(label: Expanded(child: Text('Subject'))),
                    DataColumn(label: Expanded(child: Text(''))),
                    DataColumn(label: Expanded(child: Text('Marks'))),
                    DataColumn(label: Expanded(child: Text(''))),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('Maths')),
                      DataCell(Text('')),
                      DataCell(Text('90')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Maths')),
                      DataCell(Text('')),
                      DataCell(Text('90')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Science')),
                      DataCell(Text('')),
                      DataCell(Text('85')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('English')),
                      DataCell(Text('')),
                      DataCell(Text('95')),
                      DataCell(Text('')),
                    ]),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Marks: 270'),
                    Text('Percentage: 90%'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class DateSheetSection extends StatelessWidget {
  const DateSheetSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xff764abc))),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.65,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left : 130.0),
                  child: ListTile(
                    title:  Text('University of Jhang' , style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
                    subtitle:  Text('Semester Date Sheet - Exam timings are from 9:00-12:00'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DataTable(
                columns: const [
                   DataColumn(label:  Text('Day')),
                   DataColumn(label: Text('Date')),
                   DataColumn(label: Text('Subject')),
                   DataColumn(label: Text('Room')),
                ],
                rows: const [
                   DataRow(cells: [
                     DataCell( Text('Monday')),
                     DataCell( Text('10th May, 2023')),
                     DataCell( Text('Maths')),
                    DataCell(Text('101')),
                  ]),
                   DataRow(cells: [
                     DataCell(Text('Tuesday')),
                     DataCell( Text('11th May, 2023')),
                     DataCell(Text('Science')),
                    DataCell(Text('102')),
                  ]),
                   DataRow(cells: [
                    DataCell( Text('Wednesday')),
                     DataCell( Text('12th May, 2023')),
                     DataCell( Text('English')),
                    DataCell(Text('103')),
                  ]),
                   DataRow(cells: [
                    DataCell( Text('Thursday')),
                     DataCell(Text('13th May, 2023')),
                     DataCell(Text('History')),
                    DataCell(Text('104')),
                  ]),
                    DataRow(cells: [
                    DataCell(Text('Firday')),
                     DataCell( Text('14th May, 2023')),
                     DataCell(Text('OOP & Data Structures')),
                    DataCell(Text('104')),
                  ]),
                    DataRow(cells: [
                    DataCell(Text('Monday')),
                     DataCell(Text('17th May, 2023')),
                     DataCell( Text('Programming')),
                    DataCell(Text('101')),
                  ]),
                    DataRow(cells: [
                    DataCell(Text('Tuesday')),
                     DataCell(Text('18th May, 2023')),
                     DataCell(Text('Programming Lab')),
                     DataCell(Text('102')),
                  ]),
                    DataRow(cells: [
                     DataCell( Text('Wednesday')),
                     DataCell( Text('19th May, 2023')),
                     DataCell(Text('Islamic Studies')),
                     DataCell( Text('104')),
                  ]),
                    DataRow(cells: [
                     DataCell(Text('Thursday')),
                     DataCell(Text('20th May, 2023')),
                     DataCell( Text('History - II')),
                     DataCell( Text('102')),
                  ]),
                    DataRow(cells: [
                     DataCell( Text('Firday')),
                     DataCell( Text('21st May, 2023')),
                     DataCell( Text('History')),
                     DataCell(Text('103')),
                  ]),
                   
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



