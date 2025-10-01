
import 'dart:io';

import 'package:equatable/equatable.dart';

class ImpProcessInp extends Equatable{
  const ImpProcessInp({this.file, this.value});

  final File? file;
  final String? value;
  
  @override
  List<Object?> get props => [file];

  ImpProcessInp copyWith({String? value}) => ImpProcessInp(file: file, value: value);
}