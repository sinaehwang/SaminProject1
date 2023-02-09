package egovframework.example.service;

import java.util.List;
import java.util.Map;

import egovframework.example.vo.EgoVo;

import egovframework.example.vo.MainVO;
import egovframework.example.vo.Search;

public interface EgovService {

	public List<EgoVo> selectTest(EgoVo egoVo) throws Exception;

	public EgoVo selectDetail(String name) throws Exception;

	public void doAdd(EgoVo egoVo) throws Exception;

	public EgoVo getArticle(int id) throws Exception;

	public int getnewId() throws Exception;

	public List<EgoVo> list(EgoVo egoVo) throws Exception;

	public void delete(int id) throws Exception;

	public void doModify(Map<String,Object> param);

	public int getLastId();
	
	//목록 조회
	public List<MainVO> selectBoard(Search search) throws Exception;
		
	//전체 게시글 갯수
	public int getBoardListCnt(Search search) throws Exception;
	
	//게시물 상세조회
	public MainVO selectDetail(int board_id) throws Exception;
	
	//조회수 증가
	public void boardHitUpdate(int num) throws Exception;
	
}
