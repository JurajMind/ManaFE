import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:rxdart/rxdart.dart';

import '../../../const/theme.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  BehaviorSubject<List<SmartHookahModelsRedisCompetitionEntry>> result =
      new BehaviorSubject<List<SmartHookahModelsRedisCompetitionEntry>>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  Future<dynamic> loadResult() {
    return App.http!.getCompetitionResult().then((onValue) => result.add(onValue));
  }

  @override
  void initState() {
    loadResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: AppColors.freyaBlack,
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder<List<SmartHookahModelsRedisCompetitionEntry>>(
          stream: result,
          initialData: null,
          builder: (BuildContext context, snapshot) {
            if (snapshot == null)
              return Center(
                child: CircularProgressIndicator(),
              );

            return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () => loadResult(),
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return ListTile(
                      leading: Text((index + 1).toString(), style: Theme.of(context).textTheme.titleLarge),
                      title: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                data.name!,
                                style: Theme.of(context).textTheme.headlineSmall,
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Time:' + data.time!.toStringAsFixed(3),
                                style: Theme.of(context).textTheme.headlineSmall,
                              ))
                        ],
                      ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
