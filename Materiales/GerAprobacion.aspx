<%@ Page Title="" Language="C#" MasterPageFile="~/Gerente.Master" AutoEventWireup="true" CodeBehind="GerAprobacion.aspx.cs" Inherits="Materiales.GerAprobacion" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
          <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Solicitudes para Aprobar<br />
              &nbsp;<br />

            <asp:Label ID="Lblcorreo" runat="server" CssClass="bold" ForeColor="Red"></asp:Label>
              <br />
              </span></b> 
        </center> 
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrilla" GridLines="Horizontal" OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" style="margin-right: 8px">
        <Columns>
            <asp:BoundField DataField="id_Solicitud" HeaderText="id_Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
            <asp:BoundField DataField="CC" HeaderText="CC" ReadOnly="True" SortExpression="CC" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSourceAprobacion" DataTextField="estados" DataValueField="estados" SelectedValue='<%# Bind("Estado") %>' AutoPostBack="True" ForeColor="White">                     
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSourceAprobacion" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT Estados FROM Estados WHERE (Estados = N'Pendiente') OR (Estados = N'Aprobado') OR (Estados = N'Rechazado')"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PrecioTotal" HeaderText="PrecioTotal" ReadOnly="True" SortExpression="PrecioTotal" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary btn-lg" Text="Actualizar" Width="177px" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary btn-lg" Text="Cancelar" Width="177px" />
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary btn-lg" Text="Aprobar" Width="177px" />
                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-lg" Text="Detalle" Width="177px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_Resumen] WHERE [id_Solicitud] = @id_Solicitud" InsertCommand="INSERT INTO [Solicitud_Resumen] ([Usuario], [CC], [Estado], [Fecha], [PrecioTotal]) VALUES (@Usuario, @CC, @Estado, @Fecha, @PrecioTotal)" SelectCommand="GrillaGerenteResumenPendiente" UpdateCommand="UPDATE [Solicitud_Resumen] SET [Estado] = @Estado WHERE [id_Solicitud] = @id_Solicitud" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="CC" Type="String" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Fecha" Type="String" />
                <asp:Parameter Name="PrecioTotal" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="user" SessionField="nom" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

         <b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Tabla de detalle      <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourcGrillaDetalle" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="id_Solicitud" ReadOnly="True" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="codigo" HeaderText="codigo" SortExpression="codigo" ReadOnly="True" />
                <asp:BoundField DataField="descripcionCC" HeaderText="descripcionCC" SortExpression="descripcionCC" ReadOnly="True" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" ReadOnly="True" />
                <asp:BoundField DataField="REFERENCIA" HeaderText="REFERENCIA" SortExpression="REFERENCIA" ReadOnly="True" />
                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" ReadOnly="True" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" ReadOnly="True" />
                <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha_Ingreso" SortExpression="Fecha_Ingreso" ReadOnly="True" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" ReadOnly="True" />
                <asp:BoundField DataField="Precio_Unitario" HeaderText="Precio_Unitario" SortExpression="Precio_Unitario" />
                <asp:BoundField DataField="Unidad_Trasnferencia" HeaderText="Unidad_Trasnferencia" SortExpression="Unidad_Trasnferencia" />
                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSourceRechazado" DataTextField="Estados" DataValueField="Estados" SelectedValue='<%# Bind("Estado") %>' >
                         
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSourceRechazado" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT Estados FROM Estados WHERE (Estados = N'Pendiente') OR (Estados = N'Rechazado')"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        &nbsp;
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary btn-lg" Text="Actualizar" Width="200px" Height="36px" />
                        <br />
                        <br />
                        &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary btn-lg" Text="Cancelar" Width="199px" />
                        <br />
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary btn-lg" Text="Rechazar detalle" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourcGrillaDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="GrillaMaterialesDetallePendienteAprobar" DeleteCommand="DELETE FROM [Solicitud_m] WHERE [id] = @id" InsertCommand="INSERT INTO [Solicitud_m] ([id_Solicitud], [codigo], [descripcionCC], [Usuario], [REFERENCIA], [DESCRIPCION], [Cantidad], [Estado], [Fecha_Ingreso], [Precio]) VALUES (@id_Solicitud, @codigo, @descripcionCC, @Usuario, @REFERENCIA, @DESCRIPCION, @Cantidad, @Estado, @Fecha_Ingreso, @Precio)" UpdateCommand="UPDATE [Solicitud_m] SET [Estado] = @Estado WHERE [id] = @id" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
                <asp:Parameter Name="codigo" Type="String" />
                <asp:Parameter Name="descripcionCC" Type="String" />
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="REFERENCIA" Type="String" />
                <asp:Parameter Name="DESCRIPCION" Type="String" />
                <asp:Parameter Name="Cantidad" Type="Int32" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Fecha_Ingreso" Type="String" />
                <asp:Parameter Name="Precio" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>   
                <center>

            <br />

          </center>
    </form>
    
</asp:Content>
