<%@ page import="java.io.InputStream" %>
<%@ page import="com.WareTech.ClubTech.service.BasicSecurityService" %>
<%@ page import="com.WareTech.ClubTech.entity.Member" %>
<%@ page import="com.WareTech.ClubTech.Database" %>
<%@ page import="com.WareTech.ClubTech.entity.Parameter" %>

<%
out.println("<br>");
out.println("Starting MembersLoad process..");

out.println("<br>");
out.println("Starting MembersLoad process..");

InputStream inputStream = BasicSecurityService.class.getResourceAsStream("/cuotas.csv");
out.println("<br>");
out.println(inputStream);
byte[] dataByte = new byte[inputStream.available()];
inputStream.read(dataByte);
inputStream.close();

String dataString = new String(dataByte);
String[] lines = dataString.split("\n");

if (lines.length == 0)
{
    return;
}

String[] memberLine;
Member member;

for(String line : lines)
{
    out.println("<br>");
    out.println(line);
    try
    {
        if (line.length() == 0) {
            continue;
        }

        line = line.trim();

        if (line.startsWith("#")) {
            continue;
        }

        memberLine = line.split(",");

        member = new Member();

        if ("Femenino".equals(memberLine[0])) {
            member.setActivity((Parameter) Database.getCurrentSession().get(Parameter.class, 320l));
        } else if ("Masc Infantiles".equals(memberLine[0])) {
            member.setActivity((Parameter) Database.getCurrentSession().get(Parameter.class, 380l));
        } else if ("Masc juveniles".equals(memberLine[0]) || "listado".equals(memberLine[0])) {
            member.setActivity((Parameter) Database.getCurrentSession().get(Parameter.class, 370l));
        } else if ("Masc mayores".equals(memberLine[0])) {
            member.setActivity((Parameter) Database.getCurrentSession().get(Parameter.class, 360l));
        }

        member.setPaymentType((Parameter) Database.getCurrentSession().get(Parameter.class, 101l));
        member.setDiscount((Parameter) Database.getCurrentSession().get(Parameter.class, 201l));
        member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 402l));

        member.setFirstname(memberLine[2]);
        member.setLastname(memberLine[3]);

        if (memberLine.length < 5)
        {
            Database.getCurrentSession().save(member);
            continue;
        }

        if (memberLine[4] != null && memberLine[4].trim().length() > 0) {
            member.setDni(memberLine[4].trim());
        }

        if (memberLine.length < 6)
        {
            Database.getCurrentSession().save(member);
            continue;
        }

        if (memberLine[5] != null && memberLine[5].trim().length() > 0) {
            member.setBirthday(memberLine[5]);
        }

        if (memberLine.length < 7)
        {
            Database.getCurrentSession().save(member);
            continue;
        }

        if ("fichado".equals(memberLine[6])) {
            member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 401l));
        } else if ("agregado".equals(memberLine[6])) {
            member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 404l));
        } else if ("en listado".equals(memberLine[6]) || "listado".equals(memberLine[6])) {
            member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 402l));
        } else if ("escuelita".equals(memberLine[6])) {
            member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 406l));
        } else if ("PRE-INSCRIPCION".equals(memberLine[6])) {
            member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 405l));
        } else if ("HABILITADO".equals(memberLine[6])) {
            member.setStatus((Parameter) Database.getCurrentSession().get(Parameter.class, 403l));
        }

        if (memberLine.length < 8)
        {
            Database.getCurrentSession().save(member);
            continue;
        }
        if (memberLine[7] != null && memberLine[7].trim().length() > 0) {
            member.setNote(memberLine[7].trim());
        }

        if (memberLine.length < 9)
        {
            Database.getCurrentSession().save(member);
            continue;
        }
        if (memberLine[8] != null && memberLine[8].trim().length() > 0) {
            if (member.getNote() == null)
            {
                member.setNote(memberLine[8].trim());
            }
            else
            {
                member.setNote(
                    member.getNote() + "\n" + memberLine[8].trim()
                    );
            }
        }

        if (memberLine.length < 10)
        {
            Database.getCurrentSession().save(member);
            continue;
        }
        if (memberLine[9] != null && memberLine[9].trim().length() > 0) {
            if (member.getNote() == null)
            {
                member.setNote(memberLine[9].trim());
            }
            else
            {
                member.setNote(
                    member.getNote() + "\n" + memberLine[9].trim()
                );
            }
        }

        Database.getCurrentSession().save(member);
    }
    catch (Exception exception)
    {
        System.out.println("ERROR: " + line);
        exception.printStackTrace();
    }
}

out.println("<br>");
out.println("...END!");
%>