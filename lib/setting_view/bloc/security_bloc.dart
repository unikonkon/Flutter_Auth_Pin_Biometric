// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'security_event.dart';
part 'security_state.dart';

class SecurityBloc extends HydratedBloc<SecurityEvent, SecurityState> {
  SecurityBloc() : super(const SecurityState()) {
    on<OnDelete>(_onDelete);
    on<OnCreatePin>(_onCreatePin);
    on<OnConfirmPin>(_onConfirmPin);
    on<OnNextStep>(_onNextStep);
    on<OnCompletedPin>(_onCompletedPin);
    on<OnCurrentPin>(_onCurrentPin);
    on<OnErrorCurrentPin>(_onErrorCurrentPin);
  }

  Future<void> _onDelete(
    OnDelete event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        pin: '',
        pinAgin: '',
        currentPin: '',
        statusOn: SecurityStatus.currentStep,
      ),
    );
  }

  Future<void> _onCreatePin(
    OnCreatePin event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        pin: event.pin,
      ),
    );
  }

  Future<void> _onConfirmPin(
    OnConfirmPin event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        pinAgin: event.pinAgin,
      ),
    );
  }

  Future<void> _onNextStep(
    OnNextStep event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        statusOn: SecurityStatus.pinAgin,
      ),
    );
  }

  Future<void> _onCompletedPin(
    OnCompletedPin event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        statusOn: SecurityStatus.completePin,
      ),
    );
  }

  Future<void> _onCurrentPin(
    OnCurrentPin event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        currentPin: event.currentPin,
      ),
    );
  }

  Future<void> _onErrorCurrentPin(
    OnErrorCurrentPin event,
    Emitter<SecurityState> emit,
  ) async {
    emit(
      state.copyWith(
        currentPin: '',
      ),
    );
  }

  @override
  SecurityState? fromJson(Map<String, dynamic> json) {
    try {
      final pin = json['pin'] as String;
      // final currentPin = json['currentPin'] as String;
      return SecurityState(
        pin: pin,
        // currentPin:currentPin,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SecurityState state) {
    try {
      return {
        'pin': state.pin,
        // 'currentPin':state.currentPin
      } as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
