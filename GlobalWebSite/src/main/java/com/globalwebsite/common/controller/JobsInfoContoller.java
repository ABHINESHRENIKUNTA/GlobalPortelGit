package com.globalwebsite.common.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Hashtable;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.globalwebsite.common.model.StudentLoginModel;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;

@Controller
public class JobsInfoContoller {
	
	 @Autowired
	 private JavaMailSender mailSenderObj;
	
	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	
	@RequestMapping("/displayDifferentUsers")
	public String displayDifferentUsers(Model model){
		
		
		return "user/displayDiffUsers";
	}
	
	@RequestMapping("/studentLogin")
	public String studentLogin(Model model,StudentLoginModel stud,HttpServletRequest req){
		
		model.addAttribute("login", stud);
		model.addAttribute("regemsg", req.getParameter("regemsg"));
		model.addAttribute("regsmsg", req.getParameter("regsmsg"));
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		return "user/studentLogin";
	}
	
	@RequestMapping("/ValidateStudent")
	public String ValidateStudent(Model model,StudentLoginModel stud,HttpServletRequest req){
		 String emsg="",smsg="";
		int validuser=userserviceimpl.validateStudentDetails(stud);
		if(validuser>0){
			return "redirect:/ValidStudent";
		}
		else{
			emsg="Invalid User";
		}
		model.addAttribute("smsg",smsg);
		model.addAttribute("emsg",emsg);
		
		return "redirect:/studentLogin";
	}
	
	
	@RequestMapping("/registerStudent")
	public String registrerStudent(Model model,StudentLoginModel stud,@RequestParam("file1") MultipartFile file)
	{
		String regsmsg="";
		String regemsg="";
		int alreadyexst=userserviceimpl.getCountForAlreadyExistStudent(stud);
		try{
		doLookup(stud.getEmailid());
		 
		}
		catch(Exception e ){
			  System.out.println(stud.getEmailid() + " : " + e.getMessage());
		}
		
		if(alreadyexst==0){
			String filename=studentUploadResume(file);
			stud.setUploadresume(filename);
			int insertdata=userserviceimpl.insertStudentRegistrationDetails(stud);
			if(insertdata>0){
				regsmsg="You Have Registered Successfully.";
			}
			else{
			regemsg="There is an error while adding data.";
			}
		}
		else{
			regemsg="User Already Exist For Given Email Id.";
		}
		model.addAttribute("regemsg", regemsg);
		model.addAttribute("regsmsg", regsmsg);
		return "redirect:/studentLogin";
	}
	
	public String studentUploadResume(MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				System.out.println(file.getOriginalFilename());
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+"StudentUplaodResumes");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+File.separator+file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				

				return file.getOriginalFilename();
			} catch (Exception e) {
				return "You failed to upload " + e.getMessage();
			}
		} else {
			return "You failed to upload " 
					+ " because the file was empty.";
		}
	}
	 public void doLookup( String hostName ) throws NamingException {
		 Hashtable env = new Hashtable();
		 env.put("java.naming.factory.initial",
		              "com.sun.jndi.dns.DnsContextFactory");
		 DirContext ictx = new InitialDirContext( env );
		 Attributes attrs = ictx.getAttributes
		                        ( hostName, new String[] { "MX" });
		 Attribute attr = attrs.get( "MX" );
		 if (( attr == null ) || ( attr.size() == 0 )) {
		    attrs = ictx.getAttributes( hostName, new String[] { "A" });
		    attr = attrs.get( "A" );
		    if( attr == null )
		          throw new NamingException
		                   ( "No match for name '" + hostName + "'" );
		 }
	 }

}
