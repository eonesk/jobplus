package job.resume.trophy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import job.resume.trophy.bean.RS_trophyDTO;
@Controller
public class RS_trophyController {
	@Autowired
	private RS_trophyService trophyService;	

	@RequestMapping(value="/job/resume/trophy/Write.do", method=RequestMethod.POST)
	public void Save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "ID";
		
		// 넘어오는 변수값 콘솔 확인
		String rstName = request.getParameter("rstName");
		String rstCompany = request.getParameter("rstCompany");
		String rstDate = request.getParameter("rstDate");
		String rstContent = request.getParameter("rstContent");
		String RSTUserTitle = request.getParameter("rstUserTitle");
		Date date=null;
		try {
			date = new SimpleDateFormat("yyyyMMdd").parse(rstDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// DTO에 변수 저장
		RS_trophyDTO trophyDTO = new RS_trophyDTO();
		
		trophyDTO.setRst_Name(rstName);
		trophyDTO.setRst_Company(rstCompany);
		trophyDTO.setRst_Date(date);
		trophyDTO.setRst_Content(rstContent);
		trophyDTO.setRST_UserTitle(RSTUserTitle);
		trophyDTO.setM_Id(memId);
		
		// DB작업
		int su = trophyService.Write(trophyDTO);		
				
		out.print(su);
	}
	@RequestMapping(value="/job/resume/trophy/LoadCount.do", method=RequestMethod.POST)
	public void LoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Session으로 넘어오는 ID값 임시 지정 
		String memId = "ID";

		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int num = trophyService.selectNumtrophy(memId);
		out.print(num);
	}
	@RequestMapping(value="/job/resume/trophy/Load.do", method=RequestMethod.POST)
	public void Load(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// Session으로 넘어오는 ID값 임시 지정
		String memId = "ID";
		
		// memId가 가지고 있는 자소서의 rsprUserTitle을 select해서 list에 추가
		List<RS_trophyDTO> UserTitleList = trophyService.selectTitleList(memId);	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("UserTitleList", UserTitleList);
		JSONObject jsonObject = new JSONObject();
		//jsonObject.putAll(map);
		
		out.println(jsonObject);
	}
	
	
}










