package job.recruitment.mainSearch.controller;

import java.util.Date;
import java.util.List;

public interface MainSearchService {
	int selectRM_seq(int range);
	List<Integer> selectXXO(String jobSelect3);
	List<Integer> selectXOX(String searchRegion);
	List<Integer> selectXOO(String jobSelect3, String searchRegion);
	List<String> selectCompany(String searchCompany);
	List<Integer> selectRM_seqFromId(String cpm_id);
	int selectRM_seqFromIdAndRMC_seq_cnt(String cpm_id, int range);
	int selectRM_seqFromIdAndRMC_seq(String cpm_id, int range);
	String selectRM_title(int seq);
	String selectCpm_id(int seq);
	String selectCPI_companyName(String cpm_id_re);
	String selectRMJ_career(int seq);
	String selectRMA_studyLV(int seq);
	String selectRMJ_type(int seq);
	Date selectRMT_endDate(int seq);
}
