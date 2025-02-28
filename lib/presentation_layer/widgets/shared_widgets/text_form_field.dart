import 'package:flutter/material.dart';
import 'package:voiceschooltask/core_layer/constants/screens_constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key,this.hintText,required this.formFieldController,required this.formKey});
  final String? hintText ;
  final TextEditingController formFieldController;
  final GlobalKey<FormState> formKey;
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.formFieldController,
        decoration:  InputDecoration(
          labelText: widget.hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero, // Makes it rectangular
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return textFieldEmptyValidationMessage;
          }
          return null;
        },
      ),
    );
  }
}
