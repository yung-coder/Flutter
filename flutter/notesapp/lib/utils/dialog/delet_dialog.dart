import 'package:flutter/widgets.dart';
import 'package:notesapp/utils/dialog/generic_dialog.dart';

Future<bool> showDeletDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delet',
    content: 'Are you sure you want to delet ?',
    optionsBuilder: () => {
      'Cancel': false,
      'Yes': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
