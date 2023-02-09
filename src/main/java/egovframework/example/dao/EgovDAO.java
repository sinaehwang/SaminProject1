package egovframework.example.dao;

import java.util.List;
import java.util.Map;

import egovframework.example.vo.EgoVo;
import egovframework.example.vo.MainVO;
import egovframework.example.vo.Search;


public interface EgovDAO {

	List<EgoVo> selectTest(EgoVo egoVo) throws Exception;

	EgoVo selectDetail(String name) throws Exception;

	void doAdd(EgoVo egoVo) throws Exception;

	EgoVo getArticle(int id) throws Exception;

	int getnewId() throws Exception;

	List<EgoVo> list(EgoVo egoVo) throws Exception;

	void delete(int id);

	void doModify(Map<String,Object> egoVo);

	int getLastId();

	public List<MainVO> selectBoard(Search search) throws Exception;
	
	public int getBoardListCnt(Search search) throws Exception;
	
	public MainVO selectDetail(int board_id)throws Exception;
	
	public void boardHitUpdate(int num) throws Exception;
	

}
