import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/produk_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Menambahkan produk
  Future<void> addProduct(ProductModel product) async {
    await _firestore.collection('products').add(product.toMap());
  }

  // Mengupdate produk
  Future<void> updateProduct(String id, ProductModel product) async {
    await _firestore.collection('products').doc(id).update(product.toMap());
  }

  // Menghapus produk
  Future<void> deleteProduct(String id) async {
    await _firestore.collection('products').doc(id).delete();
  }

  // Mendapatkan produk secara real-time
  Stream<List<ProductModel>> fetchProducts() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
          .toList();
    });
  }
}
