package web;

import java.util.List;

import model.Book;
import service.BookService;

import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	private List<Book> books;
	private List<Book> aus;
	private BookService BookService = new BookService(); 
	private Book Book;
	private int id;
	private String au;//搜索传值
	public String list() throws Exception {
		books = BookService.list("");
	    aus = BookService.aulist();
		return SUCCESS;
	}
	public String slist() throws Exception {
		books = BookService.list(au);
		aus = BookService.aulist();
		return SUCCESS;
	}
	public String getAu() {
		return au;
	}
	public void setAuthor(String au) {
		this.au = au;
	}
	public String add() {
		BookService.add(Book);
		return SUCCESS;
	}
	public String addau() {
		BookService.addau(Book);
		return SUCCESS;
	}
	public String update() {
		BookService.update(Book);
		return SUCCESS;
	}
	public String delete() {
		BookService.deleteById(id);
		return SUCCESS;
	}
	public String addInput() {
		
		return INPUT;
	}
	public String updateInput() throws Exception {
		Book = BookService.loadById(id);
		aus = BookService.aulist();
		return INPUT;
	}
	public List<Book> getbooks() {
		return books;
	}
	public void setbooks(List<Book> books) {
		this.books = books;
	}
	public List<Book> getaus() {
		return aus;
	}
	public void setaus(List<Book> aus) {
		this.aus = aus;
	}
	public BookService getBookService() {
		return BookService;
	}
	public void setBookService(BookService BookService) {
		this.BookService = BookService;
	}
	public Book getBook() {
		return Book;
	}
	public void setBook(Book Book) {
		this.Book = Book;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
