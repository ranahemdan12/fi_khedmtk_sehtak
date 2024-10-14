import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'custom_validation.dart';


class PasswordField extends StatefulWidget {
   const PasswordField(
      {Key? key,
        this.label,
        required this.controller,
         this.passwordFocusNode,
        this.onChanged,
        this.onEditComplete,
        this.validator,
        required  this.hintText})
      : super(key: key);


  final TextEditingController controller;
  final FocusNode? passwordFocusNode;
  final Function(String)? onChanged;
  final Function()? onEditComplete;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;



  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _passwordVis;

  @override
  void initState() {
    _passwordVis = true;
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: widget.passwordFocusNode,
      onEditComplete: widget.onEditComplete,
      hintText: widget.hintText,
        keyboardType: TextInputType.visiblePassword,
        textEditingController: widget.controller,
        validate: widget.validator ?? CustomValidation.validatePassword,
        suffixPressed: () {

        setState(() {
          _passwordVis = !_passwordVis;
        });},

        suffix: _passwordVis ? Icons.visibility_off :  Icons.visibility ,
        obscurePassword: _passwordVis,
    /*          onChanged: widget.onChanged,*/
       );
  }
}
