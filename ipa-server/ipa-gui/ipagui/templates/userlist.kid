<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'userlayout.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>Find People</title>
</head>
<body>
    <h2>Find People</h2>
    <div id="search">
        <form action="${tg.url('/userlist')}" method="post">
            Search:
            <input id="uid" type="text" name="uid" value="${uid}" />
            <input type="submit" />
        </form>
        <script type="text/javascript">
            document.getElementById("uid").focus();
        </script>
    </div>
    <div py:if='users != None'>
        <h2>${len(users)} results returned:</h2>
        <table id="resultstable" py:if='len(users) > 0'>
            <tr>
                <th>
                    <label class="fieldlabel" py:content="fields.uid.label" />
                </th>
                <th>
                    Name
                </th>
                <th>
                    Phone
                </th>
                <th>
                    Unit
                </th>
                <th>
                    Title
                </th>
                <th>
                    License Plate
                </th>
            </tr>
            <tr py:for="user in users">
                <td>
                    <a href="${tg.url('/usershow',uid=user.uid)}">${user.uid}</a>
                </td>
                <td>
                    ${user.givenName} ${user.sn}
                </td>
                <td>
                    ${user.telephoneNumber}
                </td>
                <td>
                    ${user.ou}
                </td>
                <td>
                    ${user.title}
                </td>
                <td>
                    ${user.carLicense}
                </td>
            </tr>
        </table>
        <div py:if='len(users) == 0'>
            No results found.
        </div>
    </div>
</body>
</html>
