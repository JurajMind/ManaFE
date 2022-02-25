import 'package:app/app/app.dart';
import 'package:app/components/LazyScroll/lazy_load_scroll_view.dart';
import 'package:app/components/Mixology/mixology_expanded.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/mixology/mix_card_expanded_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openapi/api.dart';
import 'package:rxdart/rxdart.dart';

import 'feature_mix_info.dart';

class FeatureMixListView extends StatefulWidget {
  const FeatureMixListView({
    Key key,
    this.mixCreator,
  }) : super(key: key);

  final FeatureMixCreatorSimpleDto mixCreator;

  @override
  _FeatureMixListViewState createState() => _FeatureMixListViewState();
}

class _FeatureMixListViewState extends State<FeatureMixListView> {
  BehaviorSubject<FeatureMixCreatorDto> creatorInfo = new BehaviorSubject<FeatureMixCreatorDto>();

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var mixologyBloc = DataProvider.getData(context).mixologyBloc;
      mixologyBloc.loadCreatorMixesNextPage(widget.mixCreator.id.toString(), true);

      App.http.getFeatureCreatorInfo(widget.mixCreator.id).then((info) => creatorInfo.add(info));
    });
  }

  @override
  Widget build(BuildContext context) {
    var mixologyBloc = DataProvider.getData(context).mixologyBloc;
    return Container(
      child: StreamBuilder<List<TobaccoMixSimpleDto>>(
          stream: mixologyBloc.getCreatorMixes(widget.mixCreator.id.toString()),
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var itemCount = 10;
            if (snapshot?.data?.length != null) {
              itemCount = snapshot.data.length + 2;
            }
            return LazyLoadScrollView(
              onRefresh: () => mixologyBloc.loadCreatorMixesRefresh(widget.mixCreator.id.toString(), true),
              onEndOfPage: () {
                if (!snapshot.data.contains(null))
                  mixologyBloc.loadCreatorMixesNextPage(widget.mixCreator.id.toString(), true);
              },
              child: ListView.builder(
                itemCount: itemCount ?? 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return FeatureMixInfo(
                      creatorInfo: creatorInfo,
                      simple: widget.mixCreator,
                    );
                  }

                  if (index == snapshot.data.length + 1) {
                    return SizedBox(height: 100);
                  }

                  if (snapshot.data != null && snapshot.data[index - 1] != null) {
                    return Slidable(
                      child: MixCardExpanded(tobaccoMix: snapshot.data[index - 1]),
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            backgroundColor: Colors.green,
                            icon: FontAwesomeIcons.thumbsUp,
                            label: 'Like',
                            onPressed: (_) {},
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            backgroundColor: Colors.green,
                            icon: FontAwesomeIcons.thumbsUp,
                            label: 'Dislike',
                            onPressed: (_) {},
                          ),
                          SlidableAction(
                            onPressed: (_) {},
                            backgroundColor: Colors.red,
                            icon: FontAwesomeIcons.thumbsDown,
                            label: 'Share',
                          ),
                        ],
                      ),
                    );
                  } else {
                    return MixCardExpandedShimmer();
                  }
                },
              ),
            );
          }),
    );
  }
}
