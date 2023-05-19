import 'package:doit_fluttter_study/domains/core/stream/stream.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) =>
    (events, mapper) => events.debounce(duration).asyncExpand(mapper);
