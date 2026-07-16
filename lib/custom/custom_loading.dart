import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/custom/shimmer_loading.dart';

class CustomLoading {

  Widget cardLoading() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12.withAlpha(1), offset: Offset(1, 2)),
        ],
        border: BoxBorder.symmetric(
          horizontal: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade50,
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                ShimmerLoading(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerLoading(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        height: 20,
                        width: 180,
                      ),
                    ),
                    SizedBox(height: 10),
                    ShimmerLoading(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                        height: 15,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

CustomLoading customLoading = CustomLoading();
