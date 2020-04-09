<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ESCStudentRegistrationPage.aspx.cs" Inherits="ESCStudentRecord.ESCStudentRegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
    <title>ESC Students' Record System</title>
	<meta charset="utf-8" />
</head>
<body style="background-image: url(/images/NMGSlogo.jpg); background-position:center; background-repeat:no-repeat;">
    <header>
        <nav class="navbar navbar-transparent bg-dark navbar-expand-sm">
            <div class="container">
                <div class="navbar-brand font-weight-bold font-italic text-danger" style="font-size: 1em;">ESC Student Registration Form</div>
                <div class="navbar-nav font-weight-bold">
                    <a class="nav-link nav-item active text-danger" href="#">Home</a>
                    <a class="nav-link nav-item text-danger" href="ESCStudentRegistrationPage.aspx">Register</a>
                    <a class="nav-link nav-item text-danger" href="ESCStudentLoginPage.aspx">Login</a>
                    <a class="nav-link nav-item text-danger" href="#"></a>
                </div>
            </div>
      </nav>
    </header>

    <form id="form1" runat="server">
        <asp:HyperLink runat="server" NavigateUrl="~/ESCStudentLoginPage.aspx">Already have an account?, Login here.</asp:HyperLink>
        <table>
            <tbody>
                <tr>
                    <td><label for="">Surname</label></td>
                    <td><input type="text" id="surname" runat="server" name="surname" placeholder="Enter Surname"/></td>
                </tr>

                <tr>
                    <td><label for="">First Name</label></td>
                    <td><input type="text" id="firstName" runat="server" name="firstName" placeholder="Enter First Name"/></td>
                </tr>

                <tr>
                    <td><label for="">Other Name</label></td>
                    <td><input type="text" id="otherName" runat="server" name="otherName" placeholder="Enter Other Name"/></td>
                </tr>

                <tr>
                    <td><label for="">Email</label></td>
                    <td><input type="email" id="email" runat="server" name="email" placeholder="Enter Email"/></td>
                </tr>

                <tr>
                    <td><label for="">Date Of Birth</label></td>
                    <td><input type="date" id="dateofBirth" runat="server" name="DOB"/></td>
                </tr>

                <tr>
                    <td><label for="">Telephone</label></td>
                    <td><input type="text" id="telephone" runat="server" name="telephone" placeholder="Enter Telephone Number"/></td>
                </tr>

                <tr>
                    <td><label for="">Matric Number</label></td>
                    <td><input type="text" id="matricNumber" runat="server" name="matricNumber" placeholder="Enter Matric Number"/></td>
                </tr>

                <tr>
                    <td><label for="">Password</label></td>
                    <td><input type="password" id="password" runat="server" name="password" placeholder="Enter Password"/></td>
                </tr>

                <tr>
                    <td><label for="">Current Level</label></td>
                    <td><input type="text" id="currentLevel" runat="server" name="level" placeholder="Enter Current Level"/></td>
                </tr>

                <tr>
                    <td><label for="">Current CGPA</label></td>
                    <td><input type="text" id="currentCGPA" runat="server" name="CGPA" placeholder="Enter Current CGPA"/></td>
                </tr>

                <tr>
                    <td><label>Degree Option</label></td>
                   <%-- <td><input type="radio" id="AGY" runat="server" name="option"/><label for="">AGY</label></td>
                    <td><input type="radio" id="AGP" runat="server" name="option"/><label for="">AGP</label></td>--%>

                    <td><asp:RadioButtonList ID="rbtnDegreeOption" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem>AGY</asp:ListItem>
                        <asp:ListItem>AGP</asp:ListItem>
                    </asp:RadioButtonList></td>
                </tr>

               <%-- <tr>
                    <td><label style="padding-left:6.5em;"></label></td>
                    <td><input type="radio" id="AGP" runat="server" name="option"/><label for="">AGP</label></td>

                </tr>--%>

                <%--<tr>
                    <td><label>Organization EXCOS</label></td>
                    <td>
                        <select name="organization Excos" id="organizationEXCOS" runat="server">
                            <optgroup label="NMGS">
                                <option value="">President</option>
                                <option value="">Vice President</option>
                                <option value="">Fin. Sec</option>
                                <option value="">AGS</option>
                                <option value="">Gen. Sec</option>
                                <option value="">Sport Director</option>
                                <option value="">P.R.O</option>
                            </optgroup>
                            <optgroup label="NAPE">
                                <option value="">President</option>
                                <option value="">Vice President</option>
                                <option value="">Gen Sec</option>
                            </optgroup>

                        </select>
                    </td>
                </tr>--%>
            </tbody>

        </table>
        <asp:Panel id="successmessagePannel" runat="server">
            <asp:Label ID="lblSuccessMessage" runat="server" Text="lblsuccessmessage"></asp:Label>
         </asp:Panel>

                <br />
        <asp:Panel ID="errormessagePanel" runat="server">
             <asp:Label ID="lblErrorMessage" runat="server" Text="lblerrormessage"></asp:Label>
        </asp:Panel>
               
                <br />
       
                
                <div class="container">
                    <%--<Button type="button" class="bg-danger rounded text-white" style="line-height: 2em; margin-left:400px;">REGISTER</Button>--%>
                    <asp:Button ID="btnReg" class="bg-danger rounded text-white" style="line-height: 2em; margin-left:400px;" runat="server" Text="REGISTER" OnClick="btnReg_Click" />
                    <asp:Button ID="btnClear" class="bg-danger rounded text-white" style="line-height: 2em;" runat="server" Text="CLEAR" OnClick="btnClear_Click"/>
                </div>
    </form>
    <nav class="navbar navbar-dark bg-dark navbar-expand-sm">
        <div class="container">
         <div class="mx-auto font-weight-bold" style="font-size: 1.5em; color: white;">&copy; 2019 Earth Sciences, Designed by <a href="#">GeoCoder</a></div>
            
        </div>
    </nav>
</body>
</html>
