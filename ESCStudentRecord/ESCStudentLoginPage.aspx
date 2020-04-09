<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ESCStudentLoginPage.aspx.cs" Inherits="ESCStudentRecord.ESCStudentLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
    <title>ESCStudentLoginPage</title>
    <style type="text/css">
        .auto-style1 {
            width: 272px;
        }
    </style>
</head>
    <body class="container">
       <form runat="server" style="margin-left:250px; margin-bottom:100px;">
            <table>
                <tbody>
                    <tr>
                        <td class="auto-style1">
                            <asp:HyperLink runat="server" NavigateUrl="~/ESCStudentRegistrationPage.aspx">Don't have an account?, Register here!</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><label>Matric Number</label></td>
                        <td><input runat="server" type="text" id="txtmatricNumber" name="" placeholder="Enter Matric Number"/></td>
                    </tr>
                
                    <tr>
                        <td class="auto-style1"><label>Password</label></td>
                        <td><input runat="server" type="password" id="txtPassword" name="" placeholder="Enter Password"/></td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td><div class="container">
                    <%--<Button type="button" class="bg-danger text-white" style="line-height: 2em; margin-left:100px; border-radius:5px;">LOGIN</Button>--%>
                    <asp:Button runat="server" class="bg-danger text-white" style="line-height: 2em; border-radius:5px;" Text="LOGIN" OnClick="login_Click"></asp:Button>
                </div></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pannelerrorMessage" runat="server">
                                <asp:Label ID="lblerrormessage" runat="server" Text="ErrorMessage"></asp:Label>
                            </asp:Panel>
                            
                        </td>
                    </tr>
                </tbody>
            </table>
            
    </form>
</body>
</html>
