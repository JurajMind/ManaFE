import 'package:app/main.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/openapi.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var person = getIt.get<PersonBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black.withOpacity(0.3),
        child: StreamBuilder<PersonInfoDto>(
            stream: person.info,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(FontAwesomeIcons.user),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('Person info', style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Text(
                              'Name :',
                              style: Theme.of(context).textTheme.headline6,
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data?.displayName ?? '...',
                              style: Theme.of(context).textTheme.headline6,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Text(
                              'Email :',
                              style: Theme.of(context).textTheme.headline6,
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              snapshot.data?.email ?? '...',
                              style: Theme.of(context).textTheme.headline6,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
