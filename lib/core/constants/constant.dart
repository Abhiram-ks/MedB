import 'package:flutter/cupertino.dart';
import 'package:medb/core/constants/media_quary_helper.dart';

class ConstantWidgets {
  static Widget hight10(BuildContext context) {
    return SizedBox(height: MeidaQuaryHelper.height(context) * 0.01);
  }

  static Widget hight20(BuildContext context) {
    return SizedBox(height: MeidaQuaryHelper.height(context) * 0.02);
  }

  
  static Widget hight30(BuildContext context) {
    return SizedBox(height: MeidaQuaryHelper.height(context) * 0.03);
  }
  
  static Widget hight50(BuildContext context) {
    return SizedBox(height: MeidaQuaryHelper.height(context) * 0.05);
  }
  static Widget width20(BuildContext context){
    return SizedBox(width: MeidaQuaryHelper.width(context) * 0.02);
  }

  static Widget width40(BuildContext context){
    return SizedBox(width: MeidaQuaryHelper.width(context) * 0.04);
  }

}