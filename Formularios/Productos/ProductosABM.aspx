<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ProductosABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.ProductosABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Productos</h2>

    <br />

    <div class="mb-3">
        <label for="txtCodigo" class="form-label">Codigo</label>
        <asp:TextBox runat="server" ID="txtCodigo" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="txtDescripcion" class="form-label">Descripcion</label>
        <asp:TextBox runat="server" ID="txtDescripcion" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="txtPrecioVenta" class="form-label">Precio Venta</label>
        <asp:TextBox runat="server" ID="txtPrecioVenta" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="txtCosto" class="form-label">Costo</label>
        <asp:TextBox runat="server" ID="txtCosto" class="form-control" />
    </div>

    <div>
        <label for="ddlCategoria" class="form-label">Categoria</label>
        <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
        <br />
    </div>

    <div>
        <label for="ddlMarca" class="form-label">Marca</label>
        <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
        <br />
    </div>

    <div class="mb-3">
        <label for="txtObservaciones" class="form-label">Observaciones</label>
        <asp:TextBox runat="server" ID="txtObservaciones" class="form-control" TextMode="MultiLine" />
    </div>

    <div class="mb-3">
        <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" Text="Agregar" />
    </div>

</asp:Content>
