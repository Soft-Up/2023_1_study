import 'package:flutter_bloc/flutter_bloc.dart';

part 'celebrity_state.dart';

class CelebrityCubic extends Cubit<CelebrityCubicState> {
  CelebrityCubic() : super(CelebrityCubicInit());
}
