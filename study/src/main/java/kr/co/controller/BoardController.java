package kr.co.controller;



import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.board.BoardDto;

@Controller
public class BoardController {
	
	@Autowired//setter메서드 대신!
	private SqlSession sqlSession;//변수,Mybatis 사용
	
	@RequestMapping("/writeForm.do")//요청매핑
	public String writeForm() {
		return "writeForm";//뷰 리턴,views/writeForm.jsp
		
	}
	
	@RequestMapping(value="/writePro.do",method=RequestMethod.POST)
	public String writePro(@ModelAttribute("boardDto") BoardDto boardDto, HttpServletRequest request) throws IOException,NamingException{
		
		sqlSession.insert("boardTest.insertBoard",boardDto);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/list.do")
	public ModelAndView boardList() {
		List<HashMap<String,String>> list=sqlSession.selectList("boardTest.selectAll");
		return new ModelAndView("list","list",list);
	}
	
	@RequestMapping("/content.do")
	public ModelAndView getContent(@RequestParam int no) {
		System.out.println("content.do ");
		System.out.println("no : " + no);
		sqlSession.update("boardTest.hitCount",no);
		BoardDto boardDto=(BoardDto)sqlSession.selectOne("boardTest.selectOne",no);
		
		return new ModelAndView("content","boardDto",boardDto);		
	}
	@RequestMapping(value="/updateForm.do",method=RequestMethod.GET)
	public ModelAndView updateForm(int no) {
		BoardDto boardDto=(BoardDto)sqlSession.selectOne("boardTest.selectOne",no);
		return new ModelAndView("updateForm","boardDto",boardDto);
	}
	@RequestMapping(value="/updatePro.do",method=RequestMethod.POST)
	public String updatePro(@ModelAttribute("boardDto") BoardDto boardDto) throws IOException,NamingException{
		sqlSession.update("boardTest.updateBoard", boardDto);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="/delete.do")
	public String deleteBoard(int no) throws IOException,NamingException{
		sqlSession.delete("boardTest.deleteBoard",no);
		return "redirect:list.do";
	}
	
}//class end

