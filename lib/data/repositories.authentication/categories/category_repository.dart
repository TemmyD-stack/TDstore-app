import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  // Fetch all categories from Firestore
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => 
      CategoryModel.fromSnapshot(document)).toList();

      return list;
    }  on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // upload categories to the cloud firebase firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try{
      // upload all the categories along with imges 
      final storage = Get.put(TFirebaseStorageService());

      // loop througb each
      for(var category in categories){

        // get img data and Get its URL
        final file = await storage.getImageDataFromAssets(category.image);
        final url = await storage.uploadImageData('Categories', file, category.image);

        // assign url to Category.image attribute
        category.image = url;

        // store category in firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());

      }
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;

    } on FormatException catch (_) {
        throw const TFormatException();

    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;

    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}