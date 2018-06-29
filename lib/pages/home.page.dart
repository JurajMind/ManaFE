import 'package:app/helpers.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   // HubConnection hc = new HubConnection(url:'https://localhost:44324/signalr');
//Equivalent to $.connection.testHub on default local server
// HubProxy proxy = hc.createHubProxy('smokeSessionhub');
// proxy.invoke("JoinSession",['test']);

    return new _HomePageState();
  }
}

//Equivalent to var hc = $.hubConnection(url,options);


class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index){
          setState(()=>currentTab = index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
           BottomNavigationBarItem(
            icon: new Container(
              padding: const EdgeInsets.all(30.0),
              child: Icon(Icons.hd),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),

            ),
            title: new Container()
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          )
        ],
      ),  
      body: new Center(
          child: new RaisedButton(onPressed: () {
            navigate(context, 'about');
          }, child: new Text('test reload'))
      ),
    );
  }
}