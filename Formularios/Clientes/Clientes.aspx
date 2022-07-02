<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.Clientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <table style="width: 100%" class="table table-striped table-bordered">
            <tbody>
                <tr>
                    <td style="width: 90%">
                        <div class="form-group">
                            <label style="font-size: 20px;" class="col-md-2">Herramientas</label>
                        </div>
                    </td>
                    <td style="width: 1%">
                        <div class="col-md-1">
                            <asp:LinkButton runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-success">
                            <i style="font-size: 15px;">Agregar</i>
                            </asp:LinkButton>
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <br />
    <br />

    <asp:GridView runat="server" ID="dgvClientes" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Código" DataField="Codigo" />
            <asp:BoundField HeaderText="NombreCompleto" DataField="NombreCompleto" />
            <asp:BoundField HeaderText="CUIT" DataField="Cuit" />
            <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
            <asp:BoundField HeaderText="Mail" DataField="Email" />
            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100" HeaderStyle-Width="100">
                <ItemTemplate>
                    <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-pencil"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Estas seguro de eliminar el cliente?');">
                            <i class="fa-solid fa-trash"></i>
                    </asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
