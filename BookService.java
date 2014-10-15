package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DB;

import model.Book;

public class BookService {
	public void add(Book c) {
		Connection conn = DB.createConn();
		String sql = "insert into _book values (null, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, c.getName());
			ps.setString(2, c.getDescription());
			ps.setString(3, c.getPubtime());
			ps.setString(4, c.getWhopub());
			ps.setString(5, c.getPrice());
			ps.setInt(6, c.getAid());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
		public void addau(Book c) {
			Connection conn = DB.createConn();
			String sql = "insert into _author values (null, ?, ?, ?)";
			PreparedStatement ps = DB.prepare(conn, sql);
			try {
				ps.setString(1, c.getAuthor());
				ps.setString(2, c.getAge());
				ps.setString(3, c.getCountry());
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(ps);
			DB.close(conn);
		}
	public List<Book> list(String author) throws SQLException {
		String sql;
		Connection conn = DB.createConn();
		if( author !="")
		sql = "SELECT _book.id AS id,_book.name AS name,_author.author AS author FROM _book JOIN _author  ON _author.id=_book.author_id where author LIKE '%"+author+"%'";
		else
		sql = "	SELECT _book.id AS id,_book.name AS name,_author.author AS author FROM _book JOIN _author  ON _author.id=_book.author_id ";	
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Book> books = new ArrayList<Book>();
		try {
			ResultSet rs = ps.executeQuery();
			Book c = null;
			while(rs.next()) {
				c = new Book();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setAuthor(rs.getString("author"));
				books.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw(e);
		}
		DB.close(ps);
		DB.close(conn);
		return books;
	}
	
	//�����б�
	public List<Book> aulist() throws SQLException {
		String sql;
		Connection conn = DB.createConn();
		sql = "SELECT * FROM _author";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Book> aus = new ArrayList<Book>();
		try {
			ResultSet rs = ps.executeQuery();
			Book c = null;
			while(rs.next()) {
				c = new Book();
				c.setAid(rs.getInt("id"));
				c.setAuthor(rs.getString("author"));
				aus.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw(e);
		}
		DB.close(ps);
		DB.close(conn);
		return aus;
	}
	
	public void delete(Book c) {
		deleteById(c.getId());
	}
	
	public void deleteById(int id) {
		Connection conn = DB.createConn();
		String sql = "delete from _book where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public void update(Book c) {
		Connection conn = DB.createConn();
		String sql = "update _book set author_id = ?, whopub = ?, pubtime = ? where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, c.getAid());
			ps.setString(2, c.getWhopub());
			ps.setString(3, c.getPubtime());
			ps.setInt(4, c.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public Book loadById(int id) {
		Connection conn = DB.createConn();
		String sql = "SELECT _book.id AS id,_book.name AS name,_book.description AS description,_book.whopub AS whopub,_book.pubtime AS pubtime,_book.price AS price,_author.author AS author,_author.age AS age,_author.country AS country FROM _book JOIN _author  ON _author.id=_book.author_id  where _book.id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		Book c = null;
		try {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
		
			if(rs.next()) {
				c = new Book();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescription(rs.getString("description"));
				c.setWhopub(rs.getString("whopub"));
				c.setPubtime(rs.getString("pubtime"));
				c.setPrice(rs.getString("price"));
				c.setAuthor(rs.getString("author"));
				c.setAge(rs.getString("age"));
				c.setCountry(rs.getString("country"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return c;
	}
}
