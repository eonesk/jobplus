package job.resume.license.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		
		HttpSession session = request.getSession();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = (String) session.getAttribute("memId");	
		
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
		int rsls_Seq = 0;
		if(saveCount>0) {
			rsls_Seq = licenseService.selectLastSeq();
		}
		System.out.println("[RS_licenseController] saveCount : " + saveCount);
		
		out.print(rsls_Seq);
	}

	@RequestMapping(value="/job/resume/license/licenseLoadCount.do", method=RequestMethod.POST)
	public void licenseLoadCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("[RS_licenseLVController] licenseLoadCount");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = (String) session.getAttribute("memId");	
		
		// DB작업 : memID가 가지고 있는 자소서의 개수를 구함
		int numberOfLicense = licenseService.selectNumberOfLicense(memId);		
		System.out.println("[RS_licenseLVController] numberOfLicense : " + numberOfLicense);
		
		out.print(numberOfLicense);		
	}
	
	@RequestMapping(value="/job/resume/license/licenseLoad.do", method=RequestMethod.POST)
	public ModelAndView licenseLoad(HttpServletRequest request) throws IOException {
		System.out.println("[RS_licenseLVController] licenseLoad");
		
		ModelAndView modelAndView = new ModelAndView();
				
		HttpSession session = request.getSession();
		
		/** Session으로 넘어오는 memID값 임시 지정 */
		String memId = (String) session.getAttribute("memId");	
		
		// memId가 가지고 있는 자소서의 licenseUserTitle을 select해서 list에 추가
		List<RS_licenseDTO> licenseUserTitleList = licenseService.selectLicenseUserTitleList(memId);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		String rsls_Date = "";
		
		// licenseUserTitleList 리스트값 확인
		for(int i = 0; i < licenseUserTitleList.size(); i++) {
			RS_licenseDTO licenseDTO = licenseUserTitleList.get(i);
			System.out.println("[RS_licenseLVController] licenseDTO 출력 : " + licenseDTO.toString());
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			rsls_Date = dateFormat.format(licenseDTO.getRsls_Date());
			
			JSONObject temp = new JSONObject();
			temp.put("rsls_Seq", licenseDTO.getRsls_Seq());
			temp.put("rsls_Name", licenseDTO.getRsls_Name());
			temp.put("rsls_Company", licenseDTO.getRsls_Company());
			temp.put("rsls_Date", rsls_Date);
			temp.put("m_Id", licenseDTO.getM_Id());
			temp.put("rsls_UserTitle", licenseDTO.getRsls_UserTitle());
			items.put(i, temp);
		}

		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/license/licenseLoadJson.jsp");
		
		System.out.println("[RS_eduLVController] jsonObject 출력 : " + jsonObject);
		
		return modelAndView;
	}
	@RequestMapping(value="/job/resume/license/rslsLoadView.do", method=RequestMethod.POST)
	public ModelAndView rslsLoadView(HttpServletRequest request) {
		System.out.println("[RS_licenseLVController] rseLoadView");		
		
		ModelAndView modelAndView = new ModelAndView();
		JSONObject jsonObject = new JSONObject();
		JSONArray items = new JSONArray();
		
		String accumSeq = request.getParameter("accumSeq");
		System.out.println("[RS_licenseLVController] accumSeq : " + accumSeq);
		
		int accumSeqLastIndexOf = accumSeq.lastIndexOf("/");
		System.out.println("[RS_licenseLVController] accumSeqLastIndexOf : " + accumSeqLastIndexOf);
		
		String accumSeqSubstring = accumSeq.substring(0, accumSeqLastIndexOf);
		System.out.println("[RS_licenseLVController] accumSeqSubstring : " + accumSeqSubstring);
		
		String[] accumSeqSplit = accumSeq.split("/");
		String rsls_Date = "";
		
		for(int i = 0; i < accumSeqSplit.length; i++) {
			System.out.println("[RS_licenseLVController] accumSeqSplit[" + i + "] : " + accumSeqSplit[i]);
			int rsls_Seq = Integer.parseInt(accumSeqSplit[i]);
			RS_licenseDTO licenseDTO = licenseService.selectLicenseDTO(rsls_Seq);
			System.out.println("[RS_licenseLVController] licenseDTO : " + licenseDTO.toString());
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			rsls_Date = dateFormat.format(licenseDTO.getRsls_Date());
			
			JSONObject temp = new JSONObject();
			temp.put("rsls_Seq", licenseDTO.getRsls_Seq());
			temp.put("rsls_Name", licenseDTO.getRsls_Name());
			temp.put("rsls_Company", licenseDTO.getRsls_Company());
			temp.put("rsls_Date", rsls_Date);
			temp.put("m_Id", licenseDTO.getM_Id());
			temp.put("rsls_UserTitle", licenseDTO.getRsls_UserTitle());
			items.put(i, temp);
		}
		
		jsonObject.put("items", items);
		
		modelAndView.addObject("jsonObject", jsonObject);
		modelAndView.setViewName("/job/resume/license/selectedDTOJson.jsp");
		
		System.out.println("[RS_licenseLVController] jsonObject 출력 : " + jsonObject);
		
		return modelAndView;
	}
	
}
