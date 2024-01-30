// Name: hivedata.dart
// Author: Brendan Murray
// Description:

/// Each apiary has a name and a list of hives.
class Apiary {
  final int apiaryID;
  final String name;
  final String description;

  Apiary({required thisapiaryID, required this.name, required this.description});
}

/// The hives are in an apiary. Each hive has multiple inspections
/// The Hive can be one of three types: full (default), nucleus, or mating

enum HiveType { full, nucleus, mating }

class Hive {
  final int hiveID;
  final int apiaryID;
  final HiveType type;

  Hive({
    required this.hiveID,
    required this.apiaryID,
    required this.type,
  });
}


/// The QueenID identifies which queen it is, and allows tracking of her
/// performance and characteristics.
///
/// The Queen has an associated set of observable items
///  - Is she marked and clipped (unmarked = NO)

enum QueenColour { unmarked, white, yellow, red, green, bees }

class Queen {
  final int queenID;
  final int hiveID;
  final QueenColour isMarkedAndClipped;

  Queen({
    required this.queenID,
    required this.hiveID,
    required this.isMarkedAndClipped,
  });
}

///  The HiveINspection tracks each inspection of the hive
///  - Each hive has at least one brood box but can have multiple
///  - Each hive has zero or more supers.
///  - Each hive has zero or one feeder
///  - Each hive has zero or one queen.
///
///  An inspection will identify the folloowing:
///  - Is the queen seen?
///  - Is the queen laying?
///  - Does she have room to lay?
///  - If there are queen cells or cups
///  - The number of freames of brood
///  - The number of frames of pollen
///  - The number of frames of stores
class HiveInspection {
  final int hiveID,
  final int broodBoxes;
  final int supers;
  final bool hasFeeder;
  final bool queenHasRoomToLay;
  final bool hasQueenCells;
  final bool queenIsSeen;
  final bool queenIsLaying;
  final int broodFrames;
  final int pollenAmount;
  final int honeyAmount;
  final String diseaseInfo;

  HiveInspection({
    required this.hiveID,
    required this.apiaryID,
    required this.type,
    required this.broodBoxes,
    required this.supers,
    required this.hasFeeder,
    required this.queenHasRoomToLay,
    required this.hasQueenCells,
    required this.queenIsSeen,
    required this.queenIsLaying,
    required this.broodFrames,
    required this.pollenAmount,
    required this.honeyAmount,
    required this.diseaseInfo,
  });
}

/// The QueenCInspection captures inspections of the hive, with a focus on queen
/// performance and characteristics.
///
/// The Queen has an associated set of observable items
///  - Are the bees docile (1=quiet, 5=demonic)
///  - Are they steady on the frames (1=continue their business, 5=hang off
///    the bottom of the frame)
///  - Is the brood pattern good (1=full frame, 5=pepper)
///  - Have they stored plenty of pollen (1=good store, 5=starving)
///  - Are they building comb at an appropriate rate (1=draw out comb in plenty
///    of time, 5=no wax production)
///  - Are they collecting propolis (1=hive protected, 5=bare wood)

class QueenIinspection {
  final int queenID;
  final int docility;
  final int steadiness;
  final int broodPattern;
  final int pollenStore;
  final int combBuilding;
  final int propolis;

  Queen({
    required this.queenID,
    required this.docility,
    required this.steadiness,
    required this.broodPattern,
    required this.pollenStore,
    required this.combBuilding,
    required this.propolis,
  });
}
