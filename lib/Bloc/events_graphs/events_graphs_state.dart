part of 'events_graphs_bloc.dart';

class EventsGraphsState extends Equatable {
  const EventsGraphsState({
    this.status = NotificationStatus.noData,
    this.campaignId = "24MVkEfXNlUhpCmvydPU",
    this.expected = const <FirebaseCampaignBeneficiary>[],
    this.unExpected = const <FirebaseCampaignBeneficiary>[],
    this.actual = const <FirebaseCampaignBeneficiary>[],
  });

  EventsGraphsState copyWith({
    NotificationStatus? status,
    String? campaignId,
    List<FirebaseCampaignBeneficiary>? expected,
    List<FirebaseCampaignBeneficiary>? unExpected,
    List<FirebaseCampaignBeneficiary>? actual,
  }) {
    return EventsGraphsState(
        actual: actual ?? this.actual,
        campaignId: campaignId ?? this.campaignId,
        expected: expected ?? this.expected,
        unExpected: unExpected ?? this.unExpected,
        status: status ?? this.status);
  }

  // const EventsGraphsState.hasData(
  //     List<FirebaseCampaignBeneficiary> notifications)
  //     : this(status: NotificationStatus.hasData, notifications: notifications);

  const EventsGraphsState.noData() : this(status: NotificationStatus.noData);

  final NotificationStatus status;
  final String campaignId;
  final List<FirebaseCampaignBeneficiary> expected;
  final List<FirebaseCampaignBeneficiary> unExpected;
  final List<FirebaseCampaignBeneficiary> actual;

  @override
  List<Object> get props => [
        status,
        expected,
        unExpected,
        actual,
        campaignId,
      ];
}
