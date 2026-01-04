cat > /was1/apache/webapps/ROOT/db.jsp <<'EOF'
<%@ page import="java.sql.*" %>
<%
    String url  = "jdbc:mariadb://192.168.12.11:3306/DB1";
    String user = "testuser";
    String pass = "1234";

    out.println("URL=" + url + "<br>");
    out.println("USER=" + user + "<br><hr>");

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        Connection conn = java.sql.DriverManager.getConnection(url, user, pass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT msg FROM TT LIMIT 1");

        if (rs.next()) out.println("RESULT=" + rs.getString(1));
        else out.println("NO DATA");

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
    }
%>
EOF
