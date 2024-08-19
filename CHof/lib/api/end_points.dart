import 'package:dio/dio.dart';

import 'Dio_Consumer.dart';
import 'api_Comsumer.dart';

class EndPoints{
  static String baseUrl="http://192.168.1.2:8080";
  static String LoginMedecin="/auth/login/medecins";
  static String RegisterMedecin="/register/medecins";
  static String ForgotPass="/password/forgot";
  static String ResetPass="/password/reset";
  static String RegisterInfermier="/register/professionnels";
  static String LoginInfermier="/auth/login/professionelSante";
  static String LoginJeune="/auth/login/jeunes";
  static String RegisterJeuneScola="/register/jeunes/scolarise";
  static String RegisterJeuneUnScola="/register/jeunes/nonscolarise";
  static String GetJeuneViaId="/jeunes/";

  // Points de terminaison pour les lives
  static String GetAllLives = "/streams";
  static String GetLiveById(int id) => "/streams/$id";
  static String ActivateLive(int id) => "/streams/$id";
  static String DeleteLive(int id) => "/streams/$id";
  static String GetLiveImage(int id) => "/streams/$id/image";
  static String GetLiveFeedbackOpinions(int liveId) => "/streams/$liveId/opinions";
  static String AddLiveFeedbackOpinions(int liveId) => "/streams/$liveId/opinions";
  static String GetSuggestedThemes(int liveId) => "/streams/$liveId/suggestedThemes";
  static String AddSuggestedTheme(int liveId) => "/streams/$liveId/suggestedThemes";
  static String GetFeedbackEvaluations(int liveId) => "/streams/$liveId/evaluations";
  static String GetFeedbackRecommendations(int liveId) => "/streams/$liveId/recommendations";

  static String GetAllAdministrateurs() => "/admins";
  static String GetAdministrateurById(int id) => "/admins/$id";

  static String createLive(int adminId) => "/admins/$adminId/streams";
  static String updateLive(int adminId, int liveId) => "/admins/$adminId/streams/$liveId";
  static String getAllLivesByAdmin(int adminId) => "/admins/$adminId/streams";
}
class ApiKey{
  static String status="status";
  static String ErrorMsg="ErrorMessage";

}
final ApiComsumer api=DioConsumer(dio: Dio());