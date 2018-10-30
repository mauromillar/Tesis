<%@ Page Title="" Language="C#" MasterPageFile="~/Gerente.Master" AutoEventWireup="true" CodeBehind="Ger_Estado.aspx.cs" Inherits="Materiales.GerEstado1" MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Solicitudes Generales&nbsp; <o:p></o:p></span></b> 
        </center> 
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrilla" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
            <asp:BoundField DataField="CC" HeaderText="Centro de costo" SortExpression="CC" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="PrecioTotal" HeaderText="PrecioTotal" SortExpression="PrecioTotal" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-lg" Text="Detalle" Width="177px" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_Resumen] WHERE [id_Solicitud] = @id_Solicitud" InsertCommand="INSERT INTO [Solicitud_Resumen] ([Usuario], [CC], [Estado], [Fecha], [PrecioTotal]) VALUES (@Usuario, @CC, @Estado, @Fecha, @PrecioTotal)" SelectCommand="GrillaGerenteResumen" UpdateCommand="UPDATE [Solicitud_Resumen] SET [Usuario] = @Usuario, [CC] = @CC, [Estado] = @Estado, [Fecha] = @Fecha, [PrecioTotal] = @PrecioTotal WHERE [id_Solicitud] = @id_Solicitud" SelectCommandType="StoredProcedure">
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
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="CC" Type="String" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Fecha" Type="String" />
                <asp:Parameter Name="PrecioTotal" Type="String" />
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Tabla detalle&nbsp; <o:p></o:p></span></b> 
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceGrillaDetalle" AllowPaging="True" AllowSorting="True">
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
        <asp:SqlDataSource ID="SqlDataSourceGrillaDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_m] WHERE [id] = @id" InsertCommand="INSERT INTO [Solicitud_m] ([id_Solicitud], [codigo], [descripcionCC], [Usuario], [REFERENCIA], [DESCRIPCION], [Cantidad], [Estado], [Fecha_Ingreso], [Precio]) VALUES (@id_Solicitud, @codigo, @descripcionCC, @Usuario, @REFERENCIA, @DESCRIPCION, @Cantidad, @Estado, @Fecha_Ingreso, @Precio)" SelectCommand="GrillaMaterialesDetalleFinal" UpdateCommand="UPDATE [Solicitud_m] SET [id_Solicitud] = @id_Solicitud, [codigo] = @codigo, [descripcionCC] = @descripcionCC, [Usuario] = @Usuario, [REFERENCIA] = @REFERENCIA, [DESCRIPCION] = @DESCRIPCION, [Cantidad] = @Cantidad, [Estado] = @Estado, [Fecha_Ingreso] = @Fecha_Ingreso, [Precio] = @Precio WHERE [id] = @id" SelectCommandType="StoredProcedure">
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
                <asp:Parameter Name="Precio" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
                <asp:Parameter Name="codigo" Type="String" />
                <asp:Parameter Name="descripcionCC" Type="String" />
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="REFERENCIA" Type="String" />
                <asp:Parameter Name="DESCRIPCION" Type="String" />
                <asp:Parameter Name="Cantidad" Type="Int32" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Fecha_Ingreso" Type="String" />
                <asp:Parameter Name="Precio" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</asp:Content>
