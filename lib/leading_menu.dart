import 'package:flutter/material.dart';

class LeadingMenu extends StatelessWidget {
  const LeadingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String logo =
        "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/cgu977lqrecth2n4t7it";

    List rightMenuItems = [
      "PUPACOIN'LERİM",
      "SEANSLARIM",
      "RAPORLARIM",
      "ARKADAŞLARIM",
      "BAŞARILARIM",
      "ZİRVEDEKİLER",
      "ÇALIŞMA ODALARI",
      "BİLDİRİMLER",
      "BAĞIŞ YAP",
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(context),
        body: Column(
          children: [
            Expanded(
                flex: 9,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: _leftMenu(context)),
                      Expanded(
                          flex: 2, child: _rightMenu(context, rightMenuItems))
                    ])),
            Expanded(flex: 1, child: _bottom(logo))
          ],
        ));
  }
}

PreferredSizeWidget _appBar(BuildContext context) => AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.08,
      leading: FittedBox(
        fit: BoxFit.scaleDown,
        child: FloatingActionButton(
          mini: true,
          backgroundColor: Colors.purple[50],
          splashColor: Colors.purple[200],
          elevation: 0,
          child:
              const Icon(Icons.navigate_before_rounded, color: Colors.purple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.deepPurple[100]),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("##234923",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.black)),
                ),
                const CircleAvatar()
              ],
            ))
      ],
    );

Widget _leftMenu(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 30,
                  spreadRadius: 10,
                  offset: Offset(0, 0),
                  blurStyle: BlurStyle.outer)
            ],
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width / 4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return FloatingActionButton(
              heroTag: index,
              backgroundColor: Colors.purple,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.home),
            );
          }),
        ),
      ),
    );

Widget _rightMenu(BuildContext context, List<dynamic> list) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              9,
              (index) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.purple,
                  ),
                  title: Text(list[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.fontSize)),
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Text("")),
      ],
    );

Widget _bottom(String logo) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("App Version", style: TextStyle(color: Colors.black)),
            Text("234", style: TextStyle(color: Colors.black))
          ],
        ),
        Image.network(logo)
      ],
    );
