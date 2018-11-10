package job.recruitment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import job.company.info.bean.CompanyInfoDTO;
import job.company.info.controller.CompanyInfoService;
import job.recruitment.apply.bean.RM_applyDTO;
import job.recruitment.apply.controller.RM_applyService;
import job.recruitment.bean.RMDTO;
import job.recruitment.condition.bean.RM_conditionDTO;
import job.recruitment.condition.controller.RM_conditionService;
import job.recruitment.dao.RMDAO;
import job.recruitment.introduction.bean.RM_introductionDTO;
import job.recruitment.introduction.controller.RM_introductionService;
import job.recruitment.job.bean.RM_jobDTO;
import job.recruitment.job.controller.RM_jobService;
import job.recruitment.personnel.bean.RM_personnelDTO;
import job.recruitment.personnel.controller.RM_personnelService;
import job.recruitment.time.bean.RM_timeDTO;
import job.recruitment.time.controller.RM_timeService;

@Controller
public class RMController {
	
	@Autowired
	private RMService rmService;
	@Autowired
	private RM_applyService applyService;
	@Autowired
	private RM_conditionService conditionService;
	@Autowired
	private RM_timeService timeService;
	@Autowired
	private RM_personnelService personnelService;
	@Autowired
	private RM_jobService jobService;
	@Autowired
	private RM_introductionService introductionService;
	@Autowired
	private CompanyInfoService companyInfoService;
	
	@RequestMapping(value= "/main/rmViewForm.do")
	public ModelAndView rmViewForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
				
		//String cpm_Id = request.getParameter("cpm_Id");
		//int rm_Seq = Integer.parseInt(request.getParameter("rm_Seq"));
		int rm_Seq = 1;
		String cpm_Id = "test";
		
		CompanyInfoDTO companyInfoDTO = companyInfoService.selectCompanyInfo(cpm_Id);
		//회사로고도 가져오긴 해야함
		RMDTO rmDTO = rmService.selectRM(rm_Seq);
		
		RM_applyDTO applyDTO = applyService.selectTable(rmDTO.getRma_Seq());
		RM_conditionDTO conditionDTO = conditionService.selectTable(rmDTO.getRmc_Seq());
		RM_timeDTO timeDTO = timeService.selectTable(rmDTO.getRmt_Seq());
		RM_introductionDTO introductionDTO = introductionService.selectTable(rmDTO.getRmi_Seq());
		RM_personnelDTO personnelDTO = personnelService.selectTable(rmDTO.getRmp_Seq());
		RM_jobDTO jobDTO = jobService.selectTable(rmDTO.getRmj_Seq());
		
		modelAndView.addObject("companyInfoDTO",companyInfoDTO);
		modelAndView.addObject("rmDTO", rmDTO);
		modelAndView.addObject("applyDTO", applyDTO);
		modelAndView.addObject("conditionDTO", conditionDTO);
		modelAndView.addObject("timeDTO", timeDTO);
		modelAndView.addObject("introductionDTO", introductionDTO);
		modelAndView.addObject("personnelDTO", personnelDTO);
		modelAndView.addObject("jobDTO", jobDTO);
				
		modelAndView.setViewName("/main/rmViewForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value= "/main/rmWriteForm.do")
	public ModelAndView rmWriteForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();		
		
		String cpm_Id = (String) session.getAttribute("comId");
		
		int rma_Seq = writeApply(request, response);
		int rmc_Seq = writeCondition(request, response);
		int rmt_Seq = writeTime(request, response);
		int rmi_Seq = writeIntroduction(request, response);
		int rmp_Seq = writePersonnel(request, response);
		int rmj_Seq = writeJob(request, response);
		
		String rm_Title = request.getParameter("rm_Title");
		
		RMDTO rmDTO = new RMDTO();
		rmDTO.setCpm_Id(cpm_Id);
		rmDTO.setRm_Title(rm_Title);
		rmDTO.setRma_Seq(rma_Seq);
		rmDTO.setRmc_Seq(rmc_Seq);
		rmDTO.setRmt_Seq(rmt_Seq);
		rmDTO.setRmi_Seq(rmi_Seq);
		rmDTO.setRmp_Seq(rmp_Seq);
		rmDTO.setRmj_Seq(rmj_Seq);
		
		int su = rmService.Write(rmDTO);
		
		modelAndView.addObject("su", su);
		modelAndView.setViewName("/main/rmViewForm.jsp");
		return modelAndView;
	}
	
	public int writeApply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		
		String rma_Studylv = request.getParameter("rma_Studylv");
		String rma_Isfinish = request.getParameter("rma_Isfinish");
		String rma_Major = request.getParameter("rma_Major");
		String rma_Vip = request.getParameter("rma_Vip");
		String rma_Foreign = request.getParameter("rma_Foreign");
		String rma_License = request.getParameter("rma_License");
		String rma_Gender = request.getParameter("rma_Gender");
		String rma_Age = request.getParameter("rma_Age");		
		String rma_Age2 = request.getParameter("rma_Age2");
				
		RM_applyDTO applyDTO = new RM_applyDTO();		
		applyDTO.setRma_Studylv(rma_Studylv);
		applyDTO.setRma_Isfinish(rma_Isfinish);
		applyDTO.setRma_Major(rma_Major);
		applyDTO.setRma_Vip(rma_Vip);
		applyDTO.setRma_Foreign(rma_Foreign);
		applyDTO.setRma_License(rma_License);
		applyDTO.setRma_Gender(rma_Gender);
		applyDTO.setRma_Age(rma_Age);
		applyDTO.setRma_Age2(rma_Age2);
		System.out.println(applyDTO.toString());
		// (2) DB			
		int su = applyService.Write(applyDTO);
		int rma_Seq = 0;
		if(su>0) {
			rma_Seq = applyService.selectLastSeq();
		}
		// (3) 화면네비게이션
		return rma_Seq;
	}
	public int writeCondition(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
				
		String rmc_Salary = request.getParameter("rmc_Salary1");
		String rmc_Business1 = request.getParameter("rmc_Business1");
		String rmc_Business2 = request.getParameter("rmc_Business2");
		String rmc_Business3 = request.getParameter("rmc_Business3");
		String rmc_Workspace = request.getParameter("rmc_Workspace");
		String rmc_Week = request.getParameter("rmc_Week");
		String rmc_Time = request.getParameter("rmc_Time");
		
		RM_conditionDTO conditionDTO = new RM_conditionDTO();
		conditionDTO.setRmc_Salary(rmc_Salary);
		conditionDTO.setRmc_Business1(rmc_Business1);
		conditionDTO.setRmc_Business2(rmc_Business2);
		conditionDTO.setRmc_Business3(rmc_Business3);
		conditionDTO.setRmc_Workspace(rmc_Workspace);
		conditionDTO.setRmc_Week(rmc_Week);
		conditionDTO.setRmc_Time(rmc_Time);
		
		int su = conditionService.Write(conditionDTO);
		int rmc_Seq = 0;
		if(su>0) {
			rmc_Seq = conditionService.selectLastSeq();
		}
		// (3) 화면네비게이션
		return rmc_Seq;
	}
	public int writeTime(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");		
		
		Date rmt_Startdate = null;
		Date rmt_Enddate = null;
		try {
			rmt_Startdate = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("rmt_Startdate"));
			rmt_Enddate = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("rmt_Enddate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String rmt_How = request.getParameter("rmt_How");
		String rmt_Form = request.getParameter("rmt_Form");
		
		RM_timeDTO timeDTO = new RM_timeDTO();
		timeDTO.setRmt_Startdate(rmt_Startdate);
		timeDTO.setRmt_Enddate(rmt_Enddate);
		timeDTO.setRmt_How(rmt_How);
		timeDTO.setRmt_Form(rmt_Form);
		
		int su = timeService.Write(timeDTO);
		int rmt_Seq = 0;
		if(su>0) {
			rmt_Seq = timeService.selectLastSeq();
		}
		// (3) 화면네비게이션
		return rmt_Seq;
	}
	public int writeIntroduction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");
		
		int rmi_Personnel = Integer.parseInt(request.getParameter("rmi_Personnel"));
		String rmi_Type = request.getParameter("rmi_Type");
		String rmi_Work1 = request.getParameter("rmi_Work1");
		String rmi_Work2 = request.getParameter("rmi_Work2");
		String rmi_Work3 = request.getParameter("rmi_Work3");
		String rmi_Department = request.getParameter("rmi_Department");		
		String rmi_Official = request.getParameter("rmi_Official");
					
		RM_introductionDTO introductionDTO = new RM_introductionDTO();
		introductionDTO.setRmi_Personnel(rmi_Personnel);
		introductionDTO.setRmi_Type(rmi_Type);
		introductionDTO.setRmi_Work1(rmi_Work1);
		introductionDTO.setRmi_Work2(rmi_Work2);
		introductionDTO.setRmi_Work3(rmi_Work3);
		introductionDTO.setRmi_Department(rmi_Department);
		introductionDTO.setRmi_Official(rmi_Official);	
		// (2) DB			
		int su = introductionService.Write(introductionDTO);
		int rmi_Seq = 0;
		if(su>0) {
			rmi_Seq = introductionService.selectLastSeq();
		}
		// (3) 화면네비게이션
		return rmi_Seq;
	}
	public int writePersonnel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		
		String rmp_name = request.getParameter("rmp_name");
		String rmp_dept = request.getParameter("rmp_dept");
		String rmp_email = request.getParameter("rmp_email");
		String rmp_phone1 = request.getParameter("rmp_phone1");
		String rmp_phone2 = request.getParameter("rmp_phone2");		
					
		//테스트용
		String cpm_id = "test";
		
		//실제
		//HttpSession session = request.getSession();
		//String cpm_id = session.getAttribute("cpm_id");
		
		RM_personnelDTO rm_personnelDTO = new RM_personnelDTO();
		rm_personnelDTO.setCpm_id(cpm_id);
		rm_personnelDTO.setRmp_name(rmp_name);
		rm_personnelDTO.setRmp_dept(rmp_dept);
		rm_personnelDTO.setRmp_email(rmp_email);
		rm_personnelDTO.setRmp_phone1(rmp_phone1);
		rm_personnelDTO.setRmp_phone2(rmp_phone2);
		
		// (2) DB			
		int su = personnelService.save(rm_personnelDTO);
		int rmp_Seq = 0;
		if(su>0) {
			rmp_Seq = personnelService.selectLastSeq();
		}
		// (3) 화면네비게이션
		return rmp_Seq;
	}
	public int writeJob(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터
		response.setContentType("text/html; charset=UTF-8");		
		
		String rmj_job = request.getParameter("rmj_job");
		String rmj_career = request.getParameter("rmj_career");
		String rmj_careerStart = request.getParameter("rmj_careerStart");
		String rmj_careerEnd = request.getParameter("rmj_careerEnd");
		String rmj_type = request.getParameter("rmj_type");		
					
		RM_jobDTO rm_jobDTO = new RM_jobDTO();
		rm_jobDTO.setRmj_job(rmj_job);
		rm_jobDTO.setRmj_career(rmj_career);
		rm_jobDTO.setRmj_careerStart(rmj_careerStart);
		rm_jobDTO.setRmj_careerEnd(rmj_careerEnd);
		rm_jobDTO.setRmj_type(rmj_type);
		// (2) DB			
		int su = jobService.save(rm_jobDTO);
		int rmj_Seq = 0;
		if(su>0) {
			rmj_Seq = jobService.selectLastSeq();
		}
		// (3) 화면네비게이션
		return rmj_Seq;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
