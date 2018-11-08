package job.recruitment.mainSearch.controller;

import java.util.List;

public interface MainSearchService {
	List<Integer> selectXXO(String jobSelect3);
	List<Integer> selectXOX(String searchRegion);
	List<Integer> selectXOO(String jobSelect3, String searchRegion);
	String selectCompany(String searchCompany);
	String selectTitle(int range);
}
