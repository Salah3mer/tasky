import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'heme_state.dart';

class HemeCubit extends Cubit<HemeState> {
  HemeCubit() : super(HemeInitial());
}
