
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {
    //on<CounterIncreased>( (event, emit) => _onCounterIncreased(event, emit)); // es mismo que abajo
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onReset);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void _onReset(CounterReset event, Emitter<CounterState> emit) { 
    emit(state.copyWith(
      counter: 0
    ));
  }

  void increaseBy(int value) {
    add(CounterIncreased(value));
  }

  void resetCounter() {
    add(CounterReset());
  }


}



      