<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="VendedoresABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Vendedores.VendedoresABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Vendedores</h2>

    <br />

    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtCodigo" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtNombres" class="form-label">Nombres</label>
                <asp:TextBox runat="server" ID="txtNombres" MaxLength="50" class="form-control" onkeypress="javascript:return SoloLetras(event)" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtNombres" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtApellidos" class="form-label">Apellidos</label>
                <asp:TextBox runat="server" ID="txtApellidos" MaxLength="50" class="form-control" onkeypress="javascript:return SoloLetras(event)" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtApellidos" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtFechaAlta" class="form-label">Fecha de Alta</label>
                <asp:TextBox runat="server" ID="txtFechaAlta" TextMode="Date" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtFechaAlta" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarVendedor" runat="server" CssClass="btn btn-success" Text="Agregar" />
                <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarVendedor" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancelar_Click" />
            </div>
        </div>

        <div class="col-md-6">

            <div class="mb-3">
                <label for="txtTelefono" class="form-label">Telefono</label>
                <asp:TextBox runat="server" ID="txtTelefono" MaxLength="20" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtTelefono" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" MaxLength="60" placeholder="ejemplo@ejemplo.com" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtPorcentajeVenta" class="form-label">Porcentaje X Venta</label>
                <asp:TextBox runat="server" ID="txtPorcentajeVenta" MaxLength="5" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtPorcentajeVenta" ErrorMessage="*" ValidationGroup="ValidarVendedor"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label for="ddlSucursales" class="form-label">Sucursal</label>
                <asp:DropDownList ID="ddlSucursales" CssClass="form-select" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlSucursales"
                    ErrorMessage="*" ValidationGroup="ValidarVendedor" InitialValue="Seleccione sucursal..."></asp:RequiredFieldValidator>
                <br />
            </div>

        </div>
    </div>

    <script>
        function SoloLetras(e) {
            return (/^[a-zA-Z ]*$/.test(e.key));
        }
    </script>

</asp:Content>
