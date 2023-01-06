import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// part 'security_state.dart';

// class SecurityCubit extends Cubit<SecurityState> {
//   SecurityCubit() : super(SecurityInitial());
// }

class SecurityCubit extends HydratedCubit<bool> {
  SecurityCubit() : super(false);

  void none() => emit(false);
  void enabled() => emit(true);

  @override
  bool? fromJson(Map<String, dynamic> json) {
    final value = json["value"] as bool?;
    return value ?? false;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'value': state};
  }
}
