abstract class Business_Status {}

class BusinessInitialStatus extends Business_Status {}

class BusinessLoadingStatus extends Business_Status {}

class BusinessSuccessStatus extends Business_Status {}

class BusinessErrorStatus extends Business_Status {
  String error ;

  BusinessErrorStatus(this.error);

}
