package org.zerock.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping
public class ListController {

	@Inject
	BoardService service;
	
	@Inject
	ReplyService rservice;

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {

		try {
			List<BoardVO> list = service.getList(cri);

			model.addAttribute("list", list);
			model.addAttribute("cri", cri);
			model.addAttribute("pageMaker", new PageMaker(cri, service.getCount(cri)));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@GetMapping("/view")
	public void view(BoardVO vo, Model model, @ModelAttribute("cri") Criteria cri) {

		try {

			if (vo.getTitle() != null) {
				model.addAttribute("update", "success");
				service.updateData(vo);
			}

			BoardVO view = service.getContent(vo);
			model.addAttribute("view", view);
			model.addAttribute("cri", cri);
			model.addAttribute("pageMaker", new PageMaker(cri, service.getCount(cri)));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String registerPost(BoardVO vo, RedirectAttributes rttr) {

		try {
			if (vo.getTitle() == "" || vo.getContent() == "" || vo.getWriter() == "") {
				rttr.addFlashAttribute("fail", "fail");
				return "redirect:/register";
			} else {
				service.register(vo);
				rttr.addFlashAttribute("msg", "success");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/list";

	}

	@PostMapping("/view")
	public String delete(@ModelAttribute("vo") BoardVO vo, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {

		// rttr.addAttribute("keyword", cri.getKeyword());
		String keyword = cri.getKeyword();
		try {
			service.removeData(vo);
			rttr.addFlashAttribute("delete", "success");

			keyword = URLEncoder.encode(keyword, "UTF-8");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/list?page=" + cri.getPage() + "&bno=" + vo.getBno() + "&type=" + cri.getType() + "&keyword="
				+ keyword;

	}

	@GetMapping("/update")
	public void update(@ModelAttribute("vo") BoardVO vo, Model model, @ModelAttribute("cri") Criteria cri) {

		BoardVO view;
		try {
			view = service.getContent(vo);
			model.addAttribute("view", view);
			;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@GetMapping("/re")
	public String re() {

		return "redirect:/list";
	}

}
