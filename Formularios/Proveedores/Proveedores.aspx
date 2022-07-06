<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Proveedores.ProveedoresABM" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>  
    <table style="width: 100%">
        <tbody>
            <tr>
                <td style="width: 90%">
                    <div class="form-group">
                        <label class="col-md-2">Lista de Proveedores:</label>
                        
                    </div>
                </td>
                <td style="width: 30%"></td>
                <td style="width: 10%">
                    <div class="col-md-1">
                        <div class="shortcuts">
                            <asp:Button ID="btnAgregar" CssClass="btn btn-success" Text="Agregar" runat="server" OnClick="btnAgregar_Click"  />                       
                        </div>
                    </div>
                </td>
            </tr>       
        </tbody>
    </table>
    <div>
    <asp:GridView ID="dgvProveedores" runat="server" DataKeyNames="Id" OnSelectedIndexChanged="dgvProveedores_SelectedIndexChanged" CssClass=" table table-dark table-bordered" AutoGenerateColumns="false">
        <Columns>
            <%--<asp:BoundField HeaderText="ID" DataField="Id"/>--%>
            <asp:BoundField HeaderText="Codigo" DataField="Codigo"/>
            <asp:BoundField HeaderText="Razon Social" DataField="RazonSocial"/>
            <asp:BoundField HeaderText="CUIT" DataField="Cuit" />
            <asp:BoundField HeaderText="Domicilio" DataField="Domicilio"/>
            <asp:BoundField HeaderText="Telefono" DataField="Telefono"/>
            <asp:BoundField HeaderText="Email" DataField="Email"/>
            <asp:TemplateField HeaderText="Accion" ItemStyle-Width="100" HeaderStyle-Width="100">
                <ItemTemplate>
                    <asp:LinkButton ID="btnModificar" runat="server" CssClass="btn btn-info" OnClick="btnModificar_Click">
                            <i class="fa-solid fa-pencil"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('Seguro desea eliminar este Proveedor?');" OnClick="btnEliminar_Click">
                            <i class="fa-solid fa-trash"></i>
            </asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>

    </asp:GridView>
       
    </div>

</asp:Content>