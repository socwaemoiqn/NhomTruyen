package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.danhMucTruyenInfo;

@Transactional
public interface danhMucTruyenDAO {
	
	public List<danhMucTruyenInfo> dsDanhMucTruyen();
}
