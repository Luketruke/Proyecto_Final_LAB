<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Vendedores.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Vendedores.Vendedores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <table style="width: 100%" class="table table-striped table-bordered">
            <tbody>
                <tr>
                    <td style="width: 90%">
                        <div class="form-group">
                            <label style="font-size: 20px;" class="col-md-2">Vendedores</label>
                        </div>
                    </td>
                    <td style="width: 1%">
                        <div class="col-md-1">
                            <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Nuevo vendedor" />
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <br />
    <br />

    <asp:GridView runat="server" ID="dgvVendedores" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Código" DataField="Codigo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Nombre Completo" DataField="NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
            <asp:BoundField HeaderText="Email" DataField="Email" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
            <asp:BoundField HeaderText="Sucursal" DataField="Sucursal.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100" HeaderStyle-Width="100" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Modificar">
                            <i class="fa-solid fa-pencil"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Estas seguro de eliminar el vendedor?');" data-toggle="tooltip" ToolTip="Eliminar">
                            <i class="fa-solid fa-trash"></i>
                    </asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

</asp:Content>
