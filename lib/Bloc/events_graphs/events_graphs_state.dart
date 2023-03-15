part of 'events_graphs_bloc.dart';

class EventsGraphsState extends Equatable {
  const EventsGraphsState({
    this.status = NotificationStatus.noData,
    this.campaignId = "6403872b72a372c317087273",
    this.expected = const <FirebaseCampaignBeneficiary>[],
    this.unExpected = const <FirebaseCampaignBeneficiary>[],
    this.actual = const <FirebaseCampaignBeneficiary>[],
    this.nominationPartyList = const <ChartData2>[],
    this.countExpected =0,
  });

  EventsGraphsState copyWith({
    NotificationStatus? status,
    String? campaignId,
    List<FirebaseCampaignBeneficiary>? expected,
    List<FirebaseCampaignBeneficiary>? unExpected,
    List<FirebaseCampaignBeneficiary>? actual,
    int? countExpected,
    List<ChartData2>? nominationPartyList,
  }) {
    return EventsGraphsState(
        actual: actual ?? this.actual,
        campaignId: campaignId ?? this.campaignId,
        expected: expected ?? this.expected,
        unExpected: unExpected ?? this.unExpected,
        status: status ?? this.status,
      countExpected:countExpected ?? this.countExpected,
        nominationPartyList:nominationPartyList ?? this.nominationPartyList,
    );
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
  final int countExpected;
  final List<ChartData2> nominationPartyList;

  @override
  List<Object> get props => [
        status,
        expected,
        unExpected,
        actual,
        campaignId,
    countExpected,
    nominationPartyList,
      ];
}
