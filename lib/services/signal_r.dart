import 'dart:convert';
import 'package:app/app/app.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'package:web_socket_channel/io.dart';

class SignalR {
  static String host = App.baseUri;
  static String url = 'https://$host/signalr';
  final conectionData = Uri.encodeComponent('[{"name":"smokesessionhub"}]');
  NegotiateResponse connectionInfo;

  IOWebSocketChannel _channel;

  BehaviorSubject<SmokeSessionData> UpdateStats =
      new BehaviorSubject<SmokeSessionData>();
      
        bool connection = false;
      
        Future<dynamic> conect() async {
          if (this.connection) {
            return;
          }
          var negotiateUrl =
              url + '/negotiate?clientProtocol=1.5&connectionData=$conectionData';
          var response = await http.get(negotiateUrl);
          var connection = false;
          final responseJson = json.decode(response.body);
      
          var negotiateResponse = NegotiateResponse.fromJson(responseJson);
          connectionInfo = negotiateResponse;
      
          var chanelUlr =
              "wss://$host/signalr/connect?transport=webSockets&clientProtocol=${negotiateResponse.ProtocolVersion}&connectionToken=${Uri.encodeComponent(negotiateResponse.ConnectionToken)}&connectionData=$conectionData";
      
          print(chanelUlr);
      
          try {
            _channel = new IOWebSocketChannel.connect(chanelUlr);
            _channel.stream.listen((message) async {
              print('From signal ' + message);
              var serverCall = ClientCall.fromJson(json.decode(message));
      
              ProceedCall(serverCall);
      
              print(serverCall.GroupToken);
            });
          } catch (e) {
            print(e);
          }
      
          await startConnection(negotiateResponse);
        }
      
        Future startConnection(NegotiateResponse negotiateResponse) async {
          if (connection) return;
          connection = true;
          var startUrl = url +
              '/start?transport=webSockets&clientProtocol=1.5&connectionToken=${Uri.encodeComponent(negotiateResponse.ConnectionToken)}&connectionData=$conectionData';
          print(startUrl);
      
          var connect = await http.get(startUrl);
      
          print(connect.body);
        }
      
        BehaviorSubject<ClientCall> clientCalls = new BehaviorSubject<ClientCall>();
      
        sendMsg(String data) {}
      
        callServerFunction({String name, List<String> params}) {
          var call = new ServerCall(A: params, M: name);
          _channel.sink.add(call.toJson());
        }
      
        void ProceedCall(ClientCall serverCall) {
          if (serverCall.Data != null) clientCalls.add(serverCall);
        }
      }
      
      class SmokeSessionData {
}
