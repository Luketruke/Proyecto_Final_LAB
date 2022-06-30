<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Clientes.Clientes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <table style="width: 100%">
            <tbody>
                <tr>
                    <td style="width: 60%">
                        <div class="form-group">
                            <label style="font-size: 20px;" class="col-md-2">Herramientas</label>
                        </div>
                    </td>
                    <td style="width: 30%"></td>
                    <td style="width: 10%">
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
            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="75" HeaderStyle-Width="75">
                <ItemTemplate>
                    <asp:LinkButton ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-pencil"></i>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="btn btn-info">
                            <i class="fa-solid fa-trash"></i>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
