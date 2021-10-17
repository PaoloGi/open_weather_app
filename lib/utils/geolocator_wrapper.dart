import 'package:geolocator/geolocator.dart';

class GeolocatorWrapper {

  static Future<Position?>  getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        // return Future.error('Location permissions are permanently denied, we cannot request permissions.');
        return null;
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // return Future.error('Location permissions are denied');
        return null;
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  static String getSiglaProvincia(String nomeProvincia){

    switch(nomeProvincia.toUpperCase()){
      case "AGRIGENTO": return "AG";
      case "ALESSANDRIA": return "AL";
      case "ANCONA": return "AN";
      case "AOSTA": return "AO";
      case "AREZZO": return "AR";
      case "ASCOLI PICENO": return "AP";
      case "ASTI": return "AT";
      case "AVELLINO": return "AV";
      case "BARI": return "BA";
      case "BARLETTA": return "BT";
      case "BELLUNO": return "BL";
      case "BENEVENTO": return "BN";
      case "BERGAMO": return "BG";
      case "BIELLA": return "BI";
      case "BOLOGNA": return "BO";
      case "BOLZANO": return "BZ";
      case "BRESCIA": return "BS";
      case "BRINDISI": return "BR";
      case "CAGLIARI": return "CA";
      case "CALTANISSETTA": return "CL";
      case "CAMPOBASSO": return "CB";
      case "CARBONIA-IGLESIAS": return "CI";
      case "CASERTA": return "CE";
      case "CATANIA": return "CT";
      case "CATANZARO": return "CZ";
      case "CHIETI": return "CH";
      case "COMO": return "CO";
      case "COSENZA": return "CS";
      case "CREMONA": return "CR";
      case "CROTONE": return "KR";
      case "CUNEO": return "CN";
      case "ENNA": return "EN";
      case "FERMO": return "FM";
      case "FERRARA": return "FE";
      case "FIRENZE": return "FI";
      case "FOGGIA": return "FG";
      case "FORLÌ-CESENA": return "FC";
      case "FORLI-CESENA": return "FC";
      case "FROSINONE": return "FR";
      case "GENOVA": return "GE";
      case "GORIZIA": return "GO";
      case "GROSSETO": return "GR";
      case "IMPERIA": return "IM";
      case "ISERNIA": return "IS";
      case "LA SPEZIA": return "SP";
      case "L'AQUILA": return "AQ";
      case "LATINA": return "LT";
      case "LECCE": return "LE";
      case "LECCO": return "LC";
      case "LIVORNO": return "LI";
      case "LODI": return "LO";
      case "LUCCA": return "LU";
      case "MACERATA": return "MC";
      case "MANTOVA": return "MN";
      case "MASSA-CARRARA": return "MS";
      case "MATERA": return "MT";
      case "MESSINA": return "ME";
      case "MILANO": return "MI";
      case "MODENA": return "MO";
      case "MONZA": return "MB";
      case "NAPOLI": return "NA";
      case "NOVARA": return "NO";
      case "NUORO": return "NU";
      case "OLBIA-TEMPIO": return "OT";
      case "ORISTANO": return "OR";
      case "PADOVA": return "PD";
      case "PALERMO": return "PA";
      case "PARMA": return "PR";
      case "PAVIA": return "PV";
      case "PERUGIA": return "PG";
      case "PESARO E URBINO": return "PU";
      case "PESCARA": return "PE";
      case "PIACENZA": return "PC";
      case "PISA": return "PI";
      case "PISTOIA": return "PT";
      case "PORDENONE": return "PN";
      case "POTENZA": return "PZ";
      case "PRATO": return "PO";
      case "RAGUSA": return "RG";
      case "RAVENNA": return "RA";
      case "REGGIO CALABRIA": return "RC";
      case "REGGIO EMILIA": return "RE";
      case "RIETI": return "RI";
      case "RIMINI": return "RN";
      case "ROMA": return "RM";
      case "ROVIGO": return "RO";
      case "SALERNO": return "SA";
      case "MEDIO CAMPIDANO": return "VS";
      case "SASSARI": return "SS";
      case "SAVONA": return "SV";
      case "SIENA": return "SI";
      case "SIRACUSA": return "SR";
      case "SONDRIO": return "SO";
      case "TARANTO": return "TA";
      case "TERAMO": return "TE";
      case "TERNI": return "TR";
      case "TORINO": return "TO";
      case "OGLIASTRA": return "OG";
      case "TRAPANI": return "TP";
      case "TRENTO": return "TN";
      case "TREVISO": return "TV";
      case "TRIESTE": return "TS";
      case "UDINE": return "UD";
      case "VARESE": return "VA";
      case "VENEZIA": return "VE";
      case "VERBANO-CUSIO-OSSOLA": return "VB";
      case "VERCELLI": return "VC";
      case "VERONA": return "VR";
      case "VIBO VALENTIA": return "VV";
      case "VICENZA": return "VI";
      case "VITERBO": return "VT";
    }

    return "EE";
  }

}