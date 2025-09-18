import 'package:flutter/material.dart';
import '../models/drink_type.dart';

class OrderFormResult {
  final String customer;
  final DrinkType drink;
  final String notes;
  OrderFormResult(this.customer, this.drink, this.notes);
}

class OrderFormDialog extends StatefulWidget {
  @override
  _OrderFormDialogState createState() => _OrderFormDialogState();
}

class _OrderFormDialogState extends State<OrderFormDialog> {
  final _formKey = GlobalKey<FormState>();
  String _customer = '';
  DrinkType _drink = DrinkType.shai;
  String _notes = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Order'),
      content: Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Customer name'),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter name' : null,
            onSaved: (v) => _customer = v!.trim(),
          ),
          DropdownButtonFormField<DrinkType>(
            value: _drink,
            items: DrinkType.values
                .map((d) => DropdownMenuItem(value: d, child: Text(d.label)))
                .toList(),
            onChanged: (v) => setState(() => _drink = v ?? DrinkType.shai),
            decoration: InputDecoration(labelText: 'Drink'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Special instructions'),
            onSaved: (v) => _notes = v ?? '',
          ),
        ]),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.of(context).pop(OrderFormResult(_customer, _drink, _notes));
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
