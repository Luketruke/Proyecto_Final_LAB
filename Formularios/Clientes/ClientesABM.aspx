<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="ClientesABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.ClientesABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>Clientes</h2>

    <br />

    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Codigo</label>
                <asp:TextBox runat="server" ID="txtCodigo" class="form-control" disabled="" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtCodigo" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtNombres" class="form-label">Nombres</label>
                <asp:TextBox runat="server" ID="txtNombres" MaxLength="50" class="form-control" onkeypress="javascript:return SoloLetras(event)" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtNombres" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtApellidos" class="form-label">Apellidos</label>
                <asp:TextBox runat="server" ID="txtApellidos" MaxLength="50" class="form-control" onkeypress="javascript:return SoloLetras(event)" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtApellidos" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" ID="txtFechaNacimiento" TextMode="Date" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtFechaNacimiento" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtCuit" class="form-label">CUIT</label>
                <asp:TextBox runat="server" ID="txtCuit" class="form-control" MaxLength="15" onkeypress="javascript:return validarSoloNro(event)" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtCuit" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtTelefono" class="form-label">Telefono</label>
                <asp:TextBox runat="server" ID="txtTelefono" MaxLength="20" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtTelefono" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" MaxLength="60" placeholder="ejemplo@ejemplo.com" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="ValidarCliente" runat="server" CssClass="btn btn-success" Text="Agregar" />
                <asp:Button ID="btnModificar" OnClick="btnModificar_Click" ValidationGroup="ValidarCliente" runat="server" CssClass="btn btn-success" Text="Modificar" Visible="false" />
                <asp:Button ID="btnCancelar" runat="server" CausesValidation="false" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancelar_Click" />
            </div>
        </div>

        <div class="col-md-6">

            <div>
                <label for="ddlTipoCliente" class="form-label">Tipo Cliente</label>
                <asp:DropDownList ID="ddlTipoCliente" CssClass="form-select" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server" ControlToValidate="ddlTipoCliente"
                    ErrorMessage="*" ValidationGroup="ValidarCliente" InitialValue="Seleccione tipo..."></asp:RequiredFieldValidator>
                <br />
            </div>

            <div class="mb-3">
                <label for="txtDomicilio" class="form-label">Domicilio</label>
                <asp:TextBox runat="server" ID="txtDomicilio" MaxLength="100" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtDomicilio" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtLocalidad" class="form-label">Localidad</label>
                <asp:TextBox runat="server" ID="txtLocalidad" MaxLength="35" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtLocalidad" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtCodigoPostal" class="form-label">Codigo Postal</label>
                <asp:TextBox runat="server" ID="txtCodigoPostal" MaxLength="15" class="form-control" />
                <asp:RequiredFieldValidator Style="color: red; font-size: 15px" runat="server"
                    ControlToValidate="txtCodigoPostal" ErrorMessage="*" ValidationGroup="ValidarCliente"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label for="txtObservaciones" class="form-label">Observaciones Direccion</label>
                <asp:TextBox runat="server" ID="txtObservaciones" MaxLength="255" class="form-control" TextMode="MultiLine" Rows="8" />
            </div>
        </div>
    </div>

    <script>
        //valida los campos solo numeros
        function validarSoloNro(e) {
            var key;
            if (window.event) // IE
            {
                key = e.keyCode;
            }
            else if (e.which) // Netscape/Firefox/Opera
            {
                key = e.which;
            }

            if (key < 48 || key > 57) {
                return false;
            }
            else { return true; }
        }

        function SoloLetras(e) {
            return (/^[a-zA-Z ]*$/.test(e.key));
        }
    </script>

</asp:Content>
