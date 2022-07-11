<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Sucursales.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Vendedores.Sucursales" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%" class="table table-striped table-bordered">
        <tbody>
            <tr>
                <td style="width: 99%">
                    <div class="form-group">
                        <label style="font-size: 20px;" class="col-md-2">Sucursales</label>
                        <div class="col-md-6">
                        </div>
                    </div>
                </td>
                <td style="width: 1%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Agregar"/>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <br />
    <div class="col-md-12 col-xs-12">
        <asp:GridView ID="dgvSucursales" runat="server" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Sucursal" DataField="Nombre" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Direccion" DataField="DireccionCompleta" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="150" HeaderStyle-Width="150" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPuntosVenta" OnClick="btnPuntosVenta_Click" runat="server" CssClass="btn btn-info"  data-toggle="tooltip" ToolTip="Puntos de Venta">
                            <i class="fa-solid fa-plus"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info"  data-toggle="tooltip" ToolTip="Modificar">
                            <i class="fa-solid fa-pencil"></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Estas seguro de eliminar la sucursal?');"  data-toggle="tooltip" ToolTip="Eliminar">
                            <i class="fa-solid fa-trash"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

</asp:Content>