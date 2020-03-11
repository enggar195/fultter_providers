import 'package:enggarapps/feature/share_state/share_state.dart';
import 'package:enggarapps/feature/share_state/state_cart.dart';
import 'package:enggarapps/feature/share_state/state_count_money.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:provider/provider.dart';

class CountYourMoney extends StatefulWidget {
  @override
  _CountYourMoneyState createState() => _CountYourMoneyState();
}

class _CountYourMoneyState extends State<CountYourMoney> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApplicationColor()),
        ChangeNotifierProvider(create: (context) => CountMoney()),
        ChangeNotifierProvider(create: (context) => CountCart()),
      ],
      child: eva.EqLayout(
        child: Consumer<ApplicationColor>(
          builder: (context, applicationColor, _) => Container(
            height: double.infinity,
            width: double.infinity,
            color: applicationColor.color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Insert Your Money "),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Consumer<CountMoney>(
                              builder: (context, money, _) => TextField(
                                keyboardType: TextInputType.number,
                                    controller: _controller,
                                    onSubmitted: (String value) {
                                      money.Money = int.parse(value);
                                    },
                                  )),
                        ),
                      ),
                      height: 30,
                      width: 200,
                      margin: EdgeInsets.all(5),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Balance Money "),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Consumer<CountMoney>(
                            builder: (context, money, _) => Text(
                              money.Money.toString(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black45,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<CountCart>(
                            builder: (context, cart, _) => Text(
                              "Pengeluaran Makan (10000) x " +
                                  cart.Cart.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<CountCart>(
                            builder: (context, cart, _) => Text(
                              (cart.Cart * 10000).toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: 50,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Consumer<CountMoney>(
                  builder: (context, money, _) => Consumer<CountCart>(
                    builder: (context, cart, _) => RaisedButton(
                      child: Text('Add  Cost of Lunch'),
                      onPressed: () {
                        if (money.Money > 10000) {
                          cart.Cart += 1;
                          money.Money = money.Money - (cart.Cart * 10000);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
