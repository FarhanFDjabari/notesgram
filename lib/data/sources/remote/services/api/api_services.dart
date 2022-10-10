import 'dart:io';

import 'package:dio/dio.dart';
import 'package:notesgram/data/model/auth/login_info_model.dart';
import 'package:notesgram/data/model/auth/username_available_model.dart';
import 'package:notesgram/data/model/challenge/challenge_claim_model.dart';
import 'package:notesgram/data/model/challenge/challenge_item_model.dart';
import 'package:notesgram/data/model/explore/explore_post_model.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/note_folder/bookmarked_notes_folder_model.dart';
import 'package:notesgram/data/model/note_folder/purchased_notes_folder_model.dart';
import 'package:notesgram/data/model/notification/notification_model.dart';
import 'package:notesgram/data/model/payment/payment_model.dart';
import 'package:notesgram/data/model/payment/top_up_response_model.dart';
import 'package:notesgram/data/model/post/comment_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/model/profile/profile_response_model.dart';
import 'package:notesgram/data/model/promo/promo_model.dart';
import 'package:notesgram/data/model/promo/validate_promo_model.dart';
import 'package:notesgram/data/model/user/transaction_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/environment.dart';
import 'package:notesgram/data/sources/remote/interceptor/dio.dart';
import 'package:notesgram/data/sources/remote/wrapper/api_response.dart';
import 'package:notesgram/utils/helpers/secure_storage_manager.dart';
import 'package:retrofit/retrofit.dart';

import 'package:http_parser/http_parser.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final defHeader = Map<String, dynamic>.from(headers);
    defHeader["Accept"] = "application/json";

    String? token = await SecureStorageManager().getToken();
    if (token != null) defHeader["Authorization"] = "Bearer $token";

    return RestClient(
      await AppDio().getDIO(
          headers: defHeader,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @POST('/auth/login')
  Future<ApiResponse<LoginInfoModel>> login({
    @Field("emailOrUsername") String? emailOrUsername,
    @Field("password") String? password,
    @Field("fcm_token") String? fcmToken,
  });

  @POST('/auth/register')
  Future<ApiResponse<UserModel>> register({
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("name") String? name,
  });

  @POST('/auth/logout')
  Future<ApiResponse<dynamic>> logout();

  @GET('/profile')
  Future<ApiResponse<UserModel>> fetchMyProfile();

  @PUT('/profile')
  @MultiPart()
  Future<ApiResponse<UserModel>> editProfile({
    @Part(name: "name") String? name,
    @Part(name: "username") String? username,
    @Part(name: "fcm_token") String? fcmToken,
    @Part(name: "file", contentType: "image/png") File? file,
  });

  @POST('/user/username/create')
  Future<ApiResponse<dynamic>> createUsername({
    @Part(name: "username") String? username,
  });

  @GET('/user/{id}/follow')
  Future<ApiResponse<dynamic>> followUnfollowUser({
    @Path("id") required int userId,
  });

  @GET('/user/{id}/profile')
  Future<ApiResponse<ProfileResponseModel>> fetchUserProfile({
    @Path("id") required int userId,
  });

  @GET('/user/{id}/notes')
  Future<ApiResponses<NoteModel>> fetchUserNote({
    @Path("id") required int userId,
  });

  @GET('/user/username/check')
  Future<ApiResponse<UsernameAvailableModel>> checkUsernameAvailable({
    @Query("username") String? username,
  });

  @GET('/user/{id}/followers')
  Future<ApiResponses<UserModel>> fetchFollowersByUserId({
    @Path("id") required int userId,
  });

  @GET('/user/{id}/followings')
  Future<ApiResponses<UserModel>> fetchFollowingByUserId({
    @Path("id") required int userId,
  });

  @POST('/post')
  @MultiPart()
  Future<ApiResponse<PostModel>> createNewPost({
    @Part(name: "title") String? title,
    @Part(name: "caption") String? caption,
    @Part(name: "price") String? price,
    @Part(name: "files[]", contentType: 'image/png') List<File>? files,
  });

  @GET('/post')
  Future<ApiResponses<PostModel>> fetchAllPosts();

  @GET('/post/{id}/like')
  Future<ApiResponse<dynamic>> likeDislikePost({
    @Path("id") required int postId,
  });

  @POST('/post/{id}/comment')
  Future<ApiResponse<CommentModel>> createComment({
    @Path("id") required int userId,
    @Field("comment") String? comment,
  });

  @GET('/post/following')
  Future<ApiResponses<PostModel>> fetchFollowingUserPosts();

  @GET('/post/explore')
  Future<ApiResponse<ExplorePostModel>> explorePost({
    @Query("note_title") String? noteTitle,
    @Query("username") String? username,
    @Query("author_name") String? authorName,
  });

  @GET('/post/{id}/bookmark')
  Future<ApiResponse<dynamic>> bookmarkPost({
    @Path("id") required int postId,
  });

  @GET('/post/my/bookmarked')
  Future<ApiResponses<PostModel>> fetchBookmarkedPost();

  @POST('/payment/topup-coin')
  Future<ApiResponse<TopUpResponseModel>> topUpCoins({
    @Field("amount") int? amount,
  });

  @POST('/payment/withdraw')
  Future<ApiResponse<PaymentModel>> withdrawAccount({
    @Field("amount") int? amount,
    @Field("account_number") String? accountNumber,
    @Field("bank_code") String? bankCode,
  });

  @POST('/note/purchase')
  Future<ApiResponse<PostModel>> purchaseNote({
    @Field("note_id") int? noteId,
  });

  @GET('/note/{id}')
  Future<ApiResponse<NoteModel>> fetchNoteById({
    @Path("id") required String noteId,
  });

  @GET('/note/my/purchased')
  Future<ApiResponses<NoteModel>> fetchPurchasedNotes();

  @GET('/promo/validate')
  Future<ApiResponse<ValidatePromoModel>> validatePromoCode({
    @Query("code") String? promoCode,
  });

  @GET('/promo')
  Future<ApiResponses<PromoModel>> fetchAllPromo();

  @GET('/note-group/my/bookmarked')
  Future<ApiResponses<BookmarkedNotesFolderModel>> fetchBookmarkedNotesFolder();

  @GET('/note-group/my/purchased')
  Future<ApiResponses<PurchasedNotesFolderModel>> fetchPurchasedNotesFolder();

  @GET('/note-group/my/purchased/{id}')
  Future<ApiResponse<PurchasedNotesFolderModel>>
      fetchPurchasedNotesFolderDetail({
    @Path("id") required String folderId,
  });

  @GET('/note-group/my/bookmarked/{id}')
  Future<ApiResponse<BookmarkedNotesFolderModel>>
      fetchBookmarkedNotesFolderDetail({
    @Path("id") required String folderId,
  });

  @POST('/note-group/purchased')
  Future<ApiResponse<PurchasedNotesFolderModel>> createPurchasedNotesFolder({
    @Field("name") String? name,
  });

  @POST('/note-group/bookmarked')
  Future<ApiResponse<BookmarkedNotesFolderModel>> createBookmarkedNotesFolder({
    @Field("name") String? name,
  });

  @PUT('/note-group/bookmarked/{id}')
  @MultiPart()
  Future<ApiResponse<BookmarkedNotesFolderModel>> updateBookmarkedNotesFolder({
    @Path("id") required String folderId,
    @Part(name: "name") String? name,
    @Part(name: "note_ids[]") List<int>? noteIds,
  });

  @PUT('/note-group/purchased/{id}')
  @MultiPart()
  Future<ApiResponse<PurchasedNotesFolderModel>> updatePurchasedNotesFolder({
    @Path("id") required String folderId,
    @Part(name: "name") String? name,
    @Part(name: "note_ids[]") List<int>? noteIds,
  });

  @DELETE('/note-group/purchased/{id}')
  Future<ApiResponse<dynamic>> deletePurchasedNoteFolder({
    @Path("id") required String folderId,
  });

  @DELETE('/note-group/bookmarked/{id}')
  Future<ApiResponse<dynamic>> deleteBookmarkedNotesFolder({
    @Path("id") required String folderId,
  });

  @GET('/transaction/history')
  Future<ApiResponses<TransactionModel>> fetchTransactionHistory();

  @GET('/challenge')
  Future<ApiResponses<ChallengeItemModel>> fetchAllChallenge();

  @POST('/challenge/create')
  Future<ApiResponse<ChallengeItemModel>> createChallenge({
    @Field("title") String? title,
    @Field("description") String? description,
    @Field("period") String? period,
    @Field("category") String? category,
    @Field("reward") String? reward,
    @Field("count") int? count,
  });

  @GET('/challenge/{challengeId}/claim')
  Future<ApiResponse<ChallengeClaimModel>> challengeRewardClaim({
    @Path("challengeId") String? challengeId,
  });

  @GET('/notification')
  Future<ApiResponses<NotificationModel>> fetchAllNotifications();

  @GET('/notification/{notificationId}/read')
  Future<ApiResponse<dynamic>> markNotificationAsRead({
    @Path("notificationId") String? notificationId,
  });
}

const client = RestClient.create;
