package egovframework.example.service;

import java.util.List;
import java.util.Map;

import egovframework.example.vo.EgoVo;
import egovframework.example.vo.Search;

import egovframework.example.vo.MainVO;
import egovframework.example.vo.Search;

public interface TestMapper {
	
	List<EgoVo > selectTest(EgoVo egoVo) throws Exception;

	EgoVo selectDetail(String testName);

	void doAdd(EgoVo egoVo);

	EgoVo getArticle(int id);

	int getnewId();

	List<EgoVo> list(EgoVo egoVo);

	void delete(int id);

	void doModify(Map<String,Object> egoVo);

	int getLastId();

	public List<MainVO> selectBoard(Search search) throws Exception;
	
	public int getBoardListCnt(Search search) throws Exception;
	
	//게시물 상세조회
	public MainVO selectDetail(int board_id) throws Exception;
	
	public void boardHitUpdate(int num) throws Exception;

	
}
