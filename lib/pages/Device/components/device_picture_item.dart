import 'package:app/Helpers/picture_helper.dart';
import 'package:app/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DevicePictureItem extends StatelessWidget {
  final String? inlinePicture;
  final bool? selected;

  const DevicePictureItem( this.inlinePicture,{Key? key, this.selected,}) : super(key: key);
  @override
  Widget build(BuildContext context) {

      if(inlinePicture == null){
            return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    
      ),
     
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(height: 64,width: 64,
    )),
            ));
      }


    return Hero(
      tag: "device_picture_$inlinePicture",
          child: Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: new Border.all(
                    color: selected ?? false ? AppColors.colors[1] : Colors.white,
                    width: 4),
        ),
       
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PictureHelper.imageFromBase64String(inlinePicture!),
      )),
    );
  }
}
