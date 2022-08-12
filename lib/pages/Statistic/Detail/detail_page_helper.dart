import 'package:openapi/openapi.dart';
import 'package:darq/darq.dart';

class DetailPageHelper {
  static List<Duration> getDuration(
      bool Function(SmartHookahModelsDbPuf) predicate, List<SmartHookahModelsDbPuf> pufs) {
    var result = <Duration>[];
    for (var i = 1; i < pufs.length; i++) {
      if (predicate(pufs[i - 1])) {
        var t = new Duration(milliseconds: pufs[i].M! - pufs[i - 1].M!);

        if (predicate(pufs[i - 1]) == predicate(pufs[i])) {}

        if (t.inMilliseconds > 0) {
          result.add(t);
        } else {
          result.add(new Duration());
        }
      }
    }
    return result;
  }

  static List<List<SmartHookahModelsDbPuf>> createHistogram(List<SmartHookahModelsDbPuf> pufs, int i) {
    var pufCollection = new List.from(pufs);
    var start = new DateTime.fromMillisecondsSinceEpoch(
        pufCollection.min((a, b) => a.D.millisecondsSinceEpoch < b.D.millisecondsSinceEpoch));
    var end = start.add(new Duration(seconds: i));
    var result = new List<List<SmartHookahModelsDbPuf>>();
    var bucket = new List<SmartHookahModelsDbPuf>();
    var orderpufs = pufCollection.orderBy((s) => s.D.millisecondsSinceEpoch).toList();
    for (int j = 0; j < orderpufs.length; j++) {
      var puf = orderpufs[j];
      if (puf.D.millisecondsSinceEpoch >= start.millisecondsSinceEpoch &&
          puf.D.millisecondsSinceEpoch < end.millisecondsSinceEpoch) {
        bucket.add(puf);
      } else {
        start = end;
        end = start.add(new Duration(seconds: i));

        if (bucket.length > 0 && bucket.length % 2 == 0 && puf.T == 0) {
          bucket.add(puf);
        }

        result.add(bucket);
        bucket = new List<SmartHookahModelsDbPuf>();
        if (puf.T != 0) j--;
      }
    }
    return result;
  }
}
