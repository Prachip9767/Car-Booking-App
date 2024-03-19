import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_bookig_app/model/car_model.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget{
 final  Car cars;
  const CarItem({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
   return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInfoRow(
            'Car_CR_No:',
            cars.rcNumber,
            context,
          ),
          _buildInfoRow(
            'Car_Name:',
            cars.model,
            context,
          ),
          _buildInfoRow(
            'Capacity:',
            cars.capacity.toString(),
            context,
          ),
          _buildInfoRow(
            'Attachments:',
            cars.attachments.length.toString(),
            context,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              int count=1;
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    Text('${count++} : ${cars.attachments[index].attachmentType}',style: const TextStyle(fontSize: 16),),
                itemCount: cars.attachments.length,
              );
            },
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      const Text('Attachments Images'),
                      CachedNetworkImage(
                        height: 80,
                        width: 80,
                        imageUrl: cars.attachments[0].attachmentUrl,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      // const SizedBox(width: 10,),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Expanded(child: Icon(Icons.add_to_photos,color: Colors.blue,)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildInfoRow(String label, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 14, overflow: TextOverflow.ellipsis),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }

}