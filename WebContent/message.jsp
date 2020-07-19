<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, javax.mail.*" %>
    <%@ page import="javax.mail.internet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String result;
final String firstname=request.getParameter("firstname");
final String lastname=request.getParameter("lastname");
final String country=request.getParameter("country");
final String subject=request.getParameter("subject");
final String from="psychomishra2016@gmail.com";
final String password="Dell123!@#";
String host = "smtp.gmail.com";

Properties properties = new Properties();

properties.put("mail.smtp.host", host);
properties.put("mail.transport.protocol","smtp");
properties.put("mail.smtp.auth", "true");
properties.put("mail.smtp.starttls.enable", "true");
properties.put("mail.user", from);
properties.put("mail.password", password);
properties.put("mail.port", "465");

Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator(){
	@Override 
	protected PasswordAuthentication getPasswordAuthentication(){
		
		return new PasswordAuthentication(from,password);
	}
});

try {
	MimeMessage message = new MimeMessage(mailSession);
	
	message.setFrom(new InternetAddress(from));
	message.addRecipient(Message.RecipientType.TO, new InternetAddress("sinhapriya.im@gmail.com"));
	message.setSubject(firstname+" Data");
	message.setContent("Hi Priya, <br><br>Please find the data of the "+firstname+"<br>Full Name : "+firstname+" "
		+lastname+"<br>Country : "+country+"<br>Subject : "+subject+"<br><br> Regards,<br>Psycho.", "text/html");
	
	Transport.send(message);
	result="Registered Successfully";
}

catch(MessagingException messageException){
	messageException.printStackTrace();
	result="Error : Unable to Send email";
}
%>>

<% 
	out.println("Result: " + result + "\n");
%>

</body>
</html>