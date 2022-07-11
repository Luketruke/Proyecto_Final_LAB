<%@ Page Language="C#" MasterPageFile="../../Site.Master" AutoEventWireup="true" CodeBehind="Facturas.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Facturacion.Facturas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
                            <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" runat="server" CssClass="btn btn-success" Text="Nueva factura" />
                        </div>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <br />
    <br />

    <div class="col-md-12 col-xs-12">
        <asp:GridView ID="dgvFacturas" runat="server" DataKeyNames="Id" CssClass="table table-dark table-hover" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Fecha" DataField="Fecha" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Numero" DataField="NumeroFactura" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Documento" DataField="TipoDocumento.Tipo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Cliente" DataField="Cliente.NombreCompleto" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="SubTotal" DataField="Subtotal" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Descuento" DataField="Descuento" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:BoundField HeaderText="Total" DataField="Total" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                <asp:TemplateField HeaderText="Accion" ItemStyle-Width="70" HeaderStyle-Width="70" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnFactura" runat="server" OnClick="btnFactura_Click" CssClass="btn btn-info" data-toggle="tooltip" ToolTip="Ver factura" OnClientClick="openInNewTab();">
                            <i class="fa-solid fa-search"></i>
                        </asp:LinkButton>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <rsweb:ReportViewer ID="FacturaRA" runat="server" Visible="false"></rsweb:ReportViewer>
    <rsweb:ReportViewer ID="FacturaRB" runat="server" Visible="false"></rsweb:ReportViewer>
    <%--<asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>--%>

    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    <script type="text/javascript">
        function openInNewTab() {
            window.document.forms[0].target = '_blank';
            setTimeout(function () { window.document.forms[0].target = ''; })
        }
    </script>

</asp:Content>
