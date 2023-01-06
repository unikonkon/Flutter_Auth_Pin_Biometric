part of 'security_bloc.dart';

// class SecurityState extends Equatable {
//   const SecurityState({
//     this.pin = '',
//   });
//   final String pin;

//   SecurityState copyWith({
//     String? pin,
//   }) {
//     return SecurityState(
//       pin: pin ?? this.pin,
//     );
//   }

//   @override
//   List<Object> get props => [pin];
// }

enum SecurityStatus {
  currentStep,
  pinAgin,
  completePin,
}

enum SecurityStatusOff {
  currentStep,
}

enum Status {
  on,
  off,
}

class SecurityState extends Equatable {
  const SecurityState({
    this.status = Status.off,
    this.statusOn = SecurityStatus.currentStep,
    this.statusOff = SecurityStatusOff.currentStep,
    this.pin = '',
    this.currentPin = '',
    this.pinAgin = '',
  });

  final String pin;
  final String currentPin;
  final String pinAgin;

  final Status status;
  final SecurityStatus statusOn;
  final SecurityStatusOff statusOff;

  bool get onStatus => pin == pinAgin;
  bool get offStatus => currentPin == pin;

  SecurityState copyWith({
    Status? status,
    SecurityStatus? statusOn,
    SecurityStatusOff? statusOff,
    String? pin,
    String? pinAgin,
    String? currentPin,
    String? lockPin,
  }) {
    return SecurityState(
      status: status ?? this.status,
      statusOn: statusOn ?? this.statusOn,
      statusOff: statusOff ?? this.statusOff,
      pin: pin ?? this.pin,
      pinAgin: pinAgin ?? this.pinAgin,
      currentPin: currentPin ?? this.currentPin,
    );
  }

  @override
  List<Object> get props => [
        status,
        statusOff,
        statusOn,
        pin,
        pinAgin,
        currentPin,
      ];
}
