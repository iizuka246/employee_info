package com.javatpoint.controllers;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.javatpoint.beans.Emp;
import com.javatpoint.dao.EmpDao;

/**
 * 作成者 : エエティン 
 * クラス名 : EmpController 
 * 概要 : 社員情報コントローラ
 * 作成日 : 2021/08/02
*/

@Controller
@Scope("session")
public class EmpController {
	/**
	 * xmlファイルからdaoを挿入する
	 */
	@Autowired
	EmpDao dao;
	
	@Autowired
    MessageSource messagesource;

	/**
	 * ログイン画面表示処理
	 * 
	 * @param m 社員情報モデル
	 * @return ログイン画面へ遷移する
	 */
	@RequestMapping(value = "/init", method= RequestMethod.GET)
	public String login(Model m) {
		m.addAttribute("command", new Emp());
		return "login";
	}
	
	/**
	 * ログイン処理
	 * 
	 * @param emp 社員情報モデル
	 * @param     m 社員情報モデル
	 * @return ユーザ情報画面へ 遷移する
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("userInfo") Emp emp, Model m, HttpServletRequest request) {
		// データベース(UserLoginテーブル)情報を取得
		boolean userFlag = dao.userLogin(emp);
		// ログイン判定
		if (userFlag) {
			Emp userInfo = this.getUserInfo(emp.getId());
			m.addAttribute("userInfo", userInfo);
			m.addAttribute("command", userInfo);
			request.getSession().setAttribute("userInfo",userInfo);
			// ユーザ情報画面へ
			return "user_info";
		} else {
			String errorMsg = "ログインに失敗しました。";
			m.addAttribute("command", emp);
			m.addAttribute("errorMsg", errorMsg);
			return "login";
		}
	}
	
	/**
	 * ログアウト処理
	 * 
	 * @param request 
	 * @param     m 社員情報モデル
	 * @return ユーザ情報画面へ 遷移する
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userInfo");
        return "redirect:/init";
	}
	
	/**
	 *　ユーザ情報画面表示処理
	 * 
	 * @param request 
	 * @param     m 社員情報モデル
	 * @return ユーザ情報画面表示
	 */
	@RequestMapping(value = "/user_info", method = RequestMethod.GET)
	public String user_info(Model m, HttpServletRequest request) {
		Emp userInfo = (Emp) request.getSession().getAttribute("userInfo");
		m.addAttribute("userInfo", userInfo);
		m.addAttribute("command", userInfo);
		return "user_info";
	}

	/**
	 * ユーザ情報更新処理
	 * 
	 * @param emp 社員情報モデル
	 * @return
	 */
	@RequestMapping(value = "/userInfoEdit", method = RequestMethod.POST)
	public String userInfoEdit(@ModelAttribute("userInfo") Emp emp, Model m) {
		String password = emp.getPassword();
		if(password == null || password.length() == 0) {
			String message = messagesource.getMessage("NotEmpty.employeeForm.password", null, Locale.JAPAN);
			m.addAttribute("errorMsg", message);
			m.addAttribute("command", emp);
		}else if(password.length()< 8 || password.length()>10){
			String message = messagesource.getMessage("Size.employeeForm.password", null, Locale.JAPAN);
			m.addAttribute("errorMsg", message);
			m.addAttribute("command", emp);
		}else {
			dao.userInfoUpdate(emp);
			Emp userInfo = this.getUserInfo(emp.getId());
			m.addAttribute("command", userInfo);
		}
		
		// ユーザ情報画面へ
		return "user_info";
	}

	/**
	 * 社員情報登録画面表示処理
	 * 
	 * @param m 社員情報モデル
	 * @return 社員情報登録画面へ遷移する
	 */
	@RequestMapping("/empaddform")
	public String showform(Model m) {
		m.addAttribute("empform", new Emp());
		return "employee_add";
	}

	/**
	 * 社員情報登録処理
	 * 
	 * @param emp 社員情報
	 * @return 社員情報画面へ遷移する
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("empform") Emp emp, BindingResult result, Model m) throws ParseException {
		if (result.hasErrors()) {
			return "employee_add";
		}
		try {
			dao.saveEmployee(emp);
			dao.saveUser(emp);
		}catch (DuplicateKeyException e) {
			String message = messagesource.getMessage("Duplicate.employeeForm.id", null, Locale.JAPAN);
			m.addAttribute("duplicateKey",message);
			return "employee_add";
		}
		return "redirect:/empshowform";
	}

	/**
	 * 社員情報一覧画面表示処理
	 * @param m 社員情報
	 * @return 社員一覧画面へ遷移する
	 */
	@RequestMapping("/empshowform")
	public String viewemp(Model m) {
		List<Emp> list = dao.getEmployees();
		m.addAttribute("list", list);
		return "employee_show";
	}

	/**
	 * 社員情報編集画面表示
	 * @param id　編集ID
	 * @param m　社員情報モデル
	 * @return　社員情報編集画面へ遷移する
	 */
	@RequestMapping(value = "/editemp/{id}")
	public String edit(@PathVariable int id, Model m) {
		Emp emp = this.getUserInfo(id);
		m.addAttribute("command", emp);
		return "employee_edit";
	}

	/**
	 * 社員情報編集処理
	 * @param emp　社員情報モデル
	 * @return　社員情報一覧画面へ遷移する
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("emp") Emp emp) throws ParseException {
		dao.update(emp);
		return "redirect:/empshowform";
	}

	/**
	 * 社員情報削除処理
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		dao.delete(id);
		dao.deleteUser(id);
		return "redirect:/empshowform";
	}
	
	Emp getUserInfo(int id){
		Emp userInfo = dao.getEmpById(id);
		String password = dao.getUserPassword(id);
		userInfo.setPassword(password);
		return userInfo;
	}
}