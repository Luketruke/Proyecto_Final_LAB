<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ClientesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.ClientesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>Clientes</h2>
    <h3>Clientela</h3>
    <p>Gestion de clientes</p>

    <asp:label ID="lblCliente" runat="server" Text="Cliente: "></asp:label>
    <asp:TextBox ID="txtCliente" runat="server" CssClass="auto-style2"></asp:TextBox>
    
</asp:Content>