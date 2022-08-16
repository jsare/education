import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

class RedColor implements ColorEvent {}

class GreenColor implements ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc(Color initialState) : super(initialState) {
    on<RedColor>((event, emit) => emit(Colors.red));
    on<GreenColor>((event, emit) => emit(Colors.green));
  }
}
