package vn.com.nhomtruyen.WebsiteDocTruyen.Model;

public class SelectTruyenInfo {
	private String ID;
	private String tenTruyen;
	private String tenTacGia;
	private int soChuong;
	private String gioiThieu;
	private String tenNhomDich;
	private int luotXem;
	private String nguon;
	private String hinhAnh;
	private boolean full;
	private boolean hot;
	private boolean news;
	private boolean hienThi;
	private String ngayTao;
	public SelectTruyenInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SelectTruyenInfo(String iD, String tenTruyen, String tenTacGia, int soChuong, String gioiThieu,
			String tenNhomDich, int luotXem, String nguon, String hinhAnh, boolean full, boolean hot, boolean news,
			boolean hienThi, String ngayTao) {
		super();
		ID = iD;
		this.tenTruyen = tenTruyen;
		this.tenTacGia = tenTacGia;
		this.soChuong = soChuong;
		this.gioiThieu = gioiThieu;
		this.tenNhomDich = tenNhomDich;
		this.luotXem = luotXem;
		this.nguon = nguon;
		this.hinhAnh = hinhAnh;
		this.full = full;
		this.hot = hot;
		this.news = news;
		this.hienThi = hienThi;
		this.ngayTao = ngayTao;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTenTruyen() {
		return tenTruyen;
	}
	public void setTenTruyen(String tenTruyen) {
		this.tenTruyen = tenTruyen;
	}
	public String getTenTacGia() {
		return tenTacGia;
	}
	public void setTenTacGia(String tenTacGia) {
		this.tenTacGia = tenTacGia;
	}
	public int getSoChuong() {
		return soChuong;
	}
	public void setSoChuong(int soChuong) {
		this.soChuong = soChuong;
	}
	public String getGioiThieu() {
		return gioiThieu;
	}
	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}
	public String getTenNhomDich() {
		return tenNhomDich;
	}
	public void setTenNhomDich(String tenNhomDich) {
		this.tenNhomDich = tenNhomDich;
	}
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}
	public String getNguon() {
		return nguon;
	}
	public void setNguon(String nguon) {
		this.nguon = nguon;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public boolean isFull() {
		return full;
	}
	public void setFull(boolean full) {
		this.full = full;
	}
	public boolean isHot() {
		return hot;
	}
	public void setHot(boolean hot) {
		this.hot = hot;
	}
	public boolean isNews() {
		return news;
	}
	public void setNews(boolean news) {
		this.news = news;
	}
	public boolean isHienThi() {
		return hienThi;
	}
	public void setHienThi(boolean hienThi) {
		this.hienThi = hienThi;
	}
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
}
