import 'package:notesgram/data/model/auth/auth_model.dart';
import 'package:notesgram/data/model/auth/login_info_model.dart';
import 'package:notesgram/data/model/auth/username_available_model.dart';
import 'package:notesgram/data/model/explore/explore_post_model.dart';
import 'package:notesgram/data/model/note/buy_note_model.dart';
import 'package:notesgram/data/model/note/folder_note_model.dart';
import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/note/purchase_model.dart';
import 'package:notesgram/data/model/note_folder/bookmarked_notes_folder_model.dart';
import 'package:notesgram/data/model/note_folder/purchased_notes_folder_model.dart';
import 'package:notesgram/data/model/notification/notification_model.dart';
import 'package:notesgram/data/model/payment/payment_model.dart';
import 'package:notesgram/data/model/payment/top_up_response_model.dart';
import 'package:notesgram/data/model/payment/withdrawal_model.dart';
import 'package:notesgram/data/model/post/bookmark_model.dart';
import 'package:notesgram/data/model/post/comment_model.dart';
import 'package:notesgram/data/model/post/like_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/model/promo/promo_model.dart';
import 'package:notesgram/data/model/promo/validate_promo_model.dart';
import 'package:notesgram/data/model/user/challenge_transaction_model.dart';
import 'package:notesgram/data/model/user/note_pictures_model.dart';
import 'package:notesgram/data/model/user/transaction_info_model.dart';
import 'package:notesgram/data/model/user/transaction_model.dart';
import 'package:notesgram/data/model/user/user_count_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    var strType = type.toString().replaceAll("?", "");
    if (strType == (AuthModel).toString()) {
      return AuthModel.fromJson(json);
    } else if (strType == (LoginInfoModel).toString()) {
      return LoginInfoModel.fromJson(json);
    } else if (strType == (UsernameAvailableModel).toString()) {
      return UsernameAvailableModel.fromJson(json);
    } else if (strType == (ExplorePostModel).toString()) {
      return ExplorePostModel.fromJson(json);
    } else if (strType == (BuyNoteModel).toString()) {
      return BuyNoteModel.fromJson(json);
    } else if (strType == (FolderNoteModel).toString()) {
      return FolderNoteModel.fromJson(json);
    } else if (strType == (NoteModel).toString()) {
      return NoteModel.fromJson(json);
    } else if (strType == (PurchaseModel).toString()) {
      return PurchaseModel.fromJson(json);
    } else if (strType == (BookmarkedNotesFolderModel).toString()) {
      return BookmarkedNotesFolderModel.fromJson(json);
    } else if (strType == (PurchasedNotesFolderModel).toString()) {
      return PurchasedNotesFolderModel.fromJson(json);
    } else if (strType == (TopUpResponseModel).toString()) {
      return TopUpResponseModel.fromJson(json);
    } else if (strType == (TopUpPaymentModel).toString()) {
      return TopUpPaymentModel.fromJson(json);
    } else if (strType == (PaymentModel).toString()) {
      return PaymentModel.fromJson(json);
    } else if (strType == (WithdrawalModel).toString()) {
      return WithdrawalModel.fromJson(json);
    } else if (strType == (BookmarkModel).toString()) {
      return BookmarkModel.fromJson(json);
    } else if (strType == (CommentModel).toString()) {
      return CommentModel.fromJson(json);
    } else if (strType == (LikeModel).toString()) {
      return LikeModel.fromJson(json);
    } else if (strType == (PostModel).toString()) {
      return PostModel.fromJson(json);
    } else if (strType == (PromoModel).toString()) {
      return PromoModel.fromJson(json);
    } else if (strType == (ValidatePromoModel).toString()) {
      return ValidatePromoModel.fromJson(json);
    } else if (strType == (NotePicturesModel).toString()) {
      return NotePicturesModel.fromJson(json);
    } else if (strType == (UserCountModel).toString()) {
      return UserCountModel.fromJson(json);
    } else if (strType == (UserModel).toString()) {
      return UserModel.fromJson(json);
    } else if (strType == (TransactionModel).toString()) {
      return TransactionModel.fromJson(json);
    } else if (strType == (TransactionInfoModel).toString()) {
      return TransactionInfoModel.fromJson(json);
    } else if (strType == (ChallengeTransactionModel).toString()) {
      return ChallengeTransactionModel.fromJson(json);
    } else if (strType == (NotificationModel).toString()) {
      return NotificationModel.fromJson(json);
    }
    // if not implemented
    else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
