import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Emma Soundboard',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> sounds = {
    'Basic': [
      {"display": "Again!", "value": "again"},
      {"display": "Bless You", "value": "bless_you"},
      {"display": "Can I Try?", "value": "can_i_try"},
      {"display": "Dad, Like This!", "value": "dad_like_this"},
      {"display": "I Can\"t Do It", "value": "i_cant_do_it"},
      {"display": "I Did It!", "value": "i_did_it"},
      {"display": "I Dunno", "value": "i_dunno"},
      {"display": "No Not Today", "value": "no_not_today"},
      {"display": "Yes", "value": "yes"},
      {"display": "no", "value": "no"},
      {"display": "yay", "value": "yay"},
      {"display": "Thank You!", "value": "thank_you"}
    ],
    'People': [
      {"display": "brooke", "value": "brooke"},
      {"display": "ethan", "value": "ethan"},
      {"display": "papa", "value": "papa"},
      {"display": "mama", "value": "mama"},
      {"display": "Emma Jayne Valentine", "value": "ejv"}
    ],
    'Love & Laugh': [
      {"display": "laugh", "value": "laugh"},
      {"display": "laugh 2", "value": "laugh_2"},
      {"display": "big laugh", "value": "big_laugh"},
      {"display": "big laugh 2", "value": "big_laugh_2"},
      {"display": "big laugh 3", "value": "big_laugh_3"},
      {"display": "evil laugh", "value": "evil_laugh"},
      {"display": "evil laugh 2", "value": "evil_laugh_2"},
      {"display": "i love you", "value": "i_love_you"},
      {"display": "i love you (soft)", "value": "i_love_you_soft"},
      {"display": "i love you (loud)", "value": "i_love_you_loud"},
    ],
    'Singing': [
      {"display": "ok bye", "value": "ok_bye"},
      {"display": "hurry up", "value": "hurry_up"},
      {"display": "abc song", "value": "abc_song"},
      {"display": "let it go", "value": "let_it_go"},
      {"display": "itsy bitsy spider", "value": "itsy_bitsy_spider"},
      {
        "display": "twinkle twinkle little star",
        "value": "twinkle_little_star"
      },
      {
        "display": "let it go (long version)",
        "value": "let_it_go_long_version"
      },
      {"display": "in love with the coco", "value": "im_in_love_with_the_coco"},
    ],
    'Random': [
      {"display": "belly button", "value": "belly_button"},
      {"display": "blues clues", "value": "blues_clues"},
      {"display": "bottle milk", "value": "bottle_milk"},
      {"display": "climbing", "value": "climbing"},
      {"display": "climbing beanstalk", "value": "climbing_beanstalk"},
      {"display": "get down", "value": "get_down"},
      {"display": "happy birthday", "value": "happy_birthday"},
      {"display": "i like your shirt", "value": "i_like_your_shirt"},
      {"display": "i\"m big", "value": "im_big"},
      {"display": "i\"m tired", "value": "im_tired"},
      {"display": "it\"s heavy", "value": "its_heavy"},
      {"display": "mmm, smell good", "value": "mm_smell_good"},
      {"display": "smell stinky", "value": "smell_stinky"},
      {"display": "tiny ugly germs", "value": "tiny_ugly_germs"},
      {"display": "yo gabba gabba", "value": "yo_gabba_gabba"},
      {"display": "you want checkup?", "value": "you_want_checkup"},
      {"display": "drop da bass!", "value": "drop_the_bass"},
      {"display": "deez nuts!", "value": "deez_nuts"},
    ]
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Emma Soundboard"),
        backgroundColor: Colors.white,
      ),
      body: Builder(builder: (BuildContext context) {
        List<Widget> pages = [];
        sounds.forEach((key, data) {
          List<Widget> widgets = [];
          for (var sound in data) {
            print(sound);
            widgets.add(ListTile(
                trailing: ElevatedButton(
                  onPressed: () async {
                    AudioPlayer player = AudioPlayer();
                    await player.play(AssetSource(sound['value'] + ".mp3"));
                  },
                  child: Icon(Icons.play_arrow),
                ),
                title: Text(sound['display'])));
          }
          pages.add(Column(children: [
            SizedBox(height: 20),
            Text(
              key,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: SingleChildScrollView(child: Column(children: widgets)))
          ]));
        });
        return PageView(children: pages);
      }),
    );
  }
}
