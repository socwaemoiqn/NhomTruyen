package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.tacGiaInfo;

@Transactional
public interface tacGiaDAO {
	
	public List<tacGiaInfo> listTacGia();
}