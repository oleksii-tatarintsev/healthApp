import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_type_bloc.freezed.dart';
part 'blood_type_event.dart';
part 'blood_type_state.dart';

class BloodTypeBloc extends Bloc<BloodTypeEvent, BloodTypeState> {
  String group = '';
  String rhesus = '';

  BloodTypeBloc() : super(BloodTypeState.initial()) {
    on<BloodTypeEvent>((event, emit) {
      event.map(
        initial: (_) {
          emit(BloodTypeState.initial());
        },
        changed: (_) {
          if (group.isEmpty && rhesus.isEmpty) {
            emit(BloodTypeState.error(errorMessage: 'Выберете группу крови'));
          } else {
            emit(BloodTypeState.valid());
          }
        },
        further: (_) {
          emit(BloodTypeState.loading());
        },
      );
    });
  }
  void getType(String value) {
    add(BloodTypeEvent.further());
    group = value;
    add(BloodTypeEvent.changed());
  }

  void getRhesus(String value) {
    add(BloodTypeEvent.further());
    rhesus = value;
    add(BloodTypeEvent.changed());
  }
}
