import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/enums/enums.dart';
import '../../data_providers/firebase_provider.dart';
import '../../Models/databasemodels/firebasemodel.dart';
import '../../main.dart';

part 'events_graphs_event.dart';

part 'events_graphs_state.dart';

class EventsGraphsBloc extends Bloc<EventsGraphsEvent, EventsGraphsState> {
  static EventsGraphsBloc get(context) => BlocProvider.of(context);

  EventsGraphsBloc() : super(const EventsGraphsState()) {
    on<ExpectedChanged>(_onExpectedChanged);
    on<UnExpectedChanged>(_onUnExpectedChanged);
    on<ActualChanged>(_onActualChanged);
    on<CampaignIdChanged>(_onCampaignIdChanged);
    updateStream();
  }

  // late StreamSubscription<List<FirebaseCampaignBeneficiary>>
  //     notificationSubscription;

  updateFirstStream(String campaignId) {
    // notificationSubscription =
    FirebaseProvider()
        .getCampaignExpectedBeneficiary(campaignId)
        .listen((expected) {
      add(ExpectedChanged(expected));
    });

    FirebaseProvider()
        .getCampaignUnExpectedBeneficiary(campaignId)
        .listen((unExpected) {
      add(UnExpectedChanged(unExpected));
    });

    FirebaseProvider()
        .getCampaignActualBeneficiary(campaignId)
        .listen((actual) {
      add(ActualChanged(actual));
    });

    add(CampaignIdChanged(campaignId));
  }

  updateStream() {
    // notificationSubscription =
    FirebaseProvider()
        .getCampaignExpectedBeneficiary(state.campaignId)
        .listen((expected) {
      add(ExpectedChanged(expected));
    });

    FirebaseProvider()
        .getCampaignUnExpectedBeneficiary(state.campaignId)
        .listen((unExpected) {
      add(UnExpectedChanged(unExpected));
    });

    FirebaseProvider()
        .getCampaignActualBeneficiary(state.campaignId)
        .listen((actual) {
      add(ActualChanged(actual));
    });
  }

  Future<void> _onCampaignIdChanged(
      CampaignIdChanged event, Emitter<EventsGraphsState> emit) async {
    if (event.campaignId.isNotEmpty) {

      emit(
        state.copyWith(
            campaignId: event.campaignId, status: NotificationStatus.hasData),
      );
    } else {
      emit(const EventsGraphsState.noData());
    }
  }

  Future<void> _onExpectedChanged(
      ExpectedChanged event, Emitter<EventsGraphsState> emit) async {
    if (event.expected.isNotEmpty) {
      print(event.expected.length);
      // List<ChartData2> nominationPartyList = List.generate(
      //     106,
      //         (index) => ChartData2(
      //             event.expected[index].nominationParty == ""
      //             ? "غير محدد"
      //             :event.expected[index].nominationParty ?? "غير محدد",
      //             event.expected
      //             .where((element) =>
      //         element.nominationParty ==
      //             "كيان شباب مصر")
      //             .length,
      //             10
      //             // event.expected.where((element) => element.nominationParty == audience[index].nominationParty).length
      //     ));
      List<FirebaseCampaignBeneficiary> list = event.expected.where((element) => element.isMale == true).toList();
      emit(
        state.copyWith(
            countExpected: list.length),
      );
    } else {
      emit(const EventsGraphsState.noData());
    }
  }

  Future<void> _onUnExpectedChanged(
      UnExpectedChanged event, Emitter<EventsGraphsState> emit) async {
    if (event.unExpected.isNotEmpty) {
      emit(
        state.copyWith(
            unExpected: event.unExpected, status: NotificationStatus.hasData),
      );
    } else {
      // emit(const EventsGraphsState.noData());
    }
  }

  Future<void> _onActualChanged(
      ActualChanged event, Emitter<EventsGraphsState> emit) async {
    if (event.actual.isNotEmpty) {
      emit(
        state.copyWith(
            actual: event.actual, status: NotificationStatus.hasData),
      );
    } else {
      // emit(const EventsGraphsState.noData());
    }
  }
}
