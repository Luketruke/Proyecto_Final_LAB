<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompraProveedores.aspx.cs" Inherits="Proyecto_Final_LAB.Formularios.Proveedores.CompraProveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link rel="stylesheet" href="../../Content/Varios.css" />


        <ContentTemplate>
            <div class="col-md-12 " style="padding: 0px;">
                <table class="table table-primary table-bordered ">
                    <thead>
                        <tr>
                            <th class="bg-info">Carga Compra</th>
                            <th class="bg-info">Fecha Emisión</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 40%">
                                <div class="form-group">
                                    <div>
                                        <div class="form-group">
                                             <asp:Label ID="lblRazon" runat="server" Text=" RAZON SOCIAL:" ></asp:Label>
                                        <asp:DropDownList ID="ddlProveedores" runat="server" Height="35px" Width="200px" CssClass="form-select" 
                                            OnSelectedIndexChanged="ddlProveedores_SelectedIndexChanged"></asp:DropDownList>  
                                        </div>
                           
                                        <div class="form-group">
                                         <asp:Label ID="lblProducto" runat="server" Text="PRODUCTO:"></asp:Label>
                                        <asp:DropDownList ID="ddlProductos" runat="server" Height="35px" Width="200px" CssClass="form-select"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                         <asp:Label ID="Lbl" runat="server" Text="Cantidad: "></asp:Label>
                                        <asp:TextBox ID="TxtCantidad" runat="server"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                         <asp:Label ID="lblPrecio" runat="server" Text="PrecioxU:"></asp:Label>
                                        <asp:TextBox ID="TxtPrecio" runat="server"></asp:TextBox>
                                        </div>
                                      
                                   </div> 
                                </div>
                             
                            </td>
                            <td style="width: 60%">
                                <div class="form-group">
                                    <div >
                                        <asp:TextBox runat="server" ID="txtFechaTicket" TextMode="Date" class="form-control" />
                                        <br />
                                        <div class="form-group" style="text-align: left">
                                            <asp:Label ID="Label1" runat="server" Text="OBSERVACIONES:"></asp:Label>
                                    <asp:TextBox runat="server" ID="txtObservaciones" class="form-control" TextMode="MultiLine" Rows="5" />
                                    </div>
                                    </div>
                                    
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>

</asp:Content>
