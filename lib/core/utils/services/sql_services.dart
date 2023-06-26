import 'package:flutter/foundation.dart';
import 'package:mysql1/mysql1.dart';

// Function to establish a MySQL connection

class MySql {
  static String host = "192.168.0.103";
  static String user = 'root';
  static String db = 'test1';
  static int portid = 3306;

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: portid,
      user: user,
      db: db,
    );
    try {
      return await MySqlConnection.connect(settings);
    } catch (e) {
      debugPrint('Error connecting to MySQL: $e');
      rethrow;
    }
  }

// User Model
  Future<void> insertUser(
      String firstName, String lastName, String email, String password) async {
    final connection = await getConnection();

    try {
      const query = '''
      INSERT INTO users (first_name, last_name, email, password_hash)
      VALUES (?, ?, ?, ?)
    ''';

      final result = await connection.query(
        query,
        [firstName, lastName, email, password],
      );

      if (result.affectedRows! > 0) {
        debugPrint('User inserted successfully!');
      } else {
        debugPrint('Failed to insert user.');
      }
    } catch (e) {
      debugPrint('Error inserting user: $e');
    } finally {
      connection.close();
    }
  }

  Future<void> insertProduct(String name, String description, double price,
      int quantity, String category, String imageurl) async {
    final conn = await getConnection();

    try {
      final result = await conn.query(
        'INSERT INTO products (name, description, price, quantity, category, imageurl) VALUES (?, ?, ?, ?, ?, ?)',
        [name, description, price, quantity, category, imageurl],
      );

      if (result.affectedRows! > 0) {
        debugPrint('Product added successfully!');
      } else {
        debugPrint('Failed to add product.');
      }
    } catch (e) {
      debugPrint('Error inserting product: $e');
    } finally {
      await conn.close();
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final conn = await getConnection();

    try {
      final result = await conn.query('SELECT * FROM products');
      return result.map((row) => row.fields).toList();
    } catch (e) {
      debugPrint('Error retrieving products: $e');
      return [];
    } finally {
      await conn.close();
    }
  }

  Future<void> updateProduct(int id, String name, double price) async {
    final conn = await getConnection();

    try {
      final result = await conn.query(
        'UPDATE products SET name = ?, price = ? WHERE id = ?',
        [name, price, id],
      );

      if (result.affectedRows! > 0) {
        debugPrint('Product updated successfully!');
      } else {
        debugPrint('Failed to update product.');
      }
    } catch (e) {
      debugPrint('Error updating product: $e');
    } finally {
      await conn.close();
    }
  }

  Future<void> deleteProduct(int id) async {
    final conn = await getConnection();

    try {
      final result =
          await conn.query('DELETE FROM products WHERE id = ?', [id]);

      if (result.affectedRows! > 0) {
        debugPrint('Product deleted successfully!');
      } else {
        debugPrint('Failed to delete product.');
      }
    } catch (e) {
      debugPrint('Error deleting product: $e');
    } finally {
      await conn.close();
    }
  }
}
