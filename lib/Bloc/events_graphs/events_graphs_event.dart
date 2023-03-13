part of 'events_graphs_bloc.dart';

abstract class EventsGraphsEvent extends Equatable {
  const EventsGraphsEvent();
}

class ExpectedChanged extends EventsGraphsEvent {
  const ExpectedChanged(this.expected);
  final List<FirebaseCampaignBeneficiary> expected;

  @override
  List<Object> get props => [expected];
}
class UnExpectedChanged extends EventsGraphsEvent {
  const UnExpectedChanged(this.unExpected);
  final List<FirebaseCampaignBeneficiary> unExpected;

  @override
  List<Object> get props => [unExpected];
}
class ActualChanged extends EventsGraphsEvent {
  const ActualChanged(this.actual);
  final List<FirebaseCampaignBeneficiary> actual;

  @override
  List<Object> get props => [actual];
}
class CampaignIdChanged extends EventsGraphsEvent {
  const CampaignIdChanged(this.campaignId);
  final String campaignId;

  @override
  List<Object> get props => [campaignId];
}

