import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebasePassports extends Equatable {
  int? airportCheckinTime;
  int? eventCheckinTime;
  int? hotelCheckinTime;
  int? transportationCheckinTime;
  int? lastUpdate;
  String? transportationCheckin;
  String? transportationCheckinEmail;
  String? airportCheckin;
  String? airportCheckinEmail;
  String? eventCheckin;
  String? eventCheckinEmail;
  String? hotelCheckin;
  String? hotelCheckinEmail;

  String? passportImage;
  String? backImage;
  String? code;
  String? contactNo;
  String? country;
  String? dateOfBirth;
  String? dateOfExpiry;
  String? documentCode;
  String? documentNumber;
  String? email;
  String? emergencyNo;
  String? faceImage;
  String? firstName;
  String? gender;
  String? lastName;
  String? passportNationality;
  String? accommodation;
  String? key;
  String? frontIdData;
  String? backIdData;

  FirebasePassports(
      {this.passportImage,
      this.code,
      this.contactNo,
      this.country,
      this.dateOfBirth,
      this.dateOfExpiry,
      this.documentCode,
      this.documentNumber,
      this.email,
      this.emergencyNo,
      this.faceImage,
      this.firstName,
      this.gender,
      this.lastName,
      this.passportNationality,
      this.accommodation,
      this.airportCheckin,
      this.airportCheckinEmail,
      this.airportCheckinTime,
      this.eventCheckin,
      this.lastUpdate,
      this.eventCheckinEmail,
      this.eventCheckinTime,
      this.hotelCheckin,
      this.hotelCheckinEmail,
      this.hotelCheckinTime,
      this.backImage,
      this.transportationCheckinEmail,
      this.transportationCheckin,
      this.transportationCheckinTime,
      this.key,
      this.frontIdData,
      this.backIdData});

  // FirebasePassports.fromJson(DataSnapshot e) {
  //
  //   var json = Map<String, dynamic>.from(e.value as dynamic);
  //   key = e.key;
  //   airportCheckinTime = (json['airportCheckinTime'].toString().isEmpty)? 0 :json['airportCheckinTime']??0;
  //   eventCheckinTime = (json['eventCheckinTime'].toString().isEmpty)? 0 :json['eventCheckinTime']??0;
  //   hotelCheckinTime = (json['hotelCheckinTime'].toString().isEmpty)? 0 :json['hotelCheckinTime']??0;
  //   transportationCheckinTime = (json['transportationCheckinTime'].toString().isEmpty)? 0 :json['transportationCheckinTime']??0;
  //
  //   airportCheckin = (json['airportCheckin'].toString().isEmpty)? "NO DATA" :json['airportCheckin']?? "Not Defined";
  //   airportCheckinEmail = (json['airportCheckinEmail'].toString().isEmpty)? "NO DATA" :json['airportCheckinEmail']?? "Not Defined";
  //   eventCheckin = (json['eventCheckin'].toString().isEmpty)? "NO DATA" :json['eventCheckin']?? "Not Defined";
  //   eventCheckinEmail = (json['eventCheckinEmail'].toString().isEmpty)? "NO DATA" :json['eventCheckinEmail']?? "Not Defined";
  //   hotelCheckin = (json['hotelCheckin'].toString().isEmpty)? "NO DATA" :json['hotelCheckin']?? "Not Defined";
  //   hotelCheckinEmail = (json['hotelCheckinEmail'].toString().isEmpty)? "NO DATA" :json['hotelCheckinEmail']?? "Not Defined";
  //   lastUpdate = (json['lastUpdate'].toString().isEmpty)? 0 :json['lastUpdate']??0;
  //
  //   transportationCheckin = (json['transportationCheckin'].toString().isEmpty)? "NO DATA" :json['transportationCheckin']?? "Not Defined";
  //   transportationCheckinEmail = (json['transportationCheckinEmail'].toString().isEmpty)? "NO DATA" :json['transportationCheckinEmail']?? "Not Defined";
  //
  //
  //   passportImage = (json['PassportImage'].toString().isEmpty)? "NO DATA" :json['PassportImage']?? "Not Defined";
  //   backImage = (json['backImage'].toString().isEmpty)? "NO DATA" :json['backImage']?? "Not Defined";
  //   code = (json['code'].toString().isEmpty)? "NO DATA" :json['code']?? "Not Defined";
  //   contactNo = (json['contactNo'].toString().isEmpty)? "NO DATA" :json['contactNo']?? "Not Defined";
  //   country = (json['country'].toString().isEmpty)? "NO DATA" :json['country']?? "Not Defined";
  //   dateOfBirth = (json['dateOfBirth'].toString().isEmpty)? "NO DATA" :json['dateOfBirth']?? "Not Defined";
  //   dateOfExpiry = (json['dateOfExpiry'].toString().isEmpty)? "NO DATA" :json['dateOfExpiry']?? "Not Defined";
  //   documentCode = (json['documentCode'].toString().isEmpty)? "NO DATA" :json['documentCode']?? "Not Defined";
  //   documentNumber = (json['documentNumber'].toString().isEmpty)? "NO DATA" :json['documentNumber']?? "Not Defined";
  //   email = (json['email'].toString().isEmpty)? "NO DATA" :json['email']?? "Not Defined";
  //   emergencyNo = (json['emergencyNo'].toString().isEmpty)? "NO DATA" :json['emergencyNo']?? "Not Defined";
  //   faceImage = (json['faceImage'].toString().isEmpty)? 'NO DATA' :json['faceImage']?? "Not Defined";
  //   firstName = (json['firstName'].toString().isEmpty)? "NO DATA" :json['firstName']?? "Not Defined";
  //   gender = (json['gender'].toString().isEmpty)? "NO DATA" :json['gender']?? "Not Defined";
  //   lastName = (json['lastName'].toString().isEmpty)? "NO DATA" :json['lastName']?? "Not Defined";
  //   passportNationality = (json['passportNationality'].toString().isEmpty)? "NO DATA" :json['passportNationality']?? "Not Defined";
  //   accommodation =(json['Accommodation'].toString().isEmpty)? "NO DATA" :json['Accommodation']?? "Not Defined";
  //
  //   frontIdData = (json['frontIdData'].toString().isEmpty)? "NO DATA" :json['frontIdData']?? "Not Defined";
  //   backIdData = (json['backIdData'].toString().isEmpty)? "NO DATA" :json['backIdData']?? "Not Defined";
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PassportImage'] = passportImage;
    // data['backImage'] = backImage;
    data['code'] = code;
    data['contactNo'] = contactNo;
    data['country'] = country;
    data['dateOfBirth'] = dateOfBirth;
    data['dateOfExpiry'] = dateOfExpiry;
    data['documentCode'] = documentCode;
    data['documentNumber'] = documentNumber;
    data['email'] = email;
    data['emergencyNo'] = emergencyNo;
    data['faceImage'] = faceImage;
    data['firstName'] = firstName;
    data['gender'] = gender;
    data['lastName'] = lastName;
    data['passportNationality'] = passportNationality;
    data['Accommodation'] = accommodation;

    data['airportCheckinTime'] = airportCheckinTime;
    data['eventCheckinTime'] = eventCheckinTime;
    data['hotelCheckinTime'] = hotelCheckinTime;
    data['airportCheckin'] = airportCheckin;
    data['airportCheckinEmail'] = airportCheckinEmail;
    data['eventCheckin'] = eventCheckin;
    data['eventCheckinEmail'] = eventCheckinEmail;
    data['hotelCheckin'] = hotelCheckin;
    data['hotelCheckinEmail'] = hotelCheckinEmail;
    data['lastUpdate'] = lastUpdate;

    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        documentNumber,
        passportNationality,
        accommodation,
        lastName,
        gender,
        firstName,
        faceImage,
        emergencyNo,
        email,
        documentCode,
        dateOfExpiry,
        dateOfBirth,
        country,
        contactNo,
        code,
        passportImage,
        lastUpdate,
        hotelCheckinEmail,
        hotelCheckin,
        eventCheckinEmail,
        eventCheckin,
        airportCheckinEmail,
        airportCheckin,
        hotelCheckinTime,
        eventCheckinTime,
        airportCheckinTime,
        backImage,
        frontIdData,
        backIdData
      ];

// @override
// bool operator ==(other) {
//   if (other is! FirebasePassports) {
//     return false;
//   }
//   return documentNumber == other.documentNumber &&
//       passportNationality == other.passportNationality &&
//       (uploadTime ?? 0) > (other.uploadTime ?? 0);
// }

}

class FirebaseDayChart {
  String? day;
  int? count;

  FirebaseDayChart({this.day, this.count});

  FirebaseDayChart.fromJson(Map<String, dynamic> json) {
    day = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = day;
    data['count'] = count;
    return data;
  }
}

class FirebaseCoordinatorsModel extends Equatable {
  String? addedByAccount;
  String? heroType;
  String? heroDivision;
  String? heroGovernorate;
  String? assignmentType;
  String? assignmentStatus; // Active - nonActive
  String? reasons; // non active
  String? user; // yes or no
  List<String>? attachments; // non active
  String? nationalID;

  FirebaseCoordinatorsModel(
      {this.addedByAccount,
      this.heroType,
      this.heroDivision,
      this.heroGovernorate,
      this.assignmentType,
      this.assignmentStatus,
      this.reasons,
      this.user,
      this.attachments,
      this.nationalID});

  FirebaseCoordinatorsModel.fromJson(Map<String, dynamic> json) {
    addedByAccount = json['addedByAccount'];
    heroType = json['heroType'];
    heroDivision = json['heroDivision'];
    heroGovernorate = json['heroGovernorate'];
    assignmentType = json['assignmentType'];
    assignmentStatus = json['assignmentStatus'];
    reasons = json['reasons'];
    user = json['user'];
    if (json['attachments'] != null) {
      attachments = List<String>.from(json['attachments'] as List);
    } else {
      attachments = [];
    }
    // attachments = json['attachments'];
    nationalID = json['nationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addedByAccount'] = addedByAccount;
    // data['country'] = country;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        addedByAccount,
        heroType,
        heroDivision,
        heroGovernorate,
        assignmentType,
        assignmentStatus,
        reasons,
        user,
        attachments,
        nationalID
      ];
}

class FirebaseHelpModel extends Equatable {
  String? addedByAccount;
  String? accommodationType;
  String? caseRequirements;
  String? houseDescription;
  String? income;
  String? incomeSource;
  String? previousAid; // Active - nonActive
  String? requestImportance; // non active
  String? researcherSaw; // yes or no
  String? attachments; // non active
  String? nationalID;

  FirebaseHelpModel(
      {this.addedByAccount,
      this.accommodationType,
      this.caseRequirements,
      this.houseDescription,
      this.income,
      this.incomeSource,
      this.previousAid,
      this.requestImportance,
      this.researcherSaw,
      this.attachments,
      this.nationalID});

  FirebaseHelpModel.fromJson(Map<String, dynamic> json) {
    addedByAccount = json['addedByAccount'];
    accommodationType = json['accommodationType'];
    caseRequirements = json['caseRequirements'];
    houseDescription = json['houseDescription'];
    income = json['income'];
    incomeSource = json['incomeSource'];
    previousAid = json['previousAid'];
    requestImportance = json['requestImportance'];
    researcherSaw = json['researcherSaw'];
    attachments = json['attachments'];
    nationalID = json['nationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addedByAccount'] = addedByAccount;
    // data['country'] = country;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        addedByAccount,
        accommodationType,
        caseRequirements,
        houseDescription,
        houseDescription,
        income,
        incomeSource,
        previousAid,
        requestImportance,
        researcherSaw,
        attachments,
        nationalID
      ];
}

class FirebaseDonorsModel extends Equatable {
  String? donationMethod;
  String? donationAmount;
  String? donationDate;

  String? attachments;
  String? nationalID;

  FirebaseDonorsModel(
      {this.donationMethod,
      this.donationAmount,
      this.donationDate,
      this.attachments,
      this.nationalID});

  FirebaseDonorsModel.fromJson(Map<String, dynamic> json) {
    donationMethod = json['donationMethod'];
    donationAmount = json['donationAmount'].toString();
    donationDate = json['donationDate'];
    attachments = json['attachments'];
    nationalID = json['nationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['donationMethod'] = donationMethod;
    // data['country'] = country;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        donationMethod,
        donationAmount,
        donationDate,
        nationalID,
        attachments,
      ];
}

class FirebaseVolunteersModel extends Equatable {
  String? volunteerStatus;
  String? areasOfVolunteering;
  String? nationalID;

  FirebaseVolunteersModel(
      {this.volunteerStatus, this.areasOfVolunteering, this.nationalID});

  FirebaseVolunteersModel.fromJson(Map<String, dynamic> json) {
    volunteerStatus = json['volunteerStatus'];
    areasOfVolunteering = json['areasOfVolunteering'];
    nationalID = json['nationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['donationMethod'] = volunteerStatus;
    // data['country'] = country;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [volunteerStatus, areasOfVolunteering, nationalID];
}

class FirebaseCandidatesModel extends Equatable {
  String? volunteerStatus;
  String? areasOfVolunteering;
  String? nationalID;

  FirebaseCandidatesModel(
      {this.volunteerStatus, this.areasOfVolunteering, this.nationalID});

  FirebaseCandidatesModel.fromJson(Map<String, dynamic> json) {
    volunteerStatus = json['volunteerStatus'];
    areasOfVolunteering = json['areasOfVolunteering'];
    nationalID = json['nationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['donationMethod'] = volunteerStatus;
    // data['country'] = country;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [volunteerStatus, areasOfVolunteering, nationalID];
}

class FirebaseIssuesModel extends Equatable {
  String? issueId;
  String? issueName;
  String? issueGovernorate;
  String? issueDivision;
  String? issueLocationLat;
  String? issueLocationLong;
  String? issueDescription;
  String? priority;

  FirebaseIssuesModel(
      {this.issueName,
      this.issueGovernorate,
      this.issueDivision,
      this.issueLocationLat,
      this.issueLocationLong,
      this.issueDescription,
      this.issueId,
      this.priority});

  FirebaseIssuesModel.fromJson(Map<String, dynamic> json) {
    issueId = json['issueId'];
    issueName = json['issueName'];
    issueGovernorate = json['issueGovernorate'];
    issueLocationLat = json['issueLocationLat'];
    issueLocationLong = json['issueLocationLong'];
    issueDivision = json['issueDivision'];
    issueDescription = json['issueDescription'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['issueName'] = issueName;
    // data['country'] = country;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        issueName,
        issueGovernorate,
        issueLocationLat,
        issueLocationLong,
        issueDivision,
        issueDescription,
        priority,
        issueId
      ];
}

class FirebaseCampaignsModel extends Equatable {
  String? name;
  String? date;
  String? type;
  String? participatingTeams;
  String? aidsNumber;
  String? governorate;
  String? division;
  String? details;
  String? status;
  String? campaignsID;
  String? initiativeName;
  String? endDate;
  List<FirebaseCoordinatorsWithPersonalDataModel>? coordinators;
  List<FirebaseVolunteersWithPersonalDataModel>? volunteers;
  List<FirebaseBeneficialWithPersonalDataModel>? actualBeneficial;
  List<FirebaseBeneficialWithPersonalDataModel>? expectedBeneficial;

  FirebaseCampaignsModel({
    this.name,
    this.date,
    this.type,
    this.participatingTeams,
    this.aidsNumber,
    this.governorate,
    this.division,
    this.details,
    this.status,
    this.campaignsID,
    this.initiativeName,
    this.endDate,
    this.coordinators,
    this.volunteers,
    this.actualBeneficial,
    this.expectedBeneficial,
  });

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "date": date,
  //       "type": type,
  //       "participatingTeams": participatingTeams,
  //       "aidsNumber": aidsNumber,
  //       "governorate": governorate,
  //       "division": division,
  //       "details": details,
  //       "status": status,
  //       "initiativeName": initiativeName,
  //       "endDate": endDate,
  //     };

  FirebaseCampaignsModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    date = json["date"];
    type = json["type"];
    participatingTeams = json["participatingTeams"];
    aidsNumber = json["aidsNumber"];
    governorate = json["governorate"];
    division = json["division"];
    details = json["details"];
    status = json["status"];
    campaignsID = json["campaignsID"];
    initiativeName = json["initiativeName"];
    endDate = json["endDate"];
  }

  @override
  List<Object?> get props => [
        name,
        date,
        type,
        participatingTeams,
        aidsNumber,
        governorate,
        division,
        details,
        status,
        campaignsID,
        initiativeName,
        endDate,
        coordinators,
        volunteers,
        actualBeneficial,
        expectedBeneficial
      ];
}

class FirebaseBeneficialModel extends Equatable {
  String? nationalID;
  List<String>? campaignActualBeneficial;

  FirebaseBeneficialModel({this.nationalID});

  Map<String, dynamic> toJson() => {"nationalID": nationalID};

  FirebaseBeneficialModel.fromJson(Map<String, dynamic> json) {
    nationalID = json["nationalID"];
    if (json["CampaignActualBeneficial"] != null) {
      campaignActualBeneficial =
          List<String>.from(json['CampaignActualBeneficial'] as List);
    } else {
      campaignActualBeneficial = [];
    }
  }

  @override
  List<Object?> get props => [nationalID];
}

class FirebaseListsModel extends Equatable {
  String? listName;
  String? listType;
  List<String>? listOfNationalIDs;
  String? listID;
  bool? locked;

  FirebaseListsModel(
      {this.listName,
      this.listType,
      this.listOfNationalIDs,
      this.listID,
      this.locked});

  Map<String, dynamic> toJson() {
    return {
      "listName": listName,
      "listType": listType,
      "nationalIDs": listOfNationalIDs,
      "listID": listID,
      "locked": locked,
    };
  }

  FirebaseListsModel.fromJson(Map<String, dynamic> json) {
    listName = json["listName"];
    listType = json["listType"];
    listID = json["listID"];

    if (json['nationalIDs'] != null) {
      listOfNationalIDs = List<String>.from(json['nationalIDs'] as List);
    } else {
      listOfNationalIDs = [];
    }
    if (json['locked'] != null) {
      locked = json["locked"];
    } else {
      locked = false;
    }

    // json["nationalIDs"];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [listName, listType, listOfNationalIDs, listID];
}

class FirebasePersonalDataModel extends Equatable {
  String? jobTitle;
  String? governorate;
  String? division;
  String? name; // national id name
  String? gender; // 0:male 1:female 3:other
  String? phoneNumbers; // list of all  numbers
  String? emails; // list of all emails
  String? religion;
  String? nationality;
  String? anotherNationalities; // list of all nationalities
  String? maritalStatus;
  String? militaryStatus;
  String? dateOfBirth;
  String? country;
  String? addresses; //list of all address
  String? nationalID;
  String? expAtNationalID;
  String? placeOfBirth;
  String? jobAtNationalID;
  String? nationalImage1;
  String? nationalImage2;
  String? personalImage;
  String? passportImage;
  String? passportNumber;
  bool? checkIsCoordinator;
  bool? checkIsVolunteer;
  bool? checkIsDonor;
  bool? checkIsBeneficial;
  List<String>? campaignActualBeneficial;
  List<String>? campaignsSupport;
  List<String>? addedHelpNeededSupport;

  FirebasePersonalDataModel(
      {this.jobTitle,
      this.governorate,
      this.division,
      this.name,
      this.gender,
      this.phoneNumbers,
      this.emails,
      this.religion,
      this.nationality,
      this.anotherNationalities,
      this.maritalStatus,
      this.militaryStatus,
      this.dateOfBirth,
      this.country,
      this.addresses,
      this.nationalID,
      this.checkIsCoordinator,
      this.expAtNationalID,
      this.placeOfBirth,
      this.jobAtNationalID,
      this.checkIsDonor,
      this.nationalImage1,
      this.nationalImage2,
      this.personalImage,
      this.passportImage,
      this.campaignActualBeneficial,
      this.checkIsVolunteer,
      this.checkIsBeneficial,
      this.campaignsSupport,
      this.addedHelpNeededSupport,
      this.passportNumber});

  FirebasePersonalDataModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json["jobTitle"];
    governorate = json["governorate"];
    division = json["division"];
    name = json["fullName"];
    gender = json['gender'];
    if (json["HK_Coordinator"] != null) {
      checkIsCoordinator = json['HK_Coordinator'];
    } else {
      checkIsCoordinator = false;
    }
    if (json["HK_Volunteers"] != null) {
      checkIsVolunteer = json['HK_Volunteers'];
    } else {
      checkIsVolunteer = false;
    }
    if (json["HK_Donor"] != null) {
      checkIsDonor = json['HK_Donor'];
    } else {
      checkIsDonor = false;
    }
    if (json["HK_Beneficial"] != null) {
      checkIsBeneficial = json['HK_Beneficial'];
    } else {
      checkIsBeneficial = false;
    }
    // CampaignActualBeneficial
    if (json["CampaignActualBeneficial"] != null) {
      campaignActualBeneficial =
          List<String>.from(json['CampaignActualBeneficial'] as List);
    } else {
      campaignActualBeneficial = [];
    }
    // HK_Beneficial
    // CampaignsSupport
    if (json["CampaignsSupport"] != null) {
      campaignsSupport = List<String>.from(json['CampaignsSupport'] as List);
    } else {
      campaignsSupport = [];
    }

    // if(json['gender'].toString().isEmpty)
    //   {
    //     gender='لا يوجد';
    //   }
    // else if(json['gender'].toString().isNotEmpty && json['gender'].toString()=='0' )
    //   {
    //     gender='ذكر';
    //   }
    // else if(json['gender'].toString().isNotEmpty && json['gender'].toString()=='1' )
    // {
    //   gender='انثى';
    // }
    // else
    //   {
    //     gender='اخرى';
    //   }

    phoneNumbers = json["phoneNumber"];
    emails = json["emails"];
    religion = json["religion"];
    nationality = json["nationality"];
    anotherNationalities = json["anotherNationalities"];
    maritalStatus = json["maritalStatus"];
    militaryStatus = json["militaryStatus"];
    dateOfBirth = json["dateOfBirth"];
    country = json["country"];
    addresses = json["addresses"];
    nationalID = json["nationalID"];
    expAtNationalID = json["expAtNationalID"];
    placeOfBirth = json["placeOfBirth"];
    jobAtNationalID = json["jobAtNationalID"];
    nationalImage1 = json["nationalImage1"];
    nationalImage2 = json["nationalImage2"];
    personalImage = json["personalImage"];
    passportImage = json["passportImage"];
    passportNumber = json["passportNumber"];
    gender = json["gender"];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        jobTitle,
        governorate,
        division,
        name, // national id name
        gender, // 0:male 1:female 3:other
        phoneNumbers, // list of all  numbers
        emails, // list of all emails
        religion,
        nationality,
        anotherNationalities, // list of all nationalities
        maritalStatus,
        militaryStatus,
        dateOfBirth,
        country,
        addresses, //list of all address
        nationalID,
        expAtNationalID,
        placeOfBirth,
        jobAtNationalID,
        nationalImage1,
        nationalImage2,
        personalImage,
        passportImage,
        passportNumber,
        checkIsCoordinator,
        checkIsBeneficial,
        checkIsDonor,
        checkIsVolunteer,
        campaignsSupport,
        campaignActualBeneficial,
      ];
}

class FirebasePersonalDataModelTest extends Equatable {
  String? jobTitle;
  String? governorate;
  String? division;
  String? name; // national id name
  String? gender; // 0:male 1:female 3:other
  String? phoneNumbers; // list of all  numbers
  String? emails; // list of all emails
  String? religion;
  String? nationality;
  String? anotherNationalities; // list of all nationalities
  String? maritalStatus;
  String? militaryStatus;
  String? dateOfBirth;
  String? country;
  String? addresses; //list of all address
  String? nationalID;
  String? expAtNationalID;
  String? placeOfBirth;
  String? jobAtNationalID;
  String? nationalImage1;
  String? nationalImage2;
  String? personalImage;
  String? passportImage;
  String? passportNumber;

  FirebasePersonalDataModelTest(
      {this.jobTitle,
      this.governorate,
      this.division,
      this.name,
      this.gender,
      this.phoneNumbers,
      this.emails,
      this.religion,
      this.nationality,
      this.anotherNationalities,
      this.maritalStatus,
      this.militaryStatus,
      this.dateOfBirth,
      this.country,
      this.addresses,
      this.nationalID,
      this.expAtNationalID,
      this.placeOfBirth,
      this.jobAtNationalID,
      this.nationalImage1,
      this.nationalImage2,
      this.personalImage,
      this.passportImage,
      this.passportNumber});

  FirebasePersonalDataModelTest.fromJson(Map<String, dynamic> json) {
    jobTitle = json["jobTitle"];
    governorate = json["governorate"];
    division = json["division"];
    name = json["fullName"];
    gender = json['gender'];

    // if(json['gender'].toString().isEmpty)
    //   {
    //     gender='لا يوجد';
    //   }
    // else if(json['gender'].toString().isNotEmpty && json['gender'].toString()=='0' )
    //   {
    //     gender='ذكر';
    //   }
    // else if(json['gender'].toString().isNotEmpty && json['gender'].toString()=='1' )
    // {
    //   gender='انثى';
    // }
    // else
    //   {
    //     gender='اخرى';
    //   }

    phoneNumbers = json["phoneNumber"];
    emails = json["emails"];
    religion = json["religion"];
    nationality = json["nationality"];
    anotherNationalities = json["anotherNationalities"];
    maritalStatus = json["maritalStatus"];
    militaryStatus = json["militaryStatus"];
    dateOfBirth = json["dateOfBirth"];
    country = json["country"];
    addresses = json["addresses"];
    nationalID = json["nationalID"];
    expAtNationalID = json["expAtNationalID"];
    placeOfBirth = json["placeOfBirth"];
    jobAtNationalID = json["jobAtNationalID"];
    nationalImage1 = json["nationalImage1"];
    nationalImage2 = json["nationalImage2"];
    personalImage = json["personalImage"];
    passportImage = json["passportImage"];
    passportNumber = json["passportNumber"];
    gender = json["gender"];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        jobTitle,
        governorate,
        division,
        name, // national id name
        gender, // 0:male 1:female 3:other
        phoneNumbers, // list of all  numbers
        emails, // list of all emails
        religion,
        nationality,
        anotherNationalities, // list of all nationalities
        maritalStatus,
        militaryStatus,
        dateOfBirth,
        country,
        addresses, //list of all address
        nationalID,
        expAtNationalID,
        placeOfBirth,
        jobAtNationalID,
        nationalImage1,
        nationalImage2,
        personalImage,
        passportImage,
        passportNumber,
      ];
}

class FirebaseAccount extends Equatable {
  String? nationalID;

  FirebaseAccount({this.nationalID});

  FirebaseAccount.fromJson(Map<String, dynamic> json) {
    nationalID = json['nationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nationalID'] = nationalID;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [nationalID];
}

class FirebaseCoordinatorsWithPersonalDataModel extends Equatable {
  FirebasePersonalDataModel? personalDataModel;
  FirebaseCoordinatorsModel? coordinatorsModel;

  FirebaseCoordinatorsWithPersonalDataModel({
    this.personalDataModel,
    this.coordinatorsModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [personalDataModel, coordinatorsModel];
}

class FirebaseHelpsWithPersonalDataModel extends Equatable {
  FirebasePersonalDataModel? personalDataModel;
  FirebaseHelpModel? helpModel;

  FirebaseHelpsWithPersonalDataModel({
    this.personalDataModel,
    this.helpModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [personalDataModel, helpModel];
}

class FirebaseBeneficialWithPersonalDataModel extends Equatable {
  FirebasePersonalDataModel? personalDataModel;
  FirebaseBeneficialModel? beneficialModel;

  FirebaseBeneficialWithPersonalDataModel({
    this.personalDataModel,
    this.beneficialModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [personalDataModel, beneficialModel];
}

class FirebaseVolunteersWithPersonalDataModel extends Equatable {
  FirebasePersonalDataModel? personalDataModel;
  FirebaseVolunteersModel? volunteersModel;

  FirebaseVolunteersWithPersonalDataModel({
    this.personalDataModel,
    this.volunteersModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [personalDataModel, volunteersModel];
}

class FirebaseCandidatesWithPersonalDataModel extends Equatable {
  FirebasePersonalDataModel? personalDataModel;
  FirebaseCandidatesModel? volunteersModel;

  FirebaseCandidatesWithPersonalDataModel({
    this.personalDataModel,
    this.volunteersModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [personalDataModel, volunteersModel];
}

class FirebaseDonorsWithPersonalDataModel extends Equatable {
  FirebasePersonalDataModel? personalDataModel;
  FirebaseDonorsModel? donorsModel;

  FirebaseDonorsWithPersonalDataModel({
    this.personalDataModel,
    this.donorsModel,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [personalDataModel, donorsModel];
}

class FirebaseAccommodation {
  String? name;

  FirebaseAccommodation({this.name});

  FirebaseAccommodation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class FirebaseAirports {
  String? name;

  FirebaseAirports({this.name});

  FirebaseAirports.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class FirebaseEvents {
  String? name;

  FirebaseEvents({this.name});

  FirebaseEvents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class FirebasePassportItems {
  String? id;

  FirebasePassportItems({this.id});

  FirebasePassportItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class FirebasePricesItems {
  String? addedByAccount;
  String? date;
  int? good;
  int? governorate;
  double? price;
  String? key;

  FirebasePricesItems(
      {this.addedByAccount,
      this.date,
      this.good,
      this.governorate,
      this.price,
      this.key});

  FirebasePricesItems.fromJson(DataSnapshot e) {
    var json = Map<String, dynamic>.from(e.value as dynamic);
    key = e.key;
    addedByAccount = json['addedByAccount'];
    date = json['date'];

    if (json['good'].runtimeType == String) {
      good = int.parse(json['good']);
    } else {
      good = json['good'];
    }
    if (json['governorate'].runtimeType == String) {
      governorate = int.parse(json['governorate']);
    } else {
      governorate = json['governorate'];
    }
    if (json['price'].runtimeType == String) {
      price = double.parse(json['price']);
    } else {
      price = json['price'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addedByAccount'] = addedByAccount;
    data['date'] = date;

    data['good'] = good;
    data['governorate'] = governorate;
    data['price'] = price;
    return data;
  }
}

class FirebaseCampaignBeneficiary extends Equatable {
  List<FirebaseCampaignBenefits>? benefits;
  String? nationalID;
  String? nationalImageBack;
  String? nationalImageFront;
  String? nominationParty;
  String? mappedNominationParty;
  String? personalImage;
  String? phoneNumber;
  String? seatNumber;
  String? campaignID;
  String? age;
  bool? isMale;
  String? governorate;

  FirebaseCampaignBeneficiary(
      {this.benefits,
        this.nationalID,
        this.nationalImageBack,
        this.nationalImageFront,
        this.nominationParty,
        this.personalImage,
        this.phoneNumber,
        this.seatNumber,
        this.isMale,
        this.governorate,
        this.mappedNominationParty,
        this.age,
        this.campaignID});

  FirebaseCampaignBeneficiary.fromJson(Map<String, dynamic> json) {
    if (json['benefits'] != null) {
      benefits = <FirebaseCampaignBenefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(FirebaseCampaignBenefits.fromJson(v));
      });
    }
    nationalID = json['nationalID'].toString();
    if(nationalID?.length == 14){
     if(nationalID != null){
       governorate = "${nationalID![7]}${nationalID![8]}";
       if(nationalID![0] == "2"){
         String birthYear = "19${nationalID![1]}${nationalID![2]}";
         int birthYearInt = int.tryParse(birthYear)??1950;
         age = (2023 - birthYearInt).toString();
       }else if(nationalID![0] =="3"){
         String birthYear = "20${nationalID![1]}${nationalID![2]}";
         int birthYearInt = int.tryParse(birthYear)??2000;
         age = (2023 - birthYearInt).toString();
       }
       int int12thNumber = int.tryParse(nationalID![12])??0;
       if(int12thNumber.isOdd){
         isMale = true;
       }else{
         isMale = false;
       }
     }
    }
    nationalImageBack = json['nationalImageBack'];
    nationalImageFront = json['nationalImageFront'];
    nominationParty = json['nominationParty'];
    personalImage = json['personalImage'];
    phoneNumber = json['phoneNumber'];
    seatNumber = json['seatNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (benefits != null) {
      data['benefits'] = benefits!.map((v) => v.toJson()).toList();
    }
    data['nationalID'] = nationalID;
    data['nationalImageBack'] = nationalImageBack;
    data['nationalImageFront'] = nationalImageFront;
    data['nominationParty'] = nominationParty;
    data['personalImage'] = personalImage;
    data['phoneNumber'] = phoneNumber;
    data['seatNumber'] = seatNumber;
    return data;
  }


  @override
  List<Object?> get props => [
    benefits,
    nationalID,
    nationalImageBack,
    nationalImageFront,
    nominationParty,
    personalImage,
    phoneNumber,
    seatNumber,
    campaignID
  ];
}

class FirebaseCampaignBenefits extends Equatable {
  String? addedBy;
  String? addedTime;
  String? benefitsAmount;

  FirebaseCampaignBenefits(
      {this.addedBy, this.addedTime, this.benefitsAmount = ''});

  FirebaseCampaignBenefits.fromJson(Map<String, dynamic> json) {
    addedBy = json['addedBy'];
    addedTime = json['addedTime'].toString();
    benefitsAmount = json['benefitsAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addedBy'] = addedBy;
    data['addedTime'] = addedTime;
    data['benefitsAmount'] = benefitsAmount;
    return data;
  }

  @override
  List<Object?> get props => [addedBy, addedTime, benefitsAmount];
}
