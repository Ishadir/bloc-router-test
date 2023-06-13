import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {

    on<Increment>((event, emit) {
      int number = state.counter;
      int newNumber = number + 1;
      emit(state.copyWith(counter: newNumber));
    });
    on<Reset>((event, emit) {
      int number = state.counter;
      number = 0;
      emit(state.copyWith(counter: number));
    });
  }

  // @override
  // CounterState? fromJson(Map<String, dynamic> json) {
  //   return CounterState.fromJson(json);
  // }

  // @override
  // Map<String, dynamic>? toJson(CounterState state) {
  //   return state.toJson();
  // }
}
