<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="CategoriasABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.CategoriasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<h2><%: Title %>Categorias</h2>--%>

    <table style="width: 100%" class="table table-striped table-bordered">
        <tbody>
            <tr>
                <td style="width: 99%">
                    <div class="form-group">
                        <label style="font-size: 20px;" class="col-md-2">Categoria</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtCategoria" class="form-control" style="min-width: 800px; height: 30px"/>
                        </div>
                    </div>
                </td>
                <td style="width: 1%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success">
                            <i style="font-size: 15px;">Agregar</i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnModificarOk" OnClick="btnModificarOk_Click" runat="server" CssClass="btn btn-success" Visible="false">
                            <i style="font-size: 15px;">Modificar</i>
                            </asp:LinkButton>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <br />
    <div class="col-md-12 col-xs-12">
        <asp:GridView ID="dgvCategorias" runat="server" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100" HeaderStyle-Width="100">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-pencil"></i>
                            </asp:LinkButton>
                        <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Estas seguro de eliminar la categoria?');">
                            <i class="fa-solid fa-trash"></i>
                            </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
