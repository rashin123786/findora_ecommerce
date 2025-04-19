import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/get_all_product_model.dart';

class EachProductCard extends StatelessWidget {
  const EachProductCard({
    super.key,
    required this.data,
  });

  final GetAllProductModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // color: Colors.grey.shade100,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: data.image,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
          Text(
            data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text("\$ ${data.price.toString()}")
        ],
      ),
    );
  }
}
