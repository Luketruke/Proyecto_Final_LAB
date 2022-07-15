<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ProductosABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.ProductosABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Productos</h2>

    <br />

    <div class="mb-3">
        <label for="txtCodigo" class="form-label">Codigo</label>
        <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled=""/>
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server"
            ControlToValidate="txtCodigo" ErrorMessage="*" ValidationGroup="ValidarProducto"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtDescripcion" class="form-label">Descripcion</label>
        <asp:TextBox runat="server" ID="txtDescripcion" class="form-control" MaxLength="50"/>
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" 
            ControlToValidate="txtDescripcion" ErrorMessage="*" ValidationGroup="ValidarProducto"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtPrecioVenta" class="form-label">Precio Venta</label>
        <asp:TextBox runat="server" ID="txtPrecioVenta" class="form-control" MaxLength="12"
            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" 
            ControlToValidate="txtPrecioVenta" ErrorMessage="*" ValidationGroup="ValidarProducto"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtCosto" class="form-label">Costo</label>
        <asp:TextBox runat="server" ID="txtCosto" class="form-control" MaxLength="12"
            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" 
            ControlToValidate="txtCosto" ErrorMessage="*" ValidationGroup="ValidarProducto"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtStockMinimo" class="form-label">Stock Minimo</label>
        <asp:TextBox runat="server" ID="txtStockMinimo" class="form-control" MaxLength="12"
            oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\--*)\-/g, '$1');"/>
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" 
            ControlToValidate="txtStockMinimo" ErrorMessage="*" ValidationGroup="ValidarProducto"></asp:RequiredFieldValidator>
    </div>

    <div>
        <label for="ddlCategoria" class="form-label">Categoria</label>
        <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="ddlCategoria" 
            ErrorMessage="*" ValidationGroup="ValidarProducto" InitialValue="Seleccione categoria..."></asp:RequiredFieldValidator>
        <br />
    </div>

    <div>
        <label for="ddlMarca" class="form-label">Marca</label>
        <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator style="color:red; font-size: 15px" runat="server" ControlToValidate="ddlMarca" 
            ErrorMessage="*" ValidationGroup="ValidarProducto" InitialValue="Seleccione marca..."></asp:RequiredFieldValidator>
        <br />
    </div>

    <div class="mb-3">
        <label for="txtObservaciones" class="form-label">Observaciones</label>
        <asp:TextBox runat="server" ID="txtObservaciones" class="form-control" TextMode="MultiLine" MaxLength="255"/>
    </div>

    <div class="mb-3">
        <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" ValidationGroup="ValidarProducto" CssClass="btn btn-success" Text="Agregar" />
        <asp:Button ID="btnModificar" OnClick="btnModificar_Click" runat="server" ValidationGroup="ValidarProducto" CssClass="btn btn-success" Text="Modificar" Visible="false"/>
        <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancelar_Click"/>
    </div>

</asp:Content>