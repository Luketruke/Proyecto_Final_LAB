<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="MarcasABM.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Productos.MarcasABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<h2><%: Title %>Marcas</h2>--%>

    <table style="width: 100%">
        <tbody>
            <tr>
                <td style="width: 60%">
                    <div class="form-group">
                        <label class="col-md-2">Marca</label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtMarca" class="form-control" />
                        </div>
                    </div>
                </td>
                <td style="width: 30%"></td>
                <td style="width: 10%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:LinkButton ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success">
                            <i class="fa-solid fa-check"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnModificarOk" OnClick="btnModificarOk_Click" runat="server" CssClass="btn btn-success" Visible="false">
                            <i class="fa-solid fa-check"></i>
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
        <asp:GridView ID="dgvMarcas" runat="server" DataKeyNames="Id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="75" HeaderStyle-Width="75">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-pencil"></i>
                            </asp:LinkButton>
                        <asp:LinkButton ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-trash"></i>
                            </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>