part of 'counter_bloc.dart';

enum Status { idle, loading, success, error }

@immutable
class CounterState {
  final Status status;
  final int counter;

  CounterState({status, counter})
      : status = status ?? Status.loading,
        counter = counter ?? 0;

  CounterState copyWith({
    Status? status,
    int? counter,
  }) {
    return CounterState(
      status: status ?? this.status,
      counter: counter ?? this.counter,
    );
  }

  // factory CounterState.fromJson(Map<String, dynamic> json) => CounterState(
  //     counter: json['counter'],
  //     status: Status.values
  //         .firstWhere((element) => element.name.toString() == json['status']));

  // Map<String, dynamic> toJson() => {'counter': counter, 'status': status.name};
}
