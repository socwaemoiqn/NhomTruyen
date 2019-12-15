package vn.com.nhomtruyen.WebsiteDocTruyen.DAO;

import org.springframework.transaction.annotation.Transactional;

import vn.com.nhomtruyen.WebsiteDocTruyen.Model.LuotXemModel;

@Transactional
public interface LuotXemDAO {
	public LuotXemModel findLuotXem(LuotXemModel luotXemModel);
	public void insert(LuotXemModel luotXemModel);
	public void updateLuotXem(LuotXemModel luotXemModel);
}
