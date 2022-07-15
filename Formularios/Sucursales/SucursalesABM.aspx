<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="SucursalesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Sucursales.SucursalesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Sucursales</h2>
    <br />
    <div class="mb-3">
        <label for="txtNombre" class="form-label">Nombre</label>
        <asp:TextBox runat="server" ID="txtNombre" MaxLength="50" class="form-control" />
        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" 
            ControlToValidate="txtNombre" ErrorMessage="*" ValidationGroup="ValidarSucursal"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtDireccion" class="form-label">Direccion</label>
        <asp:TextBox runat="server" ID="txtDireccion" MaxLength="50" class="form-control" />
        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" 
            ControlToValidate="txtDireccion" ErrorMessage="*" ValidationGroup="ValidarSucursal"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtLocalidad" class="form-label">Localidad</label>
        <asp:TextBox runat="server" ID="txtLocalidad" MaxLength="35" class="form-control" />
        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" 
            ControlToValidate="txtLocalidad" ErrorMessage="*" ValidationGroup="ValidarSucursal"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <label for="txtCodigoPostal" class="form-label">Codigo Postal</label>
        <asp:TextBox runat="server" ID="txtCodigoPostal" MaxLength="15" class="form-control" />
        <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" 
            ControlToValidate="txtCodigoPostal" ErrorMessage="*" ValidationGroup="ValidarSucursal"></asp:RequiredFieldValidator>
    </div>

    <div class="mb-3">
        <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarSucursal" runat="server" CssClass="btn btn-success" Text="Agregar" />
        <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarSucursal" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
        <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancelar_Click" />
    </div>

</asp:Content>
