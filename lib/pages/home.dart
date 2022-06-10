import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/homeController.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatelessWidget {
  final HomeController cnt = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          //decoration: BoxDecoration(b),
          color: Colors.grey[850],
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You can get a lot more out of it",
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                  Text("Start with our demo plan",
                      style: Theme.of(context).primaryTextTheme.bodyText1)
                ],
              ),
              flex: 7,
            ),
            Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {},
                  child: const Text("Take Demo"),
                ))
          ]),
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Expanded(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today",
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                    Text("Jun 12",
                        style: Theme.of(context).primaryTextTheme.bodyText1)
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GetX<HomeController>(builder: (_) {
                  return Row(
                    children: [
                      Expanded(
                        child: MyCard(
                          value: cnt.homeModel.value.water,
                          title: "Water Consumed",
                          maxValue: 4,
                          isWaterConsumed: true,
                          logo: const Icon(
                            Icons.water_drop,
                            color: Colors.blue,
                          ),
                          incrementIcon: GestureDetector(
                            onTap: () {
                              cnt.updateWater();
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          gauge: SfLinearGauge(
                            orientation: LinearGaugeOrientation.vertical,
                            maximum: 4,
                            minimum: 0,
                            animationDuration: 4500,
                            showLabels: false,
                            showTicks: false,
                            useRangeColorForAxis: true,
                            axisTrackStyle: const LinearAxisTrackStyle(
                                color: Colors.white,
                                thickness: 40,
                                edgeStyle: LinearEdgeStyle.bothCurve),
                            barPointers: [
                              LinearBarPointer(
                                value: cnt.homeModel.value.water,
                                thickness: 40,
                                edgeStyle: LinearEdgeStyle.bothCurve,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: MyCard(
                          title: "Calories Burned",
                          value: cnt.homeModel.value.cal,
                          maxValue: 10,
                          logo: Icon(
                            Icons.local_fire_department_rounded,
                            color: Colors.orange[900],
                          ),
                          incrementIcon: GestureDetector(
                            onTap: () {
                              cnt.updateCal();
                            },
                            child: const Icon(
                              Icons.power_settings_new,
                              color: Colors.white,
                            ),
                          ),
                          gauge: SfRadialGauge(
                            //backgroundColor: Colors.black,
                            axes: [
                              RadialAxis(
                                maximum: 10,
                                minimum: 0,
                                startAngle: 180,
                                endAngle: 0,
                                showLabels: false,
                                showTicks: false,
                                canScaleToFit: true,
                                ranges: [
                                  GaugeRange(
                                    startValue: 0,
                                    endValue: 10000,
                                    color: Colors.white,
                                  )
                                ],
                                pointers: [
                                  NeedlePointer(
                                    value: cnt.homeModel.value.cal,
                                    knobStyle: const KnobStyle(
                                        color: Colors.green,
                                        borderColor: Colors.white,
                                        borderWidth: 0.11,
                                        knobRadius: 0.11),
                                    needleColor: Colors.white,
                                    enableAnimation: true,
                                    animationDuration: 4500,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
                Card(
                  margin: const EdgeInsets.only(top: 16),
                  color: Colors.grey[850],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      const Text("Today's required calorie consumption :"),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "2596 Kcal",
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          RequiredNutrients(
                            img:
                                "https://media.istockphoto.com/photos/white-studio-background-picture-id1040250650?k=20&m=1040250650&s=612x612&w=0&h=lEWpioJ3jet0QIZVBoU2Ygaua8YMHFfHN1mvT28xRZ4=",
                            type: "Carbs",
                            quantity: 259,
                            kcal: 1038,
                          ),
                          RequiredNutrients(
                            img:
                                "https://media.istockphoto.com/photos/white-studio-background-picture-id1040250650?k=20&m=1040250650&s=612x612&w=0&h=lEWpioJ3jet0QIZVBoU2Ygaua8YMHFfHN1mvT28xRZ4=",
                            type: "Protien",
                            quantity: 259,
                            kcal: 1038,
                          ),
                          RequiredNutrients(
                            img:
                                "https://media.istockphoto.com/photos/white-studio-background-picture-id1040250650?k=20&m=1040250650&s=612x612&w=0&h=lEWpioJ3jet0QIZVBoU2Ygaua8YMHFfHN1mvT28xRZ4=",
                            type: "Fat",
                            quantity: 57,
                            kcal: 519,
                          )
                        ],
                      )
                    ]),
                  ),
                )
              ]),
            )),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final title;
  final logo;
  final gauge;
  final maxValue;
  final incrementIcon;
  final isWaterConsumed;
  final value;
  const MyCard({
    Key? key,
    @required this.title,
    @required this.logo,
    @required this.gauge,
    @required this.maxValue,
    @required this.incrementIcon,
    this.isWaterConsumed = false,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[850],
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(title,
                      style: Theme.of(context).primaryTextTheme.bodyText1),
                ),
                logo
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                child: gauge,
                height: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    isWaterConsumed
                        ? value.toString() +
                            " ltr of " +
                            maxValue.toString() +
                            " ltr"
                        : value.toString() + " kcal",
                    style: Theme.of(context).primaryTextTheme.bodyText1),
                incrementIcon
              ],
            ),
          ]),
        ));
  }
}

class RequiredNutrients extends StatelessWidget {
  final img;
  final type;
  final quantity;
  final kcal;
  const RequiredNutrients(
      {Key? key, this.img, this.type, this.quantity, this.kcal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[350],
        ),
        //  Image.network(
        //   img,
        //   height: 50,
        //   width: 50,
        // ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(type),
        ),
        Text(
          quantity.toString() + " g",
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          kcal.toString() + " kcal",
          style: TextStyle(color: Colors.grey[600]),
        )
      ],
    );
  }
}
