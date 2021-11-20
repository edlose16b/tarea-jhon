import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static Route go() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final txtDollarPriceInPenCtrl = TextEditingController(text: '4.2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 100,
          ),
          const CircleAvatar(
            child: Text('JC'),
            backgroundColor: Color(0xff1c3569),
          ),
          const SizedBox(height: 20),
          const Text('Buenas tardes, Jhon'),
          const SizedBox(height: 30),
          TextButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => TradeWidget(
                      dollarPrice: double.parse(txtDollarPriceInPenCtrl.text)),
                );
              },
              icon: const Icon(Icons.change_circle_outlined),
              label: const Text('Tradear USD-PEN')),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Ingrese monto del valor actual del dolar en soles',
                  style: Theme.of(context).textTheme.headline6!,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Image.network(
                      'https://w7.pngwing.com/pngs/563/791/png-transparent-dollar-sign-illustration-united-states-dollar-icon-design-icon-dollar-sign-text-logo-number.png',
                      width: 40,
                      height: 40,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: txtDollarPriceInPenCtrl,
                        decoration: const InputDecoration(hintText: '0.0'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )

          // TradeWidget(),
        ],
      ),
    );
  }
}

class TradeWidget extends StatefulWidget {
  TradeWidget({Key? key, required this.dollarPrice}) : super(key: key);
  final double dollarPrice;

  @override
  _TradeWidgetState createState() => _TradeWidgetState();
}

class _TradeWidgetState extends State<TradeWidget> {
  final txtDollarCtrl = TextEditingController(text: '0.0');

  double pen = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            'Ingrese monto en dolares',
            style: Theme.of(context).textTheme.headline6!,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Image.network(
                'https://okdiario.com/img/2019/11/24/cuantas-estrellas-tiene-la-bandera-de-estados-unidos-655x368.jpg',
                width: 120,
                height: 50,
              ),
              Expanded(
                child: TextFormField(
                  controller: txtDollarCtrl,
                  decoration: const InputDecoration(hintText: '0.0'),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Flag_of_Peru_%28state%29.svg/270px-Flag_of_Peru_%28state%29.svg.png',
                width: 120,
                height: 50,
              ),
              Text('Monto total es ${dollarToPen()}')
            ],
          ),
        ],
      ),
    );
  }

  double dollarToPen() {
    return double.parse(txtDollarCtrl.text) * widget.dollarPrice;
  }
}
