<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="MarcasABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.MarcasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Marcas</h2>

    <div>
        <asp:GridView ID="dgvMarcas" runat="server" CssClass="table"></asp:GridView>
    </div>

</asp:Content>