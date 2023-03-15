import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Models/databasemodels/firebasemodel.dart';
// import 'package:firebase_database/firebase_database.dart';

enum AppLifecycleStatus { online, offline }

class FirebaseProvider {
  static final FirebaseProvider _inst = FirebaseProvider._internal();

  // final firebase_auth.FirebaseAuth _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  FirebaseProvider._internal();

  factory FirebaseProvider() {
    // _inst.currentUser = currentUser;
    return _inst;
  }

  // MainUserData? currentUser;
  final firebaseAuth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance.ref();

  // final DatabaseReference _mainReference = FirebaseDatabase.instance.ref();
  // late final DatabaseReference _databaseReferencePassports =
  //     _mainReference.child("Passports");
  // late final DatabaseReference _databaseReferenceAccommodations =
  //     _mainReference.child("Accommodations");
  // late final DatabaseReference _databaseReferenceUsers =
  //     _mainReference.child("Users");
  // late DatabaseReference notificationReference = _mainReference.child("Notifications");
  //

  //getCoordinatorsData
  Stream<List<FirebaseCoordinatorsModel>> getCoordinatorsData() {
    return FirebaseFirestore.instance
        .collection('HK_Coordinator')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => FirebaseCoordinatorsModel.fromJson(e.data()))
          .toList()
          .reversed
          .toList();
    });
  }
  Stream<List<FirebasePricesItems>> getPrices() {
    final DatabaseReference mainReference = FirebaseDatabase.instance.ref();
    late final DatabaseReference databaseReferencePassports =
    mainReference.child("Prices");
    return databaseReferencePassports.onValue.map((event) {
      List<FirebasePricesItems> pricesItems = [];
      for(DataSnapshot snap in event.snapshot.children){
        for(DataSnapshot snapshot1 in snap.children){
          for(DataSnapshot snapshot2 in snapshot1.children) {
            for(DataSnapshot snapshot3 in snapshot2.children) {
              pricesItems.add(FirebasePricesItems.fromJson(snapshot3));
            }
          }
        }
      }
      return pricesItems;
      // return event.snapshot.children
      //     .map((e) {
      //       return e.children.map((e) {
      //
      //       } ).toList();


        // for(var x in e.children){
        //
        // }
        // return FirebasePricesItems.fromJson(
        //     e);
      });
  }
  // //getCoordinatorsData
  // Stream<List<FirebaseCoordinatorsModel>> getPrices() {
  //   return FirebaseFirestore.instance
  //       .collection('HK_Coordinator')
  //       .snapshots()
  //       .map((event) {
  //     return event.docs
  //         .map((e) => FirebaseCoordinatorsModel.fromJson(e.data()))
  //         .toList()
  //         .reversed
  //         .toList();
  //   });
  // }

  //getCoordinatorsData
  Stream<List<FirebaseHelpModel>> getHelpsData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    return FirebaseFirestore.instance
        .collection('HK_Help')
    // .where("assignmentType",isEqualTo: "دوام جزئي")
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        // FirebaseCoordinatorsModel firebaseCoordinatorsModel = FirebaseCoordinatorsModel.fromJson(
        //     e.data());
        // FirebaseFirestore.instance
        //     .collection('PersonalData')
        //     .doc(firebaseCoordinatorsModel.)

        return FirebaseHelpModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  Stream<List<FirebaseCampaignsModel>> getCampaignsData() {
    return FirebaseFirestore.instance
        .collection('HK_Campaigns')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => FirebaseCampaignsModel.fromJson(e.data()))
          .toList()
          .reversed
          .toList();
    });
  }

  Future<int> getCampaignsDataCount() async {
    AggregateQuery countQuery =
    FirebaseFirestore.instance.collection('HK_Campaigns').count();
    return countQuery
        .get(source: AggregateSource.server)
        .then((value) => value.count);
    // return FirebaseFirestore.instance.collection('HK_Campaigns').count();
  }

  Future<int> getCoordinatorsDataCount() async {
    AggregateQuery countQuery =
    FirebaseFirestore.instance.collection('HK_Coordinator').count();
    return countQuery
        .get(source: AggregateSource.server)
        .then((value) => value.count);
    // return FirebaseFirestore.instance.collection('HK_Campaigns').count();
  }

  //getNotification
  Stream<List<FirebaseDonorsModel>> getDonorsData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    return FirebaseFirestore.instance
        .collection('HK_Donors')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        return FirebaseDonorsModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  //getVolunteers
  Stream<List<FirebaseVolunteersModel>> getVolunteersData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    return FirebaseFirestore.instance
        .collection('HK_Volunteers')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        return FirebaseVolunteersModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  //getCandidates
  Stream<List<FirebaseCandidatesModel>> getCandidatesData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    return FirebaseFirestore.instance
        .collection('HK_Candidates')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        return FirebaseCandidatesModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  //getVolunteers
  Stream<List<FirebaseIssuesModel>> getIssuesData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    return FirebaseFirestore.instance
        .collection('HK_Issues')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        return FirebaseIssuesModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  Stream<List<FirebasePersonalDataModel>> getBeneficialData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    // return FirebaseFirestore.instance.collection('HK_Beneficial').snapshots().map((event) {
    //   return event.docs
    //       .map((e) {
    //         return FirebaseBeneficialModel.fromJson(e.data());
    //       })
    //       .toList()
    //       .reversed
    //       .toList();
    // });
    return FirebaseFirestore.instance
        .collection('PersonalData')
        .where("HK_Beneficial", isEqualTo: true)
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        return FirebasePersonalDataModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  Stream<List<FirebaseListsModel>> getListsData() {
    final firebaseAuth = FirebaseAuth.instance;
    String? emails = firebaseAuth.currentUser?.email;
    var verifiedEmail = emails ?? "";
    // if (verifiedEmail.isEmpty) return;
    return FirebaseFirestore.instance
        .collection('HK_List')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) {
        return FirebaseListsModel.fromJson(e.data());
      })
          .toList()
          .reversed
          .toList();
    });
  }

  Future<FirebaseListsModel?> getListsDataById(String listID) async {
    var collection = FirebaseFirestore.instance.collection('HK_List');
    var docSnapshot = await collection.doc(listID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        return FirebaseListsModel.fromJson(data);
      }

      // Map<String, dynamic>? data = docSnapshot.data();
      // var value = data?['some_field']; // <-- The value you want to retrieve.

    }
    return null;
  }

  //TODO add for list of nationalIDs
  Future<FirebasePersonalDataModel?> getPersonalDataById(
      String nationalID) async {
    var collection = FirebaseFirestore.instance.collection('PersonalData');
    var docSnapshot = await collection.doc(nationalID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        return FirebasePersonalDataModel.fromJson(data);
      }

      // Map<String, dynamic>? data = docSnapshot.data();
      // var value = data?['some_field']; // <-- The value you want to retrieve.

    }
    return null;
  }

  Future<List<FirebasePersonalDataModel>?> getPersonalDataByIdOrName(
      String itemString) async {
    var collection = FirebaseFirestore.instance.collection('PersonalData');
    List<FirebasePersonalDataModel>? items = [];
    var docSnapshot = await collection.doc(itemString).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        items.add(FirebasePersonalDataModel.fromJson(data));
      }
    } else {
      var docSnapshot = await collection
          .where("fullName", isGreaterThanOrEqualTo: itemString)
          .where("fullName", isLessThanOrEqualTo: '$itemString\uf8ff')
          .get();
      if (docSnapshot.docs.isNotEmpty) {
        // var doc = docSnapshot.docs;
        for (var doc in docSnapshot.docs) {
          if (doc.exists) {
            Map<String, dynamic>? data = doc.data();
            items.add(FirebasePersonalDataModel.fromJson(data));
          }
        }
      }
    }
    if (items.isNotEmpty) {
      return items;
    }
    return null;
  }

  //FirebaseCampaignsModel
  Future<FirebaseCampaignsModel?> getCampaignId(String campaignID) async {
    var collection = FirebaseFirestore.instance.collection('HK_Campaigns');
    var docSnapshot = await collection.doc(campaignID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        final firebaseCampaignModel = FirebaseCampaignsModel.fromJson(data);
        if (data["CampaignsCoordinators"] != null) {
          firebaseCampaignModel.coordinators =
          await getCoordinators(data["CampaignsCoordinators"]);
          firebaseCampaignModel.volunteers =
          await getVolunteers(data["CampaignVolunteers"]);
          firebaseCampaignModel.expectedBeneficial =
          await getBeneficial(data["CampaignExpectedBeneficial"]);
        }
        return firebaseCampaignModel;
      }
    }
    return null;
  }

  // CampaignActualBeneficial
  // CampaignExpectedBeneficial

  Future<List<FirebaseCoordinatorsWithPersonalDataModel>> getCoordinators(
      List coordinatorsIds) async {
    List<FirebaseCoordinatorsWithPersonalDataModel> coordinators = [];
    for (var id in coordinatorsIds) {
      final personalData = await getPersonalDataById(id);
      final coordinatorData = await getCoordinatorDataById(id);
      coordinators.add(
        FirebaseCoordinatorsWithPersonalDataModel(
          personalDataModel: personalData,
          coordinatorsModel: coordinatorData,
        ),
      );
    }
    return coordinators;
  }

  Future<List<FirebaseVolunteersWithPersonalDataModel>> getVolunteers(
      List volunteersIds) async {
    List<FirebaseVolunteersWithPersonalDataModel> volunteers = [];
    for (var id in volunteersIds) {
      final personalData = await getPersonalDataById(id);
      final volunteerData = await getVolunteerDataById(id);
      volunteers.add(
        FirebaseVolunteersWithPersonalDataModel(
          personalDataModel: personalData,
          volunteersModel: volunteerData,
        ),
      );
    }
    return volunteers;
  }

  Future<List<FirebaseBeneficialWithPersonalDataModel>> getBeneficial(
      List beneficialIds) async {
    List<FirebaseBeneficialWithPersonalDataModel> beneficial = [];
    for (var id in beneficialIds) {
      final personalData = await getPersonalDataById(id);
      final beneficialData = await getBeneficialDataById(id);
      beneficial.add(
        FirebaseBeneficialWithPersonalDataModel(
          personalDataModel: personalData,
          beneficialModel: beneficialData,
        ),
      );
    }
    return beneficial;
  }

  Future<List<FirebaseCoordinatorsWithPersonalDataModel>?>
  getPersonalDataByListCoordinators(
      List<FirebaseCoordinatorsModel> coordinatorsModelList) async {
    var collection = FirebaseFirestore.instance.collection('PersonalData');
    List<String?> listCoordinatorsIDs =
    coordinatorsModelList.map((e) => e.nationalID).toList();
    var docSnapshot = await collection
        .where('nationalID', whereIn: listCoordinatorsIDs)
        .get();
    if (docSnapshot.docs.isNotEmpty) {
      List<FirebaseCoordinatorsWithPersonalDataModel> list = [];
      for (var singleDocSnap in docSnapshot.docs) {
        Map<String, dynamic>? data = singleDocSnap.data();
        FirebasePersonalDataModel personalDataModel =
        FirebasePersonalDataModel.fromJson(data);
        FirebaseCoordinatorsModel coordinatorsModel = coordinatorsModelList
            .where(
                (element) => element.nationalID == personalDataModel.nationalID)
            .first;
        list.add(FirebaseCoordinatorsWithPersonalDataModel(
            personalDataModel: personalDataModel,
            coordinatorsModel: coordinatorsModel));
        // return ;
      }
      return list;
      // Map<String, dynamic>? data = docSnapshot.data();
      // var value = data?['some_field']; // <-- The value you want to retrieve.
    }
    return null;
  }

  Future<FirebaseCoordinatorsModel?> getCoordinatorDataById(
      String nationalID) async {
    var collection = FirebaseFirestore.instance.collection('HK_Coordinator');
    var docSnapshot = await collection.doc(nationalID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) return FirebaseCoordinatorsModel.fromJson(data);
    }
    return null;
  }

  Future<FirebaseVolunteersModel?> getVolunteerDataById(
      String nationalID) async {
    var collection = FirebaseFirestore.instance.collection('HK_Volunteers');
    var docSnapshot = await collection.doc(nationalID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) return FirebaseVolunteersModel.fromJson(data);
    }
    return null;
  }

  Future<FirebaseBeneficialModel?> getBeneficialDataById(
      String nationalID) async {
    var collection = FirebaseFirestore.instance.collection('HK_Beneficial');
    var docSnapshot = await collection.doc(nationalID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) return FirebaseBeneficialModel.fromJson(data);
    }
    return null;
  }

  Future<FirebaseDonorsModel?> getDonorsDataById(String nationalID) async {
    var collection = FirebaseFirestore.instance.collection('HK_Donors');
    var docSnapshot = await collection.doc(nationalID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        return FirebaseDonorsModel.fromJson(data);
      }

      // Map<String, dynamic>? data = docSnapshot.data();
      // var value = data?['some_field']; // <-- The value you want to retrieve.

    }
    return null;
  }

  Future<FirebaseHelpModel?> getHelpDataById(String helpID) async {
    var collection = FirebaseFirestore.instance.collection('HK_Help');
    var docSnapshot = await collection.doc(helpID).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        return FirebaseHelpModel.fromJson(data);
      }

      // Map<String, dynamic>? data = docSnapshot.data();
      // var value = data?['some_field']; // <-- The value you want to retrieve.

    }
    return null;
  }

  Future<FirebaseAccount?> getAccountByEmail(String email) async {
    var collection = FirebaseFirestore.instance.collection('Accounts');
    var docSnapshot = await collection.doc(email).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        return FirebaseAccount.fromJson(data);
      }
    }
    return null;
  }

// Stream<List<FirebasePassports>> getChartsData() {
//   final DatabaseReference _mainReference = FirebaseDatabase.instance.ref();
//   late final DatabaseReference _databaseReferencePassports =
//   _mainReference.child("Passports");
//   return _databaseReferencePassports.orderByChild("lastUpdate").onValue.map((event) {
//     return event.snapshot.children
//         .map((e) {
//       return FirebasePassports.fromJson(e);
//     })
//         .toList()
//         ;
//   });
// }
// Stream<List<FirebasePassports>> getLastInputPassport() {
//   final DatabaseReference _mainReference = FirebaseDatabase.instance.ref();
//   late final DatabaseReference _databaseReferencePassports =
//   _mainReference.child("Passports");
//   return _databaseReferencePassports.orderByChild("lastUpdate").limitToLast(1).onValue.map((event) {
//     return event.snapshot.children
//         .map((e) {
//       return FirebasePassports.fromJson(e);
//     })
//         .toList()
//     ;
//   });
// }

// Future<List<FirebasePassports>> getNotificationsDataByItems(
//     List<FirebasePassportItems> firebaseItems) async {
//   List<FirebasePassports> firebasePassportsList = [];
//
//   for (var element in firebaseItems) {
//     await _databaseReferencePassports
//         .child(element.id ?? "")
//         .once()
//         .then((value) {
//       if (value.snapshot.value != null) {
//         firebasePassportsList.add(FirebasePassports.fromJson(
//             Map<String, dynamic>.from(value.snapshot.value as dynamic)));
//       }
//     });
//   }
//   return firebasePassportsList;
// }

// Future<List<FirebasePassports>> getNotificationsDataByItemsStream(
//     List<FirebasePassportItems> firebaseItems) async {
//   List<FirebasePassports> firebasePassportsList = [];
//
//   for (var element in firebaseItems) {
//     _databaseReferencePassports.child(element.id ?? "").onValue.map((event) {
//       firebasePassportsList.add(FirebasePassports.fromJson(
//           Map<String, dynamic>.from(event.snapshot.value as dynamic)));
//     });
//     //     .first((value) {
//     //   // if(value.snapshot.value != null){
//     //     return FirebasePassports.fromJson(
//     //         Map<String, dynamic>.from(value.snapshot.value as dynamic));
//     //   // }
//     //
//     // });
//
//   }
//   return firebasePassportsList;
// }
//
// Future<FirebasePassports?> getPassportById(String id) async {
//   return await _databaseReferencePassports.child(id).once().then((value) {
//     if (value.snapshot.value != null) {
//       return FirebasePassports.fromJson(
//           Map<String, dynamic>.from(value.snapshot.value as dynamic));
//     } else {
//       return null;
//     }
//   });
// }

// Stream<List<FirebaseAccommodation>> getAccommodation() =>
//     _databaseReferenceAccommodations.onValue.map((event) {
//       return event.snapshot.children
//           .map((e) => FirebaseAccommodation.fromJson(
//               Map<String, dynamic>.from(e.value as dynamic)))
//           .toList();
//     });

// updateFirebaseData(String dataEdited,String columnName,String passportNationality,String documentNumber)async{
//
//   final firebaseAuth = FirebaseAuth.instance;
//   String? emails = firebaseAuth.currentUser?.email;
//   var verifiedEmail = emails ?? "";
//   if(verifiedEmail.isEmpty) return;
//   // if(verifiedEmail.contains("user1@dsplus-eg.com") ||
//   //     verifiedEmail.contains("mahmoud.abdelmaboud@cop27.com")||
//   //     verifiedEmail.contains("editor@cop27.com")) {
//     String id = "$passportNationality-$documentNumber";
//     Map<String, Object?> map = {
//       columnName: dataEdited,
//       // "lastUpdate": ServerValue.timestamp,
//     };
//     Map<String, Object?> mapAction = {
//       columnName: dataEdited,
//       "email":verifiedEmail,
//       "lastUpdate": ServerValue.timestamp,
//     };
//
//     await _databaseReferencePassports.child(id).update(map);
//     await _databaseReferencePassports.child(id).child("Actions").push().update(mapAction);
//   // }
//
//
//
//
// }

// updateFirebaseCoordinator(AddNewMainPersonalDataInitial cubitState,
//     AddNewHeroesDataInitial heroState) async {
//   final firebaseAuth = FirebaseAuth.instance;
//   String? emails = firebaseAuth.currentUser?.email;
//   var verifiedEmail = emails ?? "";
//   if (verifiedEmail.isEmpty || cubitState.nationalID.isEmpty) return;
//   FirebaseAccount? firebaseAccount = await getAccountByEmail(verifiedEmail);
//   if (firebaseAccount == null) return;
//   Map<String, Object?> map = {};
//   Map<String, Object?> coordinatorsMap = {};
//   CollectionReference coordinators =
//       FirebaseFirestore.instance.collection('HK_Coordinator');
//   CollectionReference personalData =
//       FirebaseFirestore.instance.collection('PersonalData');
//
//   // var getID = await RemoteDataSource().post(endPoint: "/api/citizen/create",body:cubitState.toJson());
//   // await RemoteDataSource().post(endPoint: "/api/citizen/create",body:cubitState.toJson());
//
//   if (heroState.heroType.isNotEmpty) {
//     coordinatorsMap["heroType"] = heroState.heroType;
//   }
//   if (heroState.heroDivision.isNotEmpty) {
//     coordinatorsMap["heroDivision"] = heroState.heroDivision;
//   }
//   if (heroState.heroGovernorate.isNotEmpty) {
//     coordinatorsMap["heroGovernorate"] = heroState.heroGovernorate;
//   }
//   if (heroState.assignmentType.isNotEmpty) {
//     coordinatorsMap["assignmentType"] = heroState.assignmentType;
//   }
//   if (heroState.assignmentStatus.isNotEmpty) {
//     coordinatorsMap["assignmentStatus"] = heroState.assignmentStatus;
//   }
//   if (heroState.reasons.isNotEmpty) {
//     coordinatorsMap["reasons"] = heroState.reasons;
//   }
//   var currentTimestamp = DateTime.now().millisecondsSinceEpoch;
//   if (heroState.attachments.isNotEmpty) {
//     List<String> attachmentsLinks = [];
//     for (String attachments in heroState.attachments) {
//       final taskFullImage = await storageRef
//           .child(cubitState.nationalID)
//           .child("Attachments")
//           .child("/${cubitState.nationalID}")
//           .child("/attachment-$currentTimestamp")
//           .putString(attachments, format: PutStringFormat.base64);
//       var fullImageLink = await taskFullImage.ref.getDownloadURL();
//       attachmentsLinks.add(fullImageLink);
//     }
//     coordinatorsMap["attachments"] = FieldValue.arrayUnion(attachmentsLinks);
//   }
//   if (heroState.user.isNotEmpty) {
//     coordinatorsMap["user"] = heroState.user;
//   }
//
//   if (cubitState.nationalID.isNotEmpty) {
//     map["nationalID"] = cubitState.nationalID;
//     coordinatorsMap["nationalID"] = cubitState.nationalID;
//     Map<String, Object?> mapFirebaseAccount = {};
//     mapFirebaseAccount["AddedCoordinatorsIDs"] =
//         FieldValue.arrayUnion([cubitState.nationalID]);
//     await personalData
//         .doc(firebaseAccount.nationalID)
//         .update(mapFirebaseAccount)
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
//
//   var personalDataMap = await addToPersonalDataMap(cubitState, verifiedEmail);
//   map.addAll(personalDataMap);
//
//   if (map.isNotEmpty || coordinatorsMap.isNotEmpty) {
//     map["lastUpdate"] = FieldValue.serverTimestamp();
//     map["addedByAccount"] = verifiedEmail;
//     map["HK_Coordinator"] = true;
//     coordinatorsMap["lastUpdate"] = FieldValue.serverTimestamp();
//     coordinatorsMap["addedByAccount"] = verifiedEmail;
//   } else {
//     return;
//   }
//
//   await coordinators.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       await coordinators
//           .doc(cubitState.nationalID)
//           .set(coordinatorsMap)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       await coordinators
//           .doc(cubitState.nationalID)
//           .update(coordinatorsMap)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
//
//   await personalData.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       personalData
//           .doc(cubitState.nationalID)
//           .set(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       personalData
//           .doc(cubitState.nationalID)
//           .update(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
// }

// updateFirebaseDonor(AddNewMainPersonalDataInitial cubitState,
//     AddNewDonorsInitial donorState) async {
//   final firebaseAuth = FirebaseAuth.instance;
//   String? emails = firebaseAuth.currentUser?.email;
//   var verifiedEmail = emails ?? "";
//   if (verifiedEmail.isEmpty || cubitState.nationalID.isEmpty) return;
//   FirebaseAccount? firebaseAccount = await getAccountByEmail(verifiedEmail);
//   if (firebaseAccount == null) return;
//   Map<String, Object?> map = {};
//   Map<String, Object?> donorsMap = {};
//   Map<String, Object?> donorsMainMap = {};
//   CollectionReference donors =
//       FirebaseFirestore.instance.collection('HK_Donors');
//   CollectionReference personalData =
//       FirebaseFirestore.instance.collection('PersonalData');
//
//   if (donorState.donationMethod.isNotEmpty) {
//     donorsMap["donationMethod"] = donorState.donationMethod;
//   }
//   if (donorState.donationType.isNotEmpty) {
//     donorsMap["donationType"] = donorState.donationType;
//   }
//   if (donorState.donationType.isNotEmpty) {
//     if (donorState.donationType.contains("نقدى")) {
//       if (donorState.donationAmount.isNotEmpty) {
//         donorsMainMap["donationAmount"] =
//             FieldValue.increment(int.parse(donorState.donationAmount));
//       }
//     }
//     donorsMap["donationAmount"] = donorState.donationAmount;
//   }
//
//   if (donorState.donationDate.isNotEmpty) {
//     donorsMap["donationDate"] = donorState.donationDate;
//   }
//   var currentTimestamp = DateTime.now().millisecondsSinceEpoch;
//   if (donorState.attachments.isNotEmpty) {
//     final taskFullImage = await storageRef
//         .child("Attachments")
//         .child("/${cubitState.nationalID}")
//         .child("/attachment-$currentTimestamp")
//         .putString(donorState.attachments, format: PutStringFormat.base64);
//     var fullImageLink = await taskFullImage.ref.getDownloadURL();
//     donorsMap["attachments"] = fullImageLink;
//   }
//
//   if (cubitState.nationalID.isNotEmpty) {
//     map["nationalID"] = cubitState.nationalID;
//     donorsMap["nationalID"] = cubitState.nationalID;
//     donorsMainMap["nationalID"] = cubitState.nationalID;
//     Map<String, Object?> mapFirebaseAccount = {};
//     mapFirebaseAccount["AddedDonorsIDs"] =
//         FieldValue.arrayUnion([cubitState.nationalID]);
//     await personalData
//         .doc(firebaseAccount.nationalID)
//         .update(mapFirebaseAccount)
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
//
//   var personalDataMap = await addToPersonalDataMap(cubitState, verifiedEmail);
//   map.addAll(personalDataMap);
//
//   if (map.isNotEmpty || donorsMap.isNotEmpty) {
//     map["lastUpdate"] = FieldValue.serverTimestamp();
//     map["addedByAccount"] = verifiedEmail;
//     map["HK_Donor"] = true;
//     donorsMap["lastUpdate"] = FieldValue.serverTimestamp();
//     donorsMap["addedByAccount"] = verifiedEmail;
//     donorsMainMap["lastUpdate"] = FieldValue.serverTimestamp();
//     donorsMainMap["addedByAccount"] = verifiedEmail;
//   } else {
//     return;
//   }
//
//   await donors
//       .doc(cubitState.nationalID)
//       .collection("Donations")
//       .add(donorsMap)
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
//
//   await donors
//       .doc(cubitState.nationalID)
//       .update(donorsMainMap)
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
//
//   await personalData.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       await personalData
//           .doc(cubitState.nationalID)
//           .set(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       await personalData
//           .doc(cubitState.nationalID)
//           .update(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
// }

// updateFirebaseVolunteer(AddNewMainPersonalDataInitial cubitState,
//     AddNewVolunteersInitial volunteerState) async {
//   final firebaseAuth = FirebaseAuth.instance;
//   String? emails = firebaseAuth.currentUser?.email;
//   var verifiedEmail = emails ?? "";
//   if (verifiedEmail.isEmpty || cubitState.nationalID.isEmpty) return;
//   FirebaseAccount? firebaseAccount = await getAccountByEmail(verifiedEmail);
//   if (firebaseAccount == null) return;
//   Map<String, Object?> map = {};
//   Map<String, Object?> volunteerMap = {};
//   CollectionReference volunteers =
//       FirebaseFirestore.instance.collection('HK_Volunteers');
//   CollectionReference personalData =
//       FirebaseFirestore.instance.collection('PersonalData');
//
//   if (volunteerState.volunteerStatus.isNotEmpty) {
//     volunteerMap["volunteerStatus"] = volunteerState.volunteerStatus;
//   }
//   if (volunteerState.areasOfVolunteering.isNotEmpty) {
//     volunteerMap["areasOfVolunteering"] = volunteerState.areasOfVolunteering;
//   }
//
//   if (cubitState.nationalID.isNotEmpty) {
//     map["nationalID"] = cubitState.nationalID;
//     volunteerMap["nationalID"] = cubitState.nationalID;
//     Map<String, Object?> mapFirebaseAccount = {};
//     mapFirebaseAccount["AddedVolunteersIDs"] =
//         FieldValue.arrayUnion([cubitState.nationalID]);
//     await personalData
//         .doc(firebaseAccount.nationalID)
//         .update(mapFirebaseAccount)
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
//
//   var personalDataMap = await addToPersonalDataMap(cubitState, verifiedEmail);
//   map.addAll(personalDataMap);
//
//   if (map.isNotEmpty || volunteerMap.isNotEmpty) {
//     map["lastUpdate"] = FieldValue.serverTimestamp();
//     map["addedByAccount"] = verifiedEmail;
//     map["HK_Volunteers"] = true;
//     volunteerMap["lastUpdate"] = FieldValue.serverTimestamp();
//     volunteerMap["addedByAccount"] = verifiedEmail;
//   } else {
//     return;
//   }
//
//   await volunteers.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       await volunteers
//           .doc(cubitState.nationalID)
//           .set(volunteerMap)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       await volunteers
//           .doc(cubitState.nationalID)
//           .update(volunteerMap)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
//   await personalData.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       await personalData
//           .doc(cubitState.nationalID)
//           .set(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       await personalData
//           .doc(cubitState.nationalID)
//           .update(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
// }

// updateFirebaseCandidates(AddNewMainPersonalDataInitial cubitState,
//     AddNewCandidatesInitial candidatesState) async {
//   final firebaseAuth = FirebaseAuth.instance;
//   String? emails = firebaseAuth.currentUser?.email;
//   var verifiedEmail = emails ?? "";
//   if (verifiedEmail.isEmpty || cubitState.nationalID.isEmpty) return;
//   FirebaseAccount? firebaseAccount = await getAccountByEmail(verifiedEmail);
//   if (firebaseAccount == null) return;
//   Map<String, Object?> map = {};
//   Map<String, Object?> volunteerMap = {};
//   CollectionReference volunteers =
//       FirebaseFirestore.instance.collection('HK_Candidates');
//   CollectionReference personalData =
//       FirebaseFirestore.instance.collection('PersonalData');
//
//   if (candidatesState.candidateStatus.isNotEmpty) {
//     volunteerMap["volunteerStatus"] = candidatesState.candidateStatus;
//   }
//   if (candidatesState.areasOfCandidate.isNotEmpty) {
//     volunteerMap["areasOfVolunteering"] = candidatesState.areasOfCandidate;
//   }
//
//   if (cubitState.nationalID.isNotEmpty) {
//     map["nationalID"] = cubitState.nationalID;
//     volunteerMap["nationalID"] = cubitState.nationalID;
//     Map<String, Object?> mapFirebaseAccount = {};
//     mapFirebaseAccount["AddedCandidatesIDs"] =
//         FieldValue.arrayUnion([cubitState.nationalID]);
//     await personalData
//         .doc(firebaseAccount.nationalID)
//         .update(mapFirebaseAccount)
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }
//
//   var personalDataMap = await addToPersonalDataMap(cubitState, verifiedEmail);
//   map.addAll(personalDataMap);
//
//   if (map.isNotEmpty || volunteerMap.isNotEmpty) {
//     map["lastUpdate"] = FieldValue.serverTimestamp();
//     map["addedByAccount"] = verifiedEmail;
//     map["HK_Candidates"] = true;
//     volunteerMap["lastUpdate"] = FieldValue.serverTimestamp();
//     volunteerMap["addedByAccount"] = verifiedEmail;
//   } else {
//     return;
//   }
//
//   await volunteers.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       await volunteers
//           .doc(cubitState.nationalID)
//           .set(volunteerMap)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       await volunteers
//           .doc(cubitState.nationalID)
//           .update(volunteerMap)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
//   await personalData.doc(cubitState.nationalID).get().then((value) async {
//     if (!value.exists) {
//       await personalData
//           .doc(cubitState.nationalID)
//           .set(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     } else {
//       await personalData
//           .doc(cubitState.nationalID)
//           .update(map)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//   });
// }

//   updateFirebaseBeneficial(AddNewMainPersonalDataInitial cubitState,
//       AddNewBeneficialInitial beneficialState) async {
//     final firebaseAuth = FirebaseAuth.instance;
//     String? emails = firebaseAuth.currentUser?.email;
//     var verifiedEmail = emails ?? "";
//     if (verifiedEmail.isEmpty || cubitState.nationalID.isEmpty) return;
//     Map<String, Object?> map = {};
//     Map<String, Object?> beneficialMap = {};
//     CollectionReference beneficial =
//         FirebaseFirestore.instance.collection('HK_Beneficial');
//     CollectionReference personalData =
//         FirebaseFirestore.instance.collection('PersonalData');
//     CollectionReference campaignsData =
//         FirebaseFirestore.instance.collection('HK_Campaigns');
//
//     //TODO talab el mosa3da array
//
//     // if (beneficialState.beneficialDate.isNotEmpty) {
//     //   beneficialMap["beneficialDate"] = beneficialState.beneficialDate;
//     // }
//     // if (beneficialState.beneficialDetails.isNotEmpty) {
//     //   beneficialMap["beneficialDetails"] = beneficialState.beneficialDetails;
//     // }
//
//     if (cubitState.nationalID.isNotEmpty) {
//       map["nationalID"] = cubitState.nationalID;
//       beneficialMap["nationalID"] = cubitState.nationalID;
//     }
//
//     var personalDataMap = await addToPersonalDataMap(cubitState, verifiedEmail);
//     map.addAll(personalDataMap);
//
//     if (map.isNotEmpty || beneficialMap.isNotEmpty) {
//       map["lastUpdate"] = FieldValue.serverTimestamp();
//       map["addedByAccount"] = verifiedEmail;
//       map["HK_Beneficial"] = true;
//       beneficialMap["lastUpdate"] = FieldValue.serverTimestamp();
//       beneficialMap["addedByAccount"] = verifiedEmail;
//       // TODO added to campaigns details for each one
//       List<String?> campaignsID =
//           beneficialState.beneficialCampaign.map((e) => e.campaignsID).toList();
//       Map<String, Object?> beneficialMapCampaigns = {};
//       beneficialMapCampaigns["CampaignActualBeneficial"] =
//           FieldValue.arrayUnion(campaignsID);
//       beneficialMapCampaigns["lastUpdate"] = FieldValue.serverTimestamp();
//       beneficialMapCampaigns["addedByAccount"] = verifiedEmail;
//       await beneficial.doc(cubitState.nationalID).get().then((value) async {
//         if (!value.exists) {
//           await beneficial
//               .doc(cubitState.nationalID)
//               .set(beneficialMapCampaigns)
//               .then((value) => print("User Added"))
//               .catchError((error) => print("Failed to add user: $error"));
//         } else {
//           await beneficial
//               .doc(cubitState.nationalID)
//               .update(beneficialMapCampaigns)
//               .then((value) => print("User Added"))
//               .catchError((error) => print("Failed to add user: $error"));
//         }
//       });
//       await personalData.doc(cubitState.nationalID).get().then((value) async {
//         if (!value.exists) {
//           await personalData
//               .doc(cubitState.nationalID)
//               .set(beneficialMapCampaigns)
//               .then((value) => print("User Added"))
//               .catchError((error) => print("Failed to add user: $error"));
//         } else {
//           await personalData
//               .doc(cubitState.nationalID)
//               .update(beneficialMapCampaigns)
//               .then((value) => print("User Added"))
//               .catchError((error) => print("Failed to add user: $error"));
//         }
//       });
//
//       // await beneficial.doc(cubitState.nationalID).update({});
//       Map<String, Object?> campaignsActualBeneficial = {};
//       campaignsActualBeneficial["CampaignActualBeneficial"] =
//           FieldValue.arrayUnion([cubitState.nationalID]);
//       //TODO add beneficial sub data
//       for (FirebaseCampaignsModel model in beneficialState.beneficialCampaign) {
//         // await beneficial.doc(cubitState.nationalID).collection("HK_Campaigns").doc(model.campaignsID).set({
//         //   "Collection": "HK_Campaigns",
//         //   "HR_Campaigns_ID": model.campaignsID,
//         //   "nationalID":cubitState.nationalID,
//         //   "lastUpdate": FieldValue.serverTimestamp(),
//         //   "addedByAccount": verifiedEmail,
//         //   "module": "HK"
//         // });
//         // await personalData.doc(cubitState.nationalID).collection("HK_Campaigns").doc(model.campaignsID).set({
//         //   "Collection": "HK_Campaigns",
//         //   "HR_Campaigns_ID": model.campaignsID,
//         //   "nationalID":cubitState.nationalID,
//         //   "lastUpdate": FieldValue.serverTimestamp(),
//         //   "addedByAccount": verifiedEmail,
//         //   "module": "HK"
//         // });
//         await campaignsData
//             .doc(model.campaignsID)
//             .update(campaignsActualBeneficial);
//         // await campaignsData.doc(model.campaignsID).collection("CampaignActualBeneficial").doc(cubitState.nationalID).set({
//         //   "Collection": "HK_Campaigns",
//         //   "HR_Campaigns_ID": model.campaignsID,
//         //   "nationalID":cubitState.nationalID,
//         //   "lastUpdate": FieldValue.serverTimestamp(),
//         //   "addedByAccount": verifiedEmail,
//         //   "module": "HK"
//         // });
//       }
//       // TODO add help needed loop
//       // for(FirebaseCampaignsModel model in beneficialState.beneficialCampaign){
//       //   await personalData.doc(cubitState.nationalID).collection("HK_Campaigns_in").doc(model.campaignsID).set({
//       //     "Collection": "HK_Campaigns",
//       //     "HR_Campaigns_ID": model.campaignsID,
//       //     "nationalID":cubitState.nationalID,
//       //     "lastUpdate": FieldValue.serverTimestamp(),
//       //     "addedByAccount": verifiedEmail,
//       //     "module": "HK"
//       //   });
//       // }
//
//     } else {
//       return;
//     }
//
//     await beneficial
//         .doc(cubitState.nationalID)
//         .update(beneficialMap)
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//
//     await beneficial.doc(cubitState.nationalID).get().then((value) async {
//       if (!value.exists) {
//         beneficial
//             .doc(cubitState.nationalID)
//             .set(beneficialMap)
//             .then((value) => print("User Added"))
//             .catchError((error) => print("Failed to add user: $error"));
//       } else {
//         beneficial
//             .doc(cubitState.nationalID)
//             .update(beneficialMap)
//             .then((value) => print("User Added"))
//             .catchError((error) => print("Failed to add user: $error"));
//       }
//     });
//     await personalData.doc(cubitState.nationalID).get().then((value) async {
//       if (!value.exists) {
//         personalData
//             .doc(cubitState.nationalID)
//             .set(map)
//             .then((value) => print("User Added"))
//             .catchError((error) => print("Failed to add user: $error"));
//       } else {
//         personalData
//             .doc(cubitState.nationalID)
//             .update(map)
//             .then((value) => print("User Added"))
//             .catchError((error) => print("Failed to add user: $error"));
//       }
//     });
//   }
//
//   updateFirebaseCampaigns(AddNewCampaignsInitial campaignsInitial) async {
//     final firebaseAuth = FirebaseAuth.instance;
//     String? emails = firebaseAuth.currentUser?.email;
//     var verifiedEmail = emails ?? "";
//     if (verifiedEmail.isEmpty) return;
//     Map<String, Object?> campaignsMap = {};
//
//     CollectionReference campaigns =
//         FirebaseFirestore.instance.collection('HK_Campaigns');
//     CollectionReference personalData =
//         FirebaseFirestore.instance.collection('PersonalData');
//     String campaignsId = campaigns.doc().id.toString();
//
//     if (campaignsInitial.name.isNotEmpty)
//       campaignsMap["name"] = campaignsInitial.name;
//     if (campaignsInitial.startDate.isNotEmpty)
//       campaignsMap["date"] = campaignsInitial.startDate;
//     if (campaignsInitial.type.isNotEmpty)
//       campaignsMap["type"] = campaignsInitial.type;
//     if (campaignsInitial.aidsNumber.isNotEmpty)
//       campaignsMap["aidsNumber"] = campaignsInitial.aidsNumber;
//     if (campaignsInitial.details.isNotEmpty)
//       campaignsMap["details"] = campaignsInitial.details;
//     if (campaignsInitial.initiativeName.isNotEmpty)
//       campaignsMap["initiativeName"] = campaignsInitial.initiativeName;
//     if (campaignsInitial.endDate.isNotEmpty)
//       campaignsMap["endDate"] = campaignsInitial.endDate;
//     if (campaignsInitial.aidsNumber.isNotEmpty)
//       campaignsMap["aidsNumber"] = campaignsInitial.aidsNumber;
//     if (campaignsInitial.governorate.isNotEmpty)
//       campaignsMap["governorate"] = campaignsInitial.governorate;
//     if (campaignsInitial.division.isNotEmpty)
//       campaignsMap["division"] = campaignsInitial.division;
//     if (campaignsInitial.status.isNotEmpty)
//       campaignsMap["status"] = campaignsInitial.status;
//     if (campaignsMap.isNotEmpty) campaignsMap["campaignsID"] = campaignsId;
//
//     //TODO add kaymenet monaseken
//     // List<String?> listOfCoordinatorsNationalIDs = campaignsInitial
//     //     .campaignCoordinators
//     //     .map((e) => e.personalDataModel?.nationalID)
//     //     .toList();
//     // if (listOfCoordinatorsNationalIDs.isNotEmpty) {
//     //   campaignsMap["CampaignsCoordinators"] = listOfCoordinatorsNationalIDs;
//     //   for (FirebaseCoordinatorsWithPersonalDataModel coordinatorModel
//     //       in campaignsInitial.campaignCoordinators) {
//     //     // TODO add in coordinator personal data that he support in this campaign
//     //     Map<String, Object?> map = {};
//     //     map["CampaignsSupport"] = FieldValue.arrayUnion([campaignsId]);
//     //     await personalData
//     //         .doc(coordinatorModel.personalDataModel?.nationalID)
//     //         .update(map)
//     //         .then((value) => print("User Added"))
//     //         .catchError((error) => print("Failed to add user: $error"));
//     //   }
//     // }
//
//     //TODO when submit from mobile app actual and beneficial actual
//   //   List<String?> listOfCampaignActualNationalIDs = campaignsInitial
//   //       .campaignActualBeneficials
//   //       .map((e) => e.personalDataModel?.nationalID)
//   //       .toList();
//   //   if (listOfCampaignActualNationalIDs.isNotEmpty) {
//   //     campaignsMap["CampaignActualBeneficial"] =
//   //         listOfCampaignActualNationalIDs;
//   //     for (FirebaseBeneficialWithPersonalDataModel beneficialActualModel
//   //         in campaignsInitial.campaignActualBeneficials) {
//   //       // TODO add in beneficial personal data that he been Supported in this campaign
//   //       Map<String, Object?> map = {};
//   //       map["CampaignsSupportNeeded"] = FieldValue.arrayUnion([campaignsId]);
//   //       await personalData
//   //           .doc(beneficialActualModel.personalDataModel?.nationalID)
//   //           .update(map)
//   //           .then((value) => print("User Added"))
//   //           .catchError((error) => print("Failed to add user: $error"));
//   //     }
//   //   }
//   //
//   //   //TODO add beneficial expected
//   //   List<String?> listOfCampaignExpectedNationalIDs = campaignsInitial
//   //       .campaignExpectedBeneficials
//   //       .map((e) => e.personalDataModel?.nationalID)
//   //       .toList();
//   //   if (listOfCampaignExpectedNationalIDs.isNotEmpty) {
//   //     campaignsMap["CampaignExpectedBeneficial"] =
//   //         listOfCampaignExpectedNationalIDs;
//   //   }
//   //
//   //   List<String?> listOfCampaignVolunteersNationalIDs = campaignsInitial
//   //       .campaignVolunteers
//   //       .map((e) => e.personalDataModel?.nationalID)
//   //       .toList();
//   //   if (listOfCampaignVolunteersNationalIDs.isNotEmpty) {
//   //     campaignsMap["CampaignVolunteers"] = listOfCampaignVolunteersNationalIDs;
//   //     for (FirebaseVolunteersWithPersonalDataModel volunteersModel
//   //         in campaignsInitial.campaignVolunteers) {
//   //       // TODO add in Volunteers data
//   //       Map<String, Object?> map = {};
//   //       map["CampaignsSupport"] = FieldValue.arrayUnion([campaignsId]);
//   //       await personalData
//   //           .doc(volunteersModel.personalDataModel?.nationalID)
//   //           .update(map)
//   //           .then((value) => print("User Added"))
//   //           .catchError((error) => print("Failed to add user: $error"));
//   //     }
//   //   }
//   //
//   //   await campaigns.doc(campaignsId).get().then((value) async {
//   //     if (!value.exists) {
//   //       await campaigns
//   //           .doc(campaignsId)
//   //           .set(campaignsMap)
//   //           .then((value) => print("Campaigns Added"))
//   //           .catchError((error) => print("Failed to add Campaigns: $error"));
//   //     } else {
//   //       await campaigns
//   //           .doc(campaignsId)
//   //           .update(campaignsMap)
//   //           .then((value) => print("Campaigns Added"))
//   //           .catchError((error) => print("Failed to add Campaigns: $error"));
//   //     }
//   //   });
//   // }
//
//   updateFirebaseHelpNeeded(AddNewMainPersonalDataInitial cubitState,
//       AddNewHelpsInitial helpsState) async {
//     final firebaseAuth = FirebaseAuth.instance;
//     String? emails = firebaseAuth.currentUser?.email;
//     var verifiedEmail = emails ?? "";
//     if (verifiedEmail.isEmpty || cubitState.nationalID.isEmpty) return;
//
//     FirebaseAccount? firebaseAccount = await getAccountByEmail(verifiedEmail);
//     if (firebaseAccount == null) return;
//     Map<String, Object?> map = {};
//     Map<String, Object?> helpMap = {};
//     //TODO 7yt7at fel monasek 2le 2adem al talab done
//     //TODO 7yet7ad lel beneficial
//     //TODO Data bta3et al talab
//
//     CollectionReference helpNeededCollection =
//         FirebaseFirestore.instance.collection('HK_Help');
//     String helpNeededID = helpNeededCollection.doc().id.toString();
//     CollectionReference personalData =
//         FirebaseFirestore.instance.collection('PersonalData');
//
//     Map<String, Object?> mapFirebaseAccount = {};
//     mapFirebaseAccount["AddedHelpNeededSupport"] =
//         FieldValue.arrayUnion([helpNeededID]);
//     await personalData
//         .doc(firebaseAccount.nationalID)
//         .update(mapFirebaseAccount)
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
//
//     if (helpsState.income.isNotEmpty) {
//       helpMap["income"] = helpsState.income;
//     }
//     if (helpsState.incomeSource.isNotEmpty) {
//       helpMap["incomeSource"] = helpsState.incomeSource;
//     }
//     if (helpsState.accommodationType.isNotEmpty) {
//       helpMap["accommodationType"] = helpsState.accommodationType;
//     }
//     if (helpsState.houseDescription.isNotEmpty) {
//       helpMap["houseDescription"] = helpsState.houseDescription;
//     }
//     if (helpsState.researcherSaw.isNotEmpty) {
//       helpMap["researcherSaw"] = helpsState.researcherSaw;
//     }
//     if (helpsState.previousAid.isNotEmpty) {
//       helpMap["previousAid"] = helpsState.previousAid;
//     }
//     if (helpsState.caseRequirements.isNotEmpty) {
//       helpMap["caseRequirements"] = helpsState.caseRequirements;
//     }
//     if (helpsState.requestImportance.isNotEmpty) {
//       helpMap["requestImportance"] = helpsState.requestImportance;
//     }
//     if (helpsState.requestImportance.isNotEmpty) {
//       helpMap["requestImportance"] = helpsState.requestImportance;
//     }
//     if (helpsState.family.isNotEmpty) {
//       helpMap["familyNumber"] = helpsState.family.length;
//     }
//
//     var currentTimestamp = DateTime.now().millisecondsSinceEpoch;
//     if (helpsState.attachments.isNotEmpty) {
//       final taskFullImage = await storageRef
//           .child("Attachments")
//           .child("/${cubitState.nationalID}")
//           .child("/attachment-$currentTimestamp")
//           .putString(helpsState.attachments, format: PutStringFormat.base64);
//       var fullImageLink = await taskFullImage.ref.getDownloadURL();
//       helpMap["attachments"] = fullImageLink;
//     }
//     // TODO family needed
//
//     if (cubitState.nationalID.isNotEmpty) {
//       map["nationalID"] = cubitState.nationalID;
//       helpMap["nationalID"] = cubitState.nationalID;
//     }
//
//     var personalDataMap = await addToPersonalDataMap(cubitState, verifiedEmail);
//     map.addAll(personalDataMap);
//     if (helpMap.isNotEmpty) {
//       helpMap["lastUpdate"] = FieldValue.serverTimestamp();
//       helpMap["addedByAccount"] = verifiedEmail;
//       map["verifiedBeneficial"] = true;
//     }
//     if (map.isNotEmpty || helpMap.isNotEmpty) {
//       map["lastUpdate"] = FieldValue.serverTimestamp();
//       map["addedByAccount"] = verifiedEmail;
//       Map<String, Object?> mapHelpNeeded = {};
//       mapHelpNeeded["HKHelpNeeded"] = FieldValue.arrayUnion([helpNeededID]);
//       mapHelpNeeded["Family"] = FieldValue.arrayUnion([helpNeededID]);
//       await personalData
//           .doc(cubitState.nationalID)
//           .update(mapHelpNeeded)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//       // personalData.doc(cubitState.nationalID).update(data)
//       // personalData.doc(cubitState.nationalID).collection("HK_Help_Needed").doc(helpNeededID).update({
//       //   "Collection": "HK_Help_Needed",
//       //   "nationalID":cubitState.nationalID,
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "module": "HK"
//       // });
//
//       Map<String, Object?> mapAddedHelpNeeded = {};
//       mapHelpNeeded["HKAddedHelpNeeded"] =
//           FieldValue.arrayUnion([helpNeededID]);
//       await personalData
//           .doc(firebaseAccount.nationalID)
//           .update(mapAddedHelpNeeded)
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//
//       // personalData.doc(firebaseAccount.nationalID).collection("HK_Added_Help_Needed").doc(helpNeededID).update({
//       //   "Collection": "HK_Help_Needed",
//       //   "nationalID":cubitState.nationalID,
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "module": "HK"
//       // });
//       //TODO Family
//       // for(FamilyModel model in helpsState.family){
//       //   await personalData.doc(cubitState.nationalID).collection("HK_Campaigns_in").doc(model.campaignsID).set({
//       //     "Collection": "HK_Campaigns",
//       //     "HR_Campaigns_ID": model.campaignsID,
//       //     "nationalID":cubitState.nationalID,
//       //     "lastUpdate": FieldValue.serverTimestamp(),
//       //     "addedByAccount": verifiedEmail,
//       //     "module": "HK"
//       //   });
//       //   await campaignsData.doc(model.campaignsID).collection("HK_Campaigns_in").doc(cubitState.nationalID).set({
//       //     "Collection": "HK_Campaigns",
//       //     "HR_Campaigns_ID": model.campaignsID,
//       //     "nationalID":cubitState.nationalID,
//       //     "lastUpdate": FieldValue.serverTimestamp(),
//       //     "addedByAccount": verifiedEmail,
//       //     "module": "HK"
//       //   });
//       // }
//     } else {
//       return;
//     }
//
//     await helpNeededCollection.doc(helpNeededID).get().then((value) async {
//       if (!value.exists) {
//         helpNeededCollection
//             .doc(helpNeededID)
//             .set(helpMap)
//             .then((value) => print("helpNeededCollection Added"))
//             .catchError(
//                 (error) => print("Failed to add helpNeededCollection: $error"));
//       } else {
//         helpNeededCollection
//             .doc(helpNeededID)
//             .update(helpMap)
//             .then((value) => print("helpNeededCollection Added"))
//             .catchError(
//                 (error) => print("Failed to add helpNeededCollection: $error"));
//       }
//     });
//
//     await personalData.doc(cubitState.nationalID).get().then((value) async {
//       if (!value.exists) {
//         personalData
//             .doc(cubitState.nationalID)
//             .set(map)
//             .then((value) => print("User Added"))
//             .catchError((error) => print("Failed to add user: $error"));
//       } else {
//         personalData
//             .doc(cubitState.nationalID)
//             .update(map)
//             .then((value) => print("User Added"))
//             .catchError((error) => print("Failed to add user: $error"));
//       }
//     });
//   }
//
//   updateFirebaseImageTest(String image) async {
//     final taskFullImage = await storageRef
//         .child("Attachments")
//         .child("/test")
//         .child("/attachment-test.png")
//         .putString(image, format: PutStringFormat.base64);
//     var fullImageLink = await taskFullImage.ref.getDownloadURL();
//
//     HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
//       'annotateImage',
//       // options: HttpsCallableOptions(
//       //   timeout: const Duration(seconds: 5),
//       // ),
//     );
//
//     Map<String, dynamic> map = <String, dynamic>{
//       "image": {
//         "source": {
//           "imageUri": fullImageLink,
//         }
//       },
//       "features": [
//         {"type": "TEXT_DETECTION"}
//       ]
//     };
//
//     final resp = await callable.call(map);
//     if (resp.data != null) {
//       // AnnotationCallBack callBack = AnnotationCallBack.fromJson(resp.data);
//       var textData = resp.data[0]["fullTextAnnotation"]["text"].toString();
//       print(textData);
//       if (textData.isNotEmpty) {
//         // print(textData);
//         int firstNameIndex = 2;
//         int lastNameIndex = 3;
//         final splitted = textData.split('\n');
//         if (splitted[1].isNotEmpty) {
//           if (splitted[1].contains("بطاقة") || splitted[1].contains("شخصية")) {
//             firstNameIndex = 2;
//             lastNameIndex = 3;
//           } else {
//             firstNameIndex = 1;
//             lastNameIndex = 2;
//           }
//         }
//         if (splitted[firstNameIndex].isNotEmpty) {
//           print(splitted[firstNameIndex]);
//           // firstName = splitted[firstNameIndex].toString();
//         }
//         if (splitted[lastNameIndex].isNotEmpty) {
//           print(splitted[lastNameIndex]);
//           // lastName = splitted[lastNameIndex].toString();
//         }
//         String singleline = textData.replaceAll("\n", "-");
//         // frontIdData = singleline.toString();
//       }
//     }
//
//     // return fullImageLink;
//   }
//
//   updateFirebaseIssues(AddNewIssuesInitial issuesInitial) async {
//     final firebaseAuth = FirebaseAuth.instance;
//     String? emails = firebaseAuth.currentUser?.email;
//     var verifiedEmail = emails ?? "";
//     if (verifiedEmail.isEmpty) return;
//     Map<String, Object?> issuesMap = {};
//     // TODO 7yta7 fel 2adem al talab
//     // TODO Moshkela nafsaha
//
//     CollectionReference issueCollection =
//         FirebaseFirestore.instance.collection('HK_Issues');
//     String issueId = issueCollection.doc().id.toString();
//
//     if (issuesInitial.issueName.isNotEmpty) {
//       issuesMap["issueName"] = issuesInitial.issueName;
//     }
//     if (issuesInitial.issueGovernorate.isNotEmpty) {
//       issuesMap["issueGovernorate"] = issuesInitial.issueGovernorate;
//     }
//
//     if (issuesInitial.attachments.isNotEmpty) {
//       issuesMap["attachments"] = issuesInitial.attachments;
//     }
//     if (issuesInitial.issueDescription.isNotEmpty) {
//       issuesMap["issueDescription"] = issuesInitial.issueDescription;
//     }
//     if (issuesInitial.priority.isNotEmpty) {
//       issuesMap["priority"] = issuesInitial.priority;
//     }
//     if (issuesInitial.issueDivision.isNotEmpty) {
//       issuesMap["issueDivision"] = issuesInitial.issueDivision;
//     }
//
//     if (issuesMap.isNotEmpty) {
//       issuesMap["issueId"] = issueId;
//       issuesMap["issueStatus"] = 0;
//     } else {
//       return;
//     }
//
//     await issueCollection.doc(issueId).get().then((value) async {
//       if (!value.exists) {
//         await issueCollection
//             .doc(issueId)
//             .set(issuesMap)
//             .then((value) => print("issueCollection Added"))
//             .catchError(
//                 (error) => print("Failed to add issueCollection: $error"));
//       } else {
//         await issueCollection
//             .doc(issueId)
//             .update(issuesMap)
//             .then((value) => print("issueCollection Added"))
//             .catchError(
//                 (error) => print("Failed to add issueCollection: $error"));
//       }
//     });
//   }
//
//   updateFirebaseListCollection(AddNewListInitial listInitial) async {
//     final firebaseAuth = FirebaseAuth.instance;
//     String? emails = firebaseAuth.currentUser?.email;
//     var verifiedEmail = emails ?? "";
//     if (verifiedEmail.isEmpty) return;
//     FirebaseAccount? firebaseAccount = await getAccountByEmail(verifiedEmail);
//     if (firebaseAccount == null) return;
//     Map<String, Object?> map = {};
//     CollectionReference listCollection =
//         FirebaseFirestore.instance.collection('HK_List');
//     String listId = listCollection.doc().id.toString();
//
//     if (listInitial.listName.isNotEmpty) {
//       map["listName"] = listInitial.listName;
//     }
//     if (listInitial.listType.isNotEmpty) {
//       map["listType"] = listInitial.listType;
//     }
//     if (listInitial.listSubType.isNotEmpty) {
//       map["listSubType"] = listInitial.listSubType;
//     }
//     if (map.isNotEmpty) {
//       map["lastUpdate"] = FieldValue.serverTimestamp();
//       map["addedByAccount"] = verifiedEmail;
//       map["listID"] = listId;
//       map["listCount"] = 0;
//       map["locked"] = false;
//     } else {
//       return;
//     }
//
//     await listCollection
//         .doc(listId)
//         .set(map)
//         .then((value) => print("List Added"))
//         .catchError((error) => print("Failed to add List: $error"));
//
//     // if(map.isNotEmpty){
//     //   map["code"] = "updated by ocr";
//     //   String currentKey = key ?? "";
//     //   if(currentKey.isNotEmpty){
//     //     // await _databaseReferencePassports.child(currentKey).update(map);
//     //   }
//     // }
//   }
//
//   updateFirebaseDataToList(String? listID, List<String> listOfPeople) async {
//     final firebaseAuth = FirebaseAuth.instance;
//     String? emails = firebaseAuth.currentUser?.email;
//     var verifiedEmail = emails ?? "";
//     if (verifiedEmail.isEmpty) return;
//     Map<String, Object?> map = {};
//     if (listID == null) return;
//     CollectionReference listCollection =
//         FirebaseFirestore.instance.collection('HK_List');
//     // String listId= listCollection.doc().id.toString();
//     // List<String?> listOfNationalIDs = listOfPeople.map((e) => e.nationalID).toList();
//
//     // if (listInitial.listName.isNotEmpty) {
//     map["nationalIDs"] = FieldValue.arrayUnion(listOfPeople);
//
//     // }
//     // if (listInitial.listType.isNotEmpty) {
//     //   map["listType"] = listInitial.listType;
//     // }
//     // if (map.isNotEmpty) {
//     //   map["lastUpdate"] = FieldValue.serverTimestamp();
//     //   map["addedByAccount"] = verifiedEmail;
//     //   map["listID"] = listId;
//     //   map["listCount"] = 0;
//     // }else{
//     //   return;
//     // }
//
//     await listCollection
//         .doc(listID)
//         .update(map)
//         .then((value) => print("List Added"))
//         .catchError((error) => print("Failed to add List: $error"));
//
//     // if(map.isNotEmpty){
//     //   map["code"] = "updated by ocr";
//     //   String currentKey = key ?? "";
//     //   if(currentKey.isNotEmpty){
//     //     // await _databaseReferencePassports.child(currentKey).update(map);
//     //   }
//     // }
//   }
//
//   //TODO kayma mo5asasa -> 3ayzha men almosafeden wala mn el motatwe3en wala mn al monsa2en wala mn al motabare3en mydefsh excel
//
//   //TODO kayema 3ama ->
//
//   Future<Map<String, dynamic>> addToPersonalDataMap(
//       AddNewMainPersonalDataInitial cubitState, String verifiedEmail) async {
//     CollectionReference personalData =
//         FirebaseFirestore.instance.collection('PersonalData');
//     Map<String, Object?> map = {};
//     if (cubitState.name.isNotEmpty) {
//       map["fullName"] = cubitState.name;
//       // await personalData.doc(cubitState.nationalID).collection("fullName").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "fullName": cubitState.name,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.jobTitle.isNotEmpty) {
//       map["jobTitle"] = cubitState.jobTitle;
//       // await personalData.doc(cubitState.nationalID).collection("jobTitle").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "jobTitle": cubitState.jobTitle,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.governorate.isNotEmpty) {
//       map["governorate"] = cubitState.governorate;
//       // await personalData.doc(cubitState.nationalID).collection("governorate").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "governorate": cubitState.jobTitle,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.division.isNotEmpty) {
//       map["division"] = cubitState.division;
//       // await personalData.doc(cubitState.nationalID).collection("division").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "division": cubitState.division,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.gender.isNotEmpty) {
//       map["gender"] = cubitState.gender;
//     }
//     if (cubitState.dateOfBirth.isNotEmpty) {
//       map["dateOfBirth"] = cubitState.dateOfBirth;
//       // await personalData.doc(cubitState.nationalID).collection("dateOfBirth").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "dateOfBirth": cubitState.dateOfBirth,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.phoneNumbers.isNotEmpty) {
//       map["phoneNumber"] = cubitState.phoneNumbers;
//       // await personalData.doc(cubitState.nationalID).collection("phoneNumbers").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "phoneNumbers": cubitState.phoneNumbers,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.emails.isNotEmpty) {
//       map["emails"] = cubitState.emails;
//       // await personalData.doc(cubitState.nationalID).collection("emails").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "emails": cubitState.emails,
//       //   "module": "HK"
//       // });
//     }
//     if (cubitState.religion.isNotEmpty) {
//       map["religion"] = cubitState.religion;
//       // await personalData.doc(cubitState.nationalID).collection("religion").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "religion": cubitState.religion,
//       //   "module": "HK"
//       // });
//     }
//     // nationality
//     if (cubitState.nationality.isNotEmpty) {
//       map["nationality"] = cubitState.nationality;
//       // await personalData.doc(cubitState.nationalID).collection("nationality").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "nationality": cubitState.nationality,
//       //   "module": "HK"
//       // });
//     }
//     // anotherNationalities
//     if (cubitState.anotherNationalities.isNotEmpty) {
//       map["anotherNationalities"] = cubitState.anotherNationalities;
//       // await personalData.doc(cubitState.nationalID).collection("anotherNationalities").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "anotherNationalities": cubitState.anotherNationalities,
//       //   "module": "HK"
//       // });
//     }
//     // maritalStatus
//     if (cubitState.maritalStatus.isNotEmpty) {
//       map["maritalStatus"] = cubitState.maritalStatus;
//       // await personalData.doc(cubitState.nationalID).collection("maritalStatus").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "maritalStatus": cubitState.maritalStatus,
//       //   "module": "HK"
//       // });
//     }
//     // militaryStatus
//     if (cubitState.militaryStatus.isNotEmpty) {
//       map["militaryStatus"] = cubitState.militaryStatus;
//       // await personalData.doc(cubitState.nationalID).collection("militaryStatus").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "militaryStatus": cubitState.militaryStatus,
//       //   "module": "HK"
//       // });
//     }
//     // country
//     if (cubitState.country.isNotEmpty) {
//       map["country"] = cubitState.country;
//       // await personalData.doc(cubitState.nationalID).collection("country").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "country": cubitState.country,
//       //   "module": "HK"
//       // });
//     }
//     // addresses
//     if (cubitState.addresses.isNotEmpty) {
//       map["addresses"] = cubitState.addresses;
//       // await personalData.doc(cubitState.nationalID).collection("addresses").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "addresses": cubitState.addresses,
//       //   "module": "HK"
//       // });
//     }
//     // expAtNationalID
//     if (cubitState.expAtNationalID.isNotEmpty) {
//       map["expAtNationalID"] = cubitState.expAtNationalID;
//       // await personalData.doc(cubitState.nationalID).collection("expAtNationalID").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "expAtNationalID": cubitState.expAtNationalID,
//       //   "module": "HK"
//       // });
//     }
//     // placeOfBirth
//     if (cubitState.placeOfBirth.isNotEmpty) {
//       map["placeOfBirth"] = cubitState.placeOfBirth;
//       // await personalData.doc(cubitState.nationalID).collection("placeOfBirth").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "placeOfBirth": cubitState.placeOfBirth,
//       //   "module": "HK"
//       // });
//     }
//     // jobAtNationalID
//     if (cubitState.jobAtNationalID.isNotEmpty) {
//       map["jobAtNationalID"] = cubitState.jobAtNationalID;
//       // await personalData.doc(cubitState.nationalID).collection("jobAtNationalID").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "jobAtNationalID": cubitState.jobAtNationalID,
//       //   "module": "HK"
//       // });
//     }
//     var currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
//     // nationalImage1
//     if (cubitState.nationalImage1.isNotEmpty) {
//       try {
//         final taskFullImage = await storageRef
//             .child("UploadedImages")
//             .child("/${cubitState.nationalID}")
//             .child("/frontImage-$currentTimeStamp.png")
//             .putString(
//               cubitState.nationalImage1,
//               format: PutStringFormat.base64,
//             );
//         var fullImageLink = await taskFullImage.ref.getDownloadURL();
//         map["nationalImage1"] = fullImageLink;
//       } catch (e) {
//         print(e);
//       }
//
//       // await personalData.doc(cubitState.nationalID).collection("nationalImage1").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "nationalImage1": fullImageLink,
//       //   "module": "HK"
//       // });
//     }
//     // nationalImage2
//     if (cubitState.nationalImage2.isNotEmpty) {
//       final taskFullImage = await storageRef
//           .child("UploadedImages")
//           .child("/${cubitState.nationalID}")
//           .child("/backImage-$currentTimeStamp")
//           .putString(cubitState.nationalImage2, format: PutStringFormat.base64);
//       var fullImageLink = await taskFullImage.ref.getDownloadURL();
//       map["nationalImage2"] = fullImageLink;
//       // await personalData.doc(cubitState.nationalID).collection("nationalImage2").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "nationalImage2": fullImageLink,
//       //   "module": "HK"
//       // });
//     }
//     // personalImage
//     if (cubitState.personalImage.isNotEmpty) {
//       try {
//         final taskFullImage = await storageRef
//             .child("UploadedImages")
//             .child("/${cubitState.nationalID}")
//             .child("/personalImage-$currentTimeStamp")
//             .putString(cubitState.personalImage,
//                 format: PutStringFormat.base64);
//         var fullImageLink = await taskFullImage.ref.getDownloadURL();
//         map["personalImage"] = fullImageLink;
//       } catch (e) {
//         print(e);
//       }
//
//       // await personalData.doc(cubitState.nationalID).collection("personalImage").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "personalImage": fullImageLink,
//       //   "module": "HK"
//       // });
//     }
//     // passportImage
//     if (cubitState.passportImage.isNotEmpty) {
//       final taskFullImage = await storageRef
//           .child("UploadedImages")
//           .child("/${cubitState.nationalID}")
//           .child("/passportImage-$currentTimeStamp")
//           .putString(cubitState.passportImage, format: PutStringFormat.base64);
//       var fullImageLink = await taskFullImage.ref.getDownloadURL();
//       map["passportImage"] = fullImageLink;
//       // await personalData.doc(cubitState.nationalID).collection("passportImage").add({
//       //   "lastUpdate": FieldValue.serverTimestamp(),
//       //   "addedByAccount": verifiedEmail,
//       //   "passportImage": fullImageLink,
//       //   "module": "HK"
//       // });
//     }
//     await personalData
//         .doc(cubitState.nationalID)
//         .collection("History")
//         .add(map);
//     return map;
//   }
//
// // }
// // void onFirebaseTokenRefreshed(String token) async{
// //
// //   final user = this.currentUser?.user;
// //   // final employeeData = this.currentUser?.employeeData;
// //   await _databaseReferenceUsers.child(user!.email.encodeEmail()).update({
// //     "device_token": token,
// //   });
// // }
//
// // updateUserWithData(String token)async{
// //
// //   final user = this.currentUser?.user;
// //   final employeeData = this.currentUser?.employeeData;
// //
// //
// //   await _databaseReferenceUsers.child(user!.email.encodeEmail()).update({
// //     "device_token": token,
// //     "hrcode": user.userHRCode,
// //     "imgProfile": employeeData?.imgProfile,
// //     "managerCode":employeeData?.managerCode,
// //     "managerEmail":employeeData?.managerEmail?.encodeEmail(),
// //     "title":employeeData?.titleName,
// //     "userID":_firebaseAuth.currentUser?.uid,
// //     "username":employeeData?.name,
// //   });
// // }
//
// // StreamSubscription<List<Notification>> getNotificationsData(String email)  {
// //   // return notificationReference.child(email).onValue.listen((event) { })
// //   return notificationReference.child(email).onValue.listen((DatabaseEvent event) {
// //     // final data = Map<String, dynamic>.from(event.snapshot.value);
// //     final data = event.snapshot.value!;
// //     final  notifications = Notification.fromJson(data as Map<String, dynamic>);
// //     // final currencyList = Currency.fromJson(data);
// //     return notifications;
// //     // return(data);
// //   });
// // }
//
// // addSubmitFirebaseNotification(String requestNo,String requestType,String type)async{
// //   final managerEmail = this.currentUser?.employeeData?.managerEmail ?? "";
// //   final employeeData = this.currentUser?.employeeData;
// //   if(managerEmail.isNotEmpty){
// //     await notificationReference.child(managerEmail.encodeEmail()).push().update({
// //       "from": employeeData?.email?.encodeEmail(),
// //       "requestType": requestType,
// //       "requestNo": requestNo,
// //       "type": type,
// //     });
// //   }
// // }
// // addTakeActionFirebaseNotification(String requesterEmail,String requestNo,String requestType,String type)async{
// //   // final requesterEmail = requesterData.email ?? "";
// //   final employeeData = this.currentUser?.employeeData;
// //   if(requesterEmail.isNotEmpty){
// //     await notificationReference.child(requesterEmail.encodeEmail()).push().update({
// //       "from": employeeData?.email?.encodeEmail(),
// //       "requestType": requestType,
// //       "requestNo": requestNo,
// //       "type": type,
// //     });
// //   }
// // }
//
// // addEquipmentTakeActionFirebaseNotification(String nextStepEmail, String requesterEmail,String requestNo,String requestType,String type)async{
// //   // final requesterEmail = requesterData.email ?? "";
// //   // final employeeData = this.currentUser?.employeeData;
// //   if(requesterEmail.isNotEmpty){
// //     await notificationReference.child(nextStepEmail.encodeEmail()).push().update({
// //       "from": requesterEmail.encodeEmail(),
// //       "requestType": requestType,
// //       "requestNo": requestNo,
// //       "type": type,
// //     });
// //   }
// // }
// }

  Stream<List<FirebaseCampaignBeneficiary>> getCampaignExpectedBeneficiary(
      String campaignId) {
    return FirebaseFirestore.instance
        .collection('HK_Campaigns')
        .doc(campaignId)
        .collection('expected')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => FirebaseCampaignBeneficiary.fromJson(e.data()))
          .toList();
    });
  }

  Stream<List<FirebaseCampaignBeneficiary>> getCampaignUnExpectedBeneficiary(
      String campaignId) {
    return FirebaseFirestore.instance
        .collection('HK_Campaigns')
        .doc(campaignId)
        .collection('unexpected')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => FirebaseCampaignBeneficiary.fromJson(e.data()))
          .toList()
          .reversed
          .toList();
    });
  }

  Stream<List<FirebaseCampaignBeneficiary>> getCampaignActualBeneficiary(
      String campaignId) {
    return FirebaseFirestore.instance
        .collection('HK_Campaigns')
        .doc(campaignId)
        .collection('actual')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => FirebaseCampaignBeneficiary.fromJson(e.data()))
          .toList()
          .reversed
          .toList();
    });
  }

}
