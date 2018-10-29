package job.resume.license.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import job.resume.edu.bean.RS_eduDTO;
import job.resume.license.bean.RS_licenseDTO;

@Controller
public class RS_licenseController {

	@Autowired
	RS_licenseService licenseService;
	
	
	@RequestMapping(value="/job/resume/license/rslsSave.do", method=RequestMethod.POST)
	public void rslsSave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_licenseController] rseSave");
		
		response.setContentType("text/html; charset=UTF-8");		
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num1";		
		
		String rsls_Name = request.getParameter("rsls_Name");
		String rsls_Company = request.getParameter("rsls_Company");
		String rsls_Date_str = request.getParameter("rsls_Date");
		String m_Id = memId;
		String rsls_UserTitle = request.getParameter("rsls_UserTitle");
		
		System.out.println("[RS_licenseController] : " + rsls_Name + " // " + rsls_Company + " // " + rsls_Date_str + " // " 
							+ m_Id + " // " + rsls_UserTitle);
	
		Date rsls_Date = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			rsls_Date = dateFormat.parse(rsls_Date_str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("[RS_licenseController] rsls_Date : " + rsls_Date);
		
		RS_licenseDTO licenseDTO = new RS_licenseDTO();
		licenseDTO.setRsls_Name(rsls_Name);
		licenseDTO.setRsls_Company(rsls_Company);
		licenseDTO.setRsls_Date(rsls_Date);
		licenseDTO.setM_Id(m_Id);
		licenseDTO.setRsls_UserTitle(rsls_UserTitle);

		// DB 저장
		int saveCount = licenseService.rslsSave(licenseDTO);
		System.out.println("[RS_licenseController] saveCount : " + saveCount);
		
		out.print(saveCount);
	}

	@RequestMapping(value="/job/resume/license/licenseLoadCount.do", method=RequestMethod.POST)
	public void licenseLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_licenseLVController] licenseLoadCount");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num5";
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int numberOfLicense = licenseService.selectNumberOfLicense(memId);		
		System.out.println("[RS_licenseLVController] numberOfLicense : " + numberOfLicense);
		
		out.print(numberOfLicense);		
	}
	
	@RequestMapping(value="/job/resume/license/licenseLoad.do", method=RequestMethod.POST)
	public void licenseLoad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_licenseLVController] licenseLoad");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = "num5";
		
		// memId가 가지고 있는 자소서의 licenseUserTitle을 select해서 list에 추가
		List<RS_licenseDTO> licenseUserTitleList = licenseService.selectLicenseUserTitleList(memId);
		
		// licenseUserTitleList 리스트값 확인
		for(int i = 0; i < licenseUserTitleList.size(); i++) {
			RS_licenseDTO testDTO = licenseUserTitleList.get(i);
			System.out.println("[RS_licenseLVController] testDTO 출력 : " + testDTO.toString());
		}
/*		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("licenseUserTitleList", licenseUserTitleList);
		System.out.println("[RS_licenseLVController] map 출력 : " + map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.putAll(map);
		System.out.println("[RS_licenseLVController] jsonObject 출력 : " + jsonObject);
		
		String jsonObject_str = jsonObject.toString();
		System.out.println("[RS_licenseLVController] jsonObject_str 출력 : " + jsonObject_str);
		
		out.print(jsonObject_str);*/
	}
}
