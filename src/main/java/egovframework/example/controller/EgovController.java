package egovframework.example.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.service.EgovService;
import egovframework.example.util.Ut;
import egovframework.example.vo.EgoVo;
import egovframework.example.vo.Search;

@Controller
public class EgovController {

	@Autowired
	private EgovService egovService;
	/*
	@RequestMapping(value = "/main.do")
	public String main() throws Exception {

		return "saminForest";
	}
	 */
	
	@RequestMapping(value = "/write.do")
	public String write() throws Exception {

		return "insertBoard";
	}

	@RequestMapping(value = "/doAdd.do")
	public String doAdd(@ModelAttribute("egoVo") EgoVo egoVo, HttpServletRequest request) throws Exception {

		egovService.doAdd(egoVo);

		int id = egovService.getLastId();

		return "redirect:detail.do?id=" + id;
	}

	@RequestMapping(value = "/delete.do")
	public String delete(HttpServletRequest request) throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		egovService.delete(id);

		return "redirect:main.do";

	}
	
	@RequestMapping(value = "/list.do")
	public String list(Model model, EgoVo egoVo) throws Exception {

		model.addAttribute("list", egovService.list(egoVo));

		return "list";

	}

	@RequestMapping(value = "/detail.do")
	public String detail(Model model, HttpServletRequest request) throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		EgoVo article = egovService.getArticle(id);

		egovService.boardHitUpdate(id);
		
		model.addAttribute("article", article);

		return "detailBoard";

	}

	@RequestMapping(value = "/modify.do")
	public String modify(Model model, HttpServletRequest request) throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		EgoVo article = egovService.getArticle(id);

		model.addAttribute("updateCheck", request.getParameter("updateCheck"));

		model.addAttribute("article", article);

		return "passwordPopup";
	}

	@RequestMapping(value = "/docheckPw.do")
	public String doCheck(@RequestParam Map<String, Object> param,  Model model,HttpServletRequest request)
			throws Exception {

		String pw = request.getParameter("pw");

		int id = Integer.parseInt(request.getParameter("board_id"));

		EgoVo article = egovService.getArticle(id);
		
		if(article.getPassword().equals(pw)==false) {
			
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "/Egov/detail.do?id="+id);

			return "alert";
		}
		
		model.addAttribute("article", article);

		return "modify";

	}

	@RequestMapping(value = "/doModify.do")
	public String doModify(@RequestParam Map<String, Object> param) throws Exception {

		egovService.doModify(param);

		return "redirect:detail.do?id=" + param.get("board_id");

	}

	@RequestMapping(value = "testDetail.do")
	public String viewForm(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String name = request.getParameter("testName");

		// 이름이 공백인 경우를 막기위한 임시 데이터
		if (name.isEmpty()) {
			request.setAttribute("msg", "이름을 입력해주세요");
			request.setAttribute("url", "/Egov/testList.do");

			return "alert";
		}

		// 숫자로 시작하는 경우 막기위한 임시데이터
		if (Ut.isStandardLoginIdString(name)) {
			request.setAttribute("msg", "숫자로 시작할 수 없습니다.");
			request.setAttribute("url", "/Egov/testList.do");

			return "alert";

			// return Ut.msgAndBack(request, "숫자로 시작할 수 없습니다.");
		}

		EgoVo egoVo = egovService.selectDetail(name);

		if (egoVo == null) {

			request.setAttribute("msg", "일치하는 회원정보가 없습니다.");
			request.setAttribute("url", "/Egov/testList.do");

			// return Ut.msgAndBack(request, "일치하는 회원정보가 없습니다.");

			return "alert";
		}

		model.addAttribute("vo", egoVo);

		return "detailBoard";

	}

	@RequestMapping(value = "/testList.do")
	public String testListdo(EgoVo egoVo, Model model) throws Exception {

		model.addAttribute("list", egovService.selectTest(egoVo));

		return "view";

	}
	
	//페이징
	@RequestMapping(value = "/main.do")
	public String getBoard(Model model
			,@RequestParam(required=false,defaultValue="1", value = "page")int page
			,@RequestParam(required=false,defaultValue="1")int range
            ,@RequestParam(required=false,defaultValue="title")String searchType
            ,@RequestParam(required=false)String keyword
            ,@ModelAttribute("search")Search search) throws Exception{
		
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = egovService.getBoardListCnt(search);
				
		//검색 후 페이지
		search.pageInfo(page, range, listCnt);
		//페이징
		model.addAttribute("pagination", search);
		//게시글 화면 출력
		model.addAttribute("list", egovService.selectBoard(search));	
		
		return "main";
	}	
	
}
