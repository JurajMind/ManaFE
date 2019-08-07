import 'package:app/components/SmokeSession/smoke_session_list_item.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

class AllStatisticPage extends StatefulWidget {
  final List<SmokeSessionSimpleDto> seed;

  AllStatisticPage({Key key, this.seed}) : super(key: key);

  @override
  _AllStatisticPageState createState() => _AllStatisticPageState();
}

class _AllStatisticPageState extends State<AllStatisticPage> {
  BehaviorSubject<List<SmokeSessionSimpleDto>> smokeSessions;

  @override
  void initState() {
    smokeSessions =
        new BehaviorSubject<List<SmokeSessionSimpleDto>>.seeded(widget.seed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(height: 60,),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sessions'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<SmokeSessionSimpleDto>>(
        stream: smokeSessions,
        initialData: widget.seed,
        builder: (BuildContext context, snapshot) {
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return SmokeSessionListItem(session: snapshot.data[index]);
                }),
          );
        },
      ),
    );
  }
}
