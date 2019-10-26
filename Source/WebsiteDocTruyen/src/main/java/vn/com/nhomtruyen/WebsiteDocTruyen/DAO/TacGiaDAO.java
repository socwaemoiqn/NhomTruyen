package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.TacGiaInfo;

@Transactional
public interface TacGiaDAO {
	
	public List<TacGiaInfo> listTacGia();
}
