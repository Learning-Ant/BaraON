package com.koreait.baraON.command.club;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.ClubDao;

public class ChkOutClubCommand implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");

		int cl_no = 0;
		if(request.getParameter("cl_no") != null) {
			cl_no = Integer.parseInt(request.getParameter("cl_no"));
		}
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);

		int chkOutResult = clubDao.chkOutClub(cl_no);
		
		String c_mainImg = request.getParameter("c_mainImg");
		String realPath = request.getServletContext().getRealPath("resources/images/club");
		
		File file = new File(realPath, c_mainImg);
		
		if (file.exists()) {
			file.delete();
		}

		boolean afterChkOut = false;
		if(chkOutResult > 0) { 
			afterChkOut = true;
		}
		
		rttr.addFlashAttribute("chkOutResult", chkOutResult);
		rttr.addFlashAttribute("afterChkOut", afterChkOut);
		
	}

}
