<%@ Page Title="" Language="C#" MasterPageFile="~/Contabilidad.Master" AutoEventWireup="true" CodeBehind="ConAprobadas.aspx.cs" Inherits="Materiales.ConAprobadas" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
          <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Proceso Para Compra</span></b></center>
         <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrilla" GridLines="Horizontal" OnRowUpdating="GridView1_RowUpdating" style="margin-top: 0px">
        <Columns>
            <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
            <asp:BoundField DataField="CC" HeaderText="CC" ReadOnly="True" SortExpression="CC" />
            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSourceAprobar" DataTextField="estados" DataValueField="estados" SelectedValue='<%# Bind("Estado") %>' AutoPostBack="True">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSourceAprobar" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT estados FROM Estados WHERE (estados = N'En Compra') OR
                         (estados = N'Aprobado')"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
            <asp:BoundField DataField="PrecioTotal" HeaderText="PrecioTotal" ReadOnly="True" SortExpression="PrecioTotal" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-lg" Width="177px" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-primary btn-lg" Width="177px"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary btn-lg" Text="En Compra" Width="177px"  />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-lg" Text="Detalle" Width="177px" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_Resumen] WHERE [id_Solicitud] = @id_Solicitud" InsertCommand="INSERT INTO [Solicitud_Resumen] ([Usuario], [CC], [Estado], [Fecha], [PrecioTotal]) VALUES (@Usuario, @CC, @Estado, @Fecha, @PrecioTotal)" SelectCommand="SELECT * FROM [Solicitud_Resumen] WHERE  (Estado = N'Aprobado')" UpdateCommand="UPDATE [Solicitud_Resumen] SET [Estado] = @Estado WHERE [id_Solicitud] = @id_Solicitud">
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
            <UpdateParameters>
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
         <b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Tabla de detalle <o:p></o:p></span></b> 
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourcGrillaDetalle" GridLines="Horizontal" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="codigo" HeaderText="Centro de costo" SortExpression="codigo" />
                <asp:BoundField DataField="descripcionCC" HeaderText="Descripcion CC" SortExpression="descripcionCC" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="REFERENCIA" HeaderText="REFERENCIA" SortExpression="REFERENCIA" />
                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                <asp:BoundField DataField="Precio_Unitario" HeaderText="Precio Unitario" SortExpression="Precio_Unitario" />
                <asp:BoundField DataField="Unidad_Trasnferencia" HeaderText="Unidad_Trasnferencia" SortExpression="Unidad_Trasnferencia" />
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
        <asp:SqlDataSource ID="SqlDataSourcGrillaDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="GrillaMaterialesDetalleFinal" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
