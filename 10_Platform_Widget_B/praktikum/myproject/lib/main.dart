import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'contactPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF6200EE), // Warna utama (primary)
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(
              0xFF03DAC6), // Warna sekunder (secondary) untuk floating action button
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF6200EE), // Warna utama (primary)
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Material App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _halamannow = 0;
  String? primary = '#6200EE';
  void _onItemTapped(int index) {
    setState(() {
      _halamannow = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView(
              shrinkWrap: true, // Set shrinkWrap menjadi true
              children: <Widget>[
                ListTile(
                  title: Text('Learn Flutter'),
                ),
                Divider(),
                ListTile(
                  title: Text('Learn ReactJS'),
                ),
                Divider(),
                ListTile(
                  title: Text('Learn VueJS'),
                ),
                Divider(),
                ListTile(
                  title: Text('Learn Tailwind CSS'),
                ),
                Divider(),
                ListTile(
                  title: Text('Learn UI/UX'),
                ),
                Divider(),
                ListTile(
                  title: Text('Learn Figma'),
                ),
                Divider(),
                ListTile(
                  title: Text('Learn Digital Marketing'),
                ),
                Divider(),
              ],
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline6,
            // ),
          ],
        ),
      ),
      ContactsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 34),
              ),
              child: Text(
                'Header Drawer',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_halamannow),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info_circle),
            label: 'information',
          ),
        ],
        currentIndex: _halamannow,
        onTap: _onItemTapped,
        activeColor: Colors.white, // Warna aktif (hijau)
        inactiveColor: CupertinoColors.white, // Warna tidak aktif (abu-abu)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
