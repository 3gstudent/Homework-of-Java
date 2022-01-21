<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.util.concurrent.ConcurrentHashMap" %>
<%@ page import="java.util.*" %>
<%       
    Field f = request.getClass().getDeclaredField("_scope");
    f.setAccessible(true);  
    Object obj1 = f.get(request);
    f = obj1.getClass().getDeclaredField("_servlet");
    f.setAccessible(true);
    Object obj2 = f.get(obj1);
    f = obj2.getClass().getSuperclass().getDeclaredField("rctxt");
    f.setAccessible(true);
    Object obj3 = f.get(obj2);
    f = obj3.getClass().getDeclaredField("jsps");
    f.setAccessible(true);
    ConcurrentHashMap obj4 = (ConcurrentHashMap)f.get(obj3);  
    Enumeration enu = obj4.keys(); 
    while (enu.hasMoreElements()) { 
        out.println(enu.nextElement() + "<br>"); 
    }  
%>
