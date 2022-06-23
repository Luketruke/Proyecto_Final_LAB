<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="CategoriasABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.CategoriasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Categorias</h2>

    <div>
        <asp:GridView ID="dgvCategorias" runat="server" CssClass="table"></asp:GridView>
    </div>

</asp:Content>