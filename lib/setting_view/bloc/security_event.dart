part of 'security_bloc.dart';

abstract class SecurityEvent extends Equatable {
  const SecurityEvent();
  @override
  List<Object> get props => [];
}

class OnCreatePin extends SecurityEvent {
  const OnCreatePin({required this.pin});
  final String pin;
  @override
  List<Object> get props => [pin];
}

class OnConfirmPin extends SecurityEvent {
  const OnConfirmPin({required this.pinAgin});
  final String pinAgin;
  @override
  List<Object> get props => [pinAgin];
}

class OnCurrentPin extends SecurityEvent {
  const OnCurrentPin({required this.currentPin});
  final String currentPin;
  @override
  List<Object> get props => [currentPin];
}

class OnDelete extends SecurityEvent {}

class OnNextStep extends SecurityEvent {}

class OnCompletedPin extends SecurityEvent {}

class OnErrorCurrentPin extends SecurityEvent {}
