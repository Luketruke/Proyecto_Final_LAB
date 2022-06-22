<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Productos</h2>

    <asp:GridView ID="dgvProductos" runat="server" CssClass="table"></asp:GridView>

</asp:Content>