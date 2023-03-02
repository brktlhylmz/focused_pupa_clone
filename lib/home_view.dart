// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:focused_pupa_clone/on_focus.dart';
import 'leading_menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

String _url =
    "https://play-lh.googleusercontent.com/84oJE__r4jXfty7L6e0vqiUV9G9BR7E2KzVaTgJLoto1gJgIG9keMqRpVIu0dEhCcw=w240-h480-rw";

double _sliderValue = 11;

String? _time = "10:00";

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: DefaultTabController(
        length: 1,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _image,
              _elevatedButton,
              _counter,
              _slider,
              _startButton,
              _underPage
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget get _appbar => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LeadingMenu()));
          },
          icon: const Icon(Icons.menu),
          splashRadius: 20,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        actions: <Widget>[_chip],
      );

  Widget get _chip => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ActionChip(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            avatar: CircleAvatar(
              backgroundImage: Image.network(
                _url,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
              ).image,
            ),
            label: const Text("122")),
      );

  Widget get _image =>
      Image.network("https://www.linkpicture.com/q/image1_3.png",
          loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const CircularProgressIndicator();
      }, height: MediaQuery.of(context).size.height * 0.4);

  Widget get _elevatedButton => ElevatedButton(
      onPressed: () {
        setState(() {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              builder: (context) => _bottomSheet);
        });
      },
      style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(Colors.deepPurple[100]),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Row(children: const [
          Icon(Icons.hourglass_empty_outlined, color: Colors.yellow),
          Text("Normal Odaklanma", style: TextStyle(fontSize: 12))
        ]),
      ));

  Widget get _counter => Padding(
        padding: const EdgeInsets.all(0),
        child: Text(_time!,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                )),
      );

  Widget get _slider => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Slider(
            min: 10,
            max: 180,
            divisions: 17,
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
                _time = "${value.toInt()}:00";
              });
            }),
      );

  Widget get _startButton => ElevatedButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OnFocus()),
            );
          });
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            backgroundColor: MaterialStateProperty.all(Colors.yellow),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)))),
        child: Text("Şimdi Odaklan",
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 15)),
      );

  Widget get _underPage => Column(
        children: [
          Icon(
            Icons.people,
            color: ThemeData.light().cardColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Tüm dünyada ",
                  style: TextStyle(fontSize: 12),
                ),
                Text("2912",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text(
                  " kişi Focused Pupa ile odaklanıyor...",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      );
}

Widget get _bottomSheet => BottomSheet(
    onClosing: () {},
    builder: (BuildContext context) => Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: _bottomSheetView(context),
        ));

Widget _bottomSheetView(BuildContext context) =>
    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
      Text("Odaklanma Süresi"),
    ]);
