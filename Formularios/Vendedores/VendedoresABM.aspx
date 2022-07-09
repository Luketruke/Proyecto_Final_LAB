<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="VendedoresABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Vendedores.VendedoresABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Vendedores</h2>

    <br />

    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtCodigo" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtNombres" class="form-label">Nombres</label>
                <asp:TextBox runat="server" ID="txtNombres" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtNombres" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtApellidos" class="form-label">Apellidos</label>
                <asp:TextBox runat="server" ID="txtApellidos" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtApellidos" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtFechaAlta" class="form-label">Fecha de Alta</label>
                <asp:TextBox runat="server" ID="txtFechaAlta" TextMode="Date" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtFechaAlta" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar" />
                <asp:Button ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
            </div>
        </div>

        <div class="col-md-6">

            <div class="mb-3">
                <label for="txtTelefono" class="form-label">Telefono</label>
                <asp:TextBox runat="server" ID="txtTelefono" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" placeholder="ejemplo@ejemplo.com" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtPorcentajeVenta" class="form-label">Porcentaje X Venta</label>
                <asp:TextBox runat="server" ID="txtPorcentajeVenta" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"/>
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="txtPorcentajeVenta" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="ddlSucursales" class="form-label">Sucursal</label>
                <asp:DropDownList ID="ddlSucursales" CssClass="form-select" runat="server"></asp:DropDownList>
                <br />
            </div>

        </div>
    </div>

</asp:Content>
