import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'Bloc/events_graphs/events_graphs_bloc.dart';
import 'Models/databasemodels/firebasemodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events Graphs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events Graphs"),
      ),
      body: BlocProvider(
        create: (context) => EventsGraphsBloc()..updateStream(),
        child: BlocBuilder<EventsGraphsBloc, EventsGraphsState>(
          builder: (context, state) {
            // List<FirebaseCampaignBeneficiary> audience = [];
            // audience.addAll(state.expected);
            // audience.addAll(state.actual);

            // final List<ChartData2> nominationPartyList = List.generate(
            //     audience.length,
            //         (index) => ChartData2(
            //         audience[index].nominationParty == ""
            //             ? "غير محدد"
            //             :audience[index].nominationParty ?? "غير محدد",
            //         audience
            //             .where((element) =>
            //         element.nominationParty ==
            //             audience[index].nominationParty)
            //             .length,
            //         state.expected.where((element) => element.nominationParty == audience[index].nominationParty).length
            //     ));

            // final List<ChartData> scannerPersonList = List.generate(
            //     audience.length,
            //     (index) => ChartData(
            //         audience[index].benefits?[0].addedBy == ""
            //             ? "غير محدد"
            //             : (audience[index].benefits?[0].addedBy ?? "غير محدد"),
            //         audience
            //             .where((element) =>
            //                 element.benefits?[0].addedBy ==
            //                 audience[index].benefits?[0].addedBy)
            //             .length));

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          Text(
                            'إجمالي العدد: ${((state.countExpected) + (state.unExpected.length))}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                  title: AxisTitle(text: "الجمعيات")),
                              primaryYAxis: NumericAxis(
                                  title: AxisTitle(text: "عدد الحضور"),
                                  interval: 1),
                              tooltipBehavior:
                                  TooltipBehavior(enable: true, header: ""),
                              series: <ChartSeries<ChartData2, String>>[
                                // Renders column chart
                                ColumnSeries<ChartData2, String>(
                                    dataSource: state.nominationPartyList,
                                    // color: AppColors.redOrangeColor,
                                    xValueMapper: (ChartData2 data, _) =>
                                        data.name,
                                    yValueMapper: (ChartData2 data, _) =>
                                        data.count),
                                // ColumnSeries<ChartData2, String>(
                                //     color: const Color(0xFF3DD598),
                                //     opacity: 0.9,
                                //     width: 0.4,
                                //     dataSource: nominationPartyList,
                                //     xValueMapper: (ChartData2 data, _) => data.name,
                                //     yValueMapper: (ChartData2 data, _) => data.total
                                // )
                              ]),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 10,),
                    // Container(
                    //   padding: const EdgeInsets.all(20.0),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       border: Border.all(color: Colors.black)),
                    //   child: Column(
                    //     children: [
                    //       // Text(
                    //       //   'إجمالي العدد: ${((state.actual.length) + (state.unExpected.length))}',
                    //       //   style: const TextStyle(
                    //       //     fontSize: 18,
                    //       //     fontFamily: 'Cairo',
                    //       //   ),
                    //       // ),
                    //       SfCartesianChart(
                    //           primaryXAxis: CategoryAxis(
                    //               title: AxisTitle(text: "الاشخاص")),
                    //           primaryYAxis: NumericAxis(
                    //               title: AxisTitle(text: "العدد المسجل"),
                    //               interval: 1),
                    //           tooltipBehavior: TooltipBehavior(enable: true,header: ""),
                    //           series: <ChartSeries<ChartData, String>>[
                    //             // Renders column chart
                    //             ColumnSeries<ChartData, String>(
                    //                 dataSource: scannerPersonList,
                    //                 xValueMapper: (ChartData data, _) =>
                    //                 data.name,
                    //                 yValueMapper: (ChartData data, _) =>
                    //                 data.count)
                    //           ]),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ChartData {
  ChartData(
    this.name,
    this.count,
  );

  final String name;
  final int count;
}
class ChartData2 extends Equatable{
  const ChartData2(
      this.name,
      this.count,
      this.total,
      );

  final String name;
  final int count;
  final int total;

  @override
  // TODO: implement props
  List<Object?> get props => [name,count,total];
}
