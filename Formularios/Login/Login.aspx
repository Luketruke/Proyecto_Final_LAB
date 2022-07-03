<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_Final_LAB.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="col-md-6">
        <div class="mb-3">
            <label class="form-label">User</label>
            <asp:TextBox runat="server" id="txtUser" placeholder="user name" CssClass="form-control"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <asp:TextBox runat="server" placeholder="*****" id="txtPassword" CssClass="form-control" TextMode="Password"/>
       </div>      
        <asp:Button ID="btnLogin" CssClass="btn btn-success" runat="server" Text="Login" OnClick="btnLogin_Click " />
       </div>
    <div class="col-md-6">      
         <div class="mb-3">
             <br />
             <br />
             <br />
             <br />
             <br />
             <br />
             <br />
         </div>
        <%  if ( Session["USUARIO"] != null && ((dominios.Usuario)Session["USUARIO"]).idTipoUsuario == dominios.TipoUsuer.Admin) 
            { %>
             <i class="fas fa-walking"></i>
             <asp:LinkButton ID="btnDesloguear" runat="server" CssClass="btn btn-danger" OnClick="btnDesloguear_Click">
            <i style="font-size: 15px;">Desloguearme</i>
             </asp:LinkButton>
        <%}%>
  
    </div>



</asp:Content>
