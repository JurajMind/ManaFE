import 'package:app/pages/Gear/pipe_accesory_page.dart';
import 'package:app/pages/Mixology/mix_detail_page.dart';
import 'package:app/pages/Places/place_detail_page.dart';
import 'package:app/pages/Statistic/Detail/smoke_session_detail_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class ShareService {
  static const _urlPrefix = 'https://manapipes.page.link';
  static const _appUrl = 'https://app.manapipes.com';

  static Future<Uri> mixShareLink(TobaccoMixSimpleDto mixId) async {
    var link = Uri.parse(_appUrl + "/mix/${mixId.id}");
    return await createDynamicLink(
        true, link.toString(), "Mix ${mixId.name}", "Someone shered you a mix");
  }

  static Future<Uri> placeShareLink(PlaceSimpleDto place) async {
    var link = Uri.parse(_appUrl + "/place/${place.id}");
    return await createDynamicLink(
        true, link.toString(), "${place.name}", "Someone shered you a place");
  }

  static Future<Uri> gearShareLink(PipeAccesorySimpleDto gear) async {
    var link = Uri.parse(_appUrl + "/gear/${gear.id}");
    return await createDynamicLink(
        true, link.toString(), "${gear.name}", "Someone shered you a gear");
  }

  static Future<Uri> tobaccoShareLink(PipeAccesorySimpleDto gear) async {
    var link = Uri.parse(_appUrl + "/tobacco/${gear.id}");
    return await createDynamicLink(
        true, link.toString(), "${gear.name}", "Someone shered you a tobacco");
  }

  static Future<Uri> sessionShareLink(SmokeSessionSimpleDto session) async {
    var link = Uri.parse(_appUrl + "/session/${session.id}");
    return await createDynamicLink(true, link.toString(),
        "${session.sessionId}", "Someone shered you a session");
  }

  static Future<Uri> createDynamicLink(
      bool short, String inputUrl, String socTitle, String socDesc) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: _urlPrefix,
        link: Uri.parse(inputUrl),
        androidParameters: AndroidParameters(
          packageName: 'com.manapipes.app',
          minimumVersion: 0,
        ),
        dynamicLinkParametersOptions: DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
        ),
        iosParameters: IosParameters(
          bundleId: 'com.manapipes.dev',
          minimumVersion: '0',
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
          title: socTitle,
          description: socDesc,
        ));

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }

    return url;
  }

  static void deepLinkNavigation(
      GlobalKey<NavigatorState> Function(int) callback,
      String link,
      BuildContext context) async {
    var chunk = link.split('/');
    switch (chunk[1]) {
      case 'mix':
        {
          var navigator = callback(0);
          var mixId = int.parse(chunk[2]);
          navigator.currentState.push(MaterialPageRoute(
              builder: (context) => MixDetailPage(
                    mixId: mixId,
                  )));
          break;
        }
      case 'place':
        {
          var navigator = callback(1);
          var placeId = int.parse(chunk[2]);
          navigator.currentState.push(MaterialPageRoute(
              builder: (context) => PlaceDetailPage(
                    placeId: placeId,
                  )));
          break;
        }
      case 'gear':
        {
          var navigator = callback(3);
          var gearId = int.parse(chunk[2]);
          navigator.currentState.push(MaterialPageRoute(
              builder: (context) => PipeAccesoryPage(
                    pipeAccesoryId: gearId,
                  )));
          break;
        }
      case 'session':
        {
          var navigator = callback(3);
          var sessionId = int.parse(chunk[2]);
          navigator.currentState.push(MaterialPageRoute(
              builder: (context) => SmokeSessioDetailPage(
                    sessionId: sessionId,
                  )));
          break;
        }
    }
  }
}
