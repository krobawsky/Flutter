import 'package:flutter/material.dart';

final _icons = <String, IconData> {

  'add_alert'   : Icons.add_alert,
  'accessibility'   : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'add'           : Icons.add,
  'donut_large'   : Icons.donut_large,
  'input'   : Icons.input,
  'list'    : Icons.list,
  'tune'    : Icons.tune,
};

Icon getICon(String nombreIcon) {

  return Icon( _icons[nombreIcon], color: Colors.blue,);

}