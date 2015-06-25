package com.eric.sys.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.eric.core.encrypt.EncryptUtil;
import com.eric.core.util.VerifyCodeUtil;

@Controller
@RequestMapping("/")
public class LoginController {
	/**
	 * 获取验证码图片和文本(验证码文本会保存在HttpSession中)
	 */
	@RequestMapping("getVerifyCodeImage")
	public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//设置页面不缓存
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
		//将验证码放到HttpSession里面
		request.getSession().setAttribute("verifyCode", verifyCode);
		System.out.println("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
		//设置输出的内容的类型为JPEG图像
		response.setContentType("image/jpeg");
		BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);
		//写给浏览器
		ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
	}
	
	/**
	 * 用户登录页面
	 */
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String tologin(HttpServletRequest request){
		return "login";
	}
	
	/**
	 * 用户登录验证
	 */
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(HttpServletRequest request){
		String resultPageURL = InternalResourceViewResolver.FORWARD_URL_PREFIX + "/";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String reminder = request.getParameter("reminder");
		//获取HttpSession中的验证码
		String verifyCode = (String)request.getSession().getAttribute("verifyCode");
		//获取用户请求表单中输入的验证码
		String submitCode = WebUtils.getCleanParam(request, "verifyCode");
		System.out.println("用户[" + username + "]登录时输入的验证码为[" + submitCode + "],HttpSession中的验证码为[" + verifyCode + "]");
		if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(verifyCode, submitCode.toLowerCase())){
			request.setAttribute("message_login", "验证码不正确");
			return "login";
		}
		String encrptPassword=EncryptUtil.encryptSha256(password);
		UsernamePasswordToken token = new UsernamePasswordToken(username, encrptPassword);
		if("1".equals(reminder)){
			token.setRememberMe(true);
		}
		
		System.out.println("为了验证登录用户而封装的token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
		//获取当前的Subject
		Subject currentUser = SecurityUtils.getSubject();
		try {
			//在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
			//每个Realm都能在必要时对提交的AuthenticationTokens作出反应
			//所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
			System.out.println("对用户[" + username + "]进行登录验证..验证开始");
			currentUser.login(token);
			System.out.println("对用户[" + username + "]进行登录验证..验证通过");
			//resultPageURL = "user";
		}catch(UnknownAccountException uae){
			System.out.println("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
			request.setAttribute("message_login", "未知账户");
		}catch(IncorrectCredentialsException ice){
			System.out.println("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");
			request.setAttribute("message_login", "密码不正确");
		}catch(LockedAccountException lae){
			System.out.println("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");
			request.setAttribute("message_login", "账户已锁定");
		}catch(ExcessiveAttemptsException eae){
			System.out.println("对用户[" + username + "]进行登录验证..验证未通过,错误次数过多");
			request.setAttribute("message_login", "用户名或密码错误次数过多");
		}catch(AuthenticationException ae){
			//通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
			System.out.println("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");
			ae.printStackTrace();
			request.setAttribute("message_login", "用户名或密码不正确");
		}
		//验证是否登录成功
		if(currentUser.isAuthenticated()){
			System.out.println("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");
			request.setAttribute("message_login", "success");
			resultPageURL="turnToMain";
		}else{
			token.clear();
		}
		return resultPageURL;
	}
	
	
	/**
	 * 用户登出
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		 SecurityUtils.getSubject().logout();
		 return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/";
	}
	
	/**
	 * 跳转页面
	 */
	@RequestMapping("/turnToMain")
	public String turnToMain(HttpServletRequest request){
		return "turnToMain";
	}
	
//	/**
//	 * 加上用户登录的remember me 的cookie
//	 * @param request
//	 * @param response
//	 * @param username
//	 * @param enPassword
//	 */
//	private void writeRememberMeCookie(HttpServletRequest request,HttpServletResponse response,String username,String enPassword){
//		String rememberMe=request.getParameter("_spring_security_remember_me");
//		if("1".equals(rememberMe)){
//			long tokenValiditySeconds = 1209600; // 14 days
//			long tokenExpiryTime = System.currentTimeMillis() + (tokenValiditySeconds * 1000);
//			String signatureValue = DigestUtils.md5Hex(username + ":" + tokenExpiryTime + ":" + enPassword + ":" + rememberPrivateKey);
//			String tokenValue = username + ":" + tokenExpiryTime + ":" + signatureValue;
//			String tokenValueBase64 = new String(Base64.encodeBase64(tokenValue.getBytes()));
//			Cookie cookie = new Cookie(TokenBasedRememberMeServices.SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY, tokenValueBase64);
//			cookie.setMaxAge(60 * 60 * 24 * 365 * 5); // 5 years
//			cookie.setPath(org.springframework.util.StringUtils.hasLength(request.getContextPath()) ? request.getContextPath() : "/");
//			response.addCookie(cookie);
//		}
//	}
}