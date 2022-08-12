import 'dart:convert';

class NegotiateResponse {
  final String? Url;
  final String? ConnectionToken;
  final String? ConnectionId;
  final double? KeepAliveTimeout;
  final double? DisconnectTimeout;
  final double? ConnectionTimeout;
  final bool? TryWebSockets;
  final String? ProtocolVersion;
  final double? TransportConnectTimeout;
  final double? LongPollDelay;

  NegotiateResponse(
      {this.Url,
      this.ConnectionToken,
      this.ConnectionId,
      this.KeepAliveTimeout,
      this.DisconnectTimeout,
      this.ConnectionTimeout,
      this.TryWebSockets,
      this.ProtocolVersion,
      this.TransportConnectTimeout,
      this.LongPollDelay});

  factory NegotiateResponse.fromJson(Map<String, dynamic> json) {
    return NegotiateResponse(
        Url: json['Url'],
        ConnectionToken: json['ConnectionToken'],
        ConnectionId: json['ConnectionId'],
        KeepAliveTimeout: json['KeepAliveTimeout'],
        DisconnectTimeout: json['DisconnectTimeout'],
        ConnectionTimeout: json['ConnectionTimeout'],
        TryWebSockets: json['TryWebSockets'],
        ProtocolVersion: json['ProtocolVersion'],
        TransportConnectTimeout: json['TransportConnectTimeout'],
        LongPollDelay: json['LongPollDelay']);
  }
}

class ServerCall {
  final String H;
  final int I;
  String? M;
  List<String?>? A;

  ServerCall({this.I: 0, this.H = "smokesessionhub", this.A, this.M});

  String toJson() {
    var call = {};
    call["H"] = this.H;
    call["M"] = this.M;
    call["A"] = this.A;
    call["I"] = this.I;

    String str = json.encode(call);
    print(str);
    return str;
  }
}

class ClientCall {
  final String? MessageId;
  final List<ClientMethod>? Data;
  final int? Init;
  final String? GroupToken;

  ClientCall({this.MessageId, this.Data, this.Init, this.GroupToken});

  factory ClientCall.fromJson(Map<String, dynamic> json) {
    var data = json["M"] as List<dynamic>?;

    return ClientCall(
        MessageId: json['C'],
        Data: data?.map((f) => ClientMethod.fromJson(f))?.toList(),
        Init: json['S'],
        GroupToken: json['G']);
  }
}

class ClientMethod {
  final String? Hub;
  final String? Method;
  final List<dynamic>? Data;

  ClientMethod({this.Hub, this.Method, this.Data});

  factory ClientMethod.fromJson(Map<String, dynamic> json) {
    return ClientMethod(Hub: json['H'], Method: json['M'], Data: json['A']);
  }
}

enum SignalStatus { none, running, stopped, paused , error }
