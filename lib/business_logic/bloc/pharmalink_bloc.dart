import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pharmalink_event.dart';
part 'pharmalink_state.dart';

class PharmalinkBloc extends Bloc<PharmalinkEvent, PharmalinkState> {
  PharmalinkBloc() : super(PharmalinkInitial()) {
    on<PharmalinkEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
