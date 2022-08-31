import 'package:get/get.dart';

class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'txt_valid_email'.tr;
    } else {
      return null;
    }
  }

  String? phone(String? value) {
    String pattern =
        r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'txt_valid_phone'.tr;
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'txt_valid_password'.tr;
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'txt_valid_name'.tr;
    } else {
      return null;
    }
  }

  String? number(String? value) {
    String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'txt_valid_number'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    // String pattern = r'^\S+$';
    String pattern = r'^.{1,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'txt_valid_notEmpty'.tr;
    } else {
      return null;
    }
  }

  String? keyword(String? value) {
    // String pattern = r'^\S+$';
    if (!(value!.length >= 3 || value.isEmpty)) {
      return 'txt_valid_keyword'.tr;
    } else {
      return null;
    }
  }
}
