import 'package:car_bookig_app/controller/car_controller.dart';
import 'package:car_bookig_app/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/cart_item.dart';

class CarHomeScreen extends StatefulWidget {
  const CarHomeScreen({super.key});

  @override
  CarHomeScreenState createState() => CarHomeScreenState();
}

class CarHomeScreenState extends State<CarHomeScreen> {
  late CarProvider carProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    carProvider = Provider.of<CarProvider>(context);
    carProvider.fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:
              const Text('Car Master', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Add More',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                shrinkWrap: true,
                itemCount: carProvider.cars.length,
                itemBuilder: (context, index) {
                  Car cars = carProvider.cars[index];
                  return CarItem(cars: cars);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
