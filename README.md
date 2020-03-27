#  Dự án quản lý website đọc truyện chữ online - NhomTruyen
# Thành viên
  + Nguyễn Công Toàn - Võ Văn Việt
# Cấu trúc:
  Gồm 3 thư mục chính
    Thư mục 1: gồm các template về các trang cilent.
    Thư mục 2: gồm các file source chính của trang web.
    Thư mục 3: gồm các tài liệu tạc tả, phân tích thiết kế hệ thông.
# Ngôn ngữ: 
	Website viết bàng: java (Spring MVC + Hibernate)
	DÙng hệ quản trị CSDL: MySql.
# Các bước cài đặt
	1. Cài đặt trên localhost
	- Tạo database có tên dbnhomtruyen trong mysql (có thể dùng xampp, wamp, mysql, mysql workbench).
	- Add database có tên dbnhomtruyen.sql trong thư mục: ~\NhomTruyen\Source\Database
	- Add project vào elipse
	- Đợi 3-5 phút để eclipse tải xuống các thư viện sử dụng trong project.
	- Run project với server tomcat (Nếu chưa biết cách chạy trên server tomcat bạn có thể tham khảo link hướng dẫn : https://o7planning.org/en/10133/run-maven-java-web-application-in-tomcat-maven-plugin ).

# Các chú thích:
	- Một số ảnh của truyện sẽ bị mất khi pull từ git về nên các bạn cần add 
	các ảnh của truyện trong thư mục Image truyện trong thư mục 2 
	vào thư mục server trên máy bạn theo đường dẫn 
	~\NhomTruyen\Source\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebsiteDocTruyen\truyen\img
