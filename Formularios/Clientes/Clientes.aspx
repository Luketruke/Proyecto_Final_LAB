<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.Clientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:Title %>Clientes </h2>
    <h3>Clientela</h3>

    <asp:GridView runat="server" ID="dgvClientes" CssClass="table"></asp:GridView>
 
</asp:Content>