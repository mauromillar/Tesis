<%@ Page Title="" Language="C#" MasterPageFile="~/Solicitante.Master" AutoEventWireup="true" CodeBehind="SolEstado.aspx.cs" Inherits="Materiales.SolEstado" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Solicitudes Pendientes</span></b><br />
        <br /></center>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrilla1" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
            <asp:BoundField DataField="CC" HeaderText="Centro de costo" SortExpression="CC" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-primary btn-lg" Text="Eliminar" Width="177px"/>
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
        <asp:SqlDataSource ID="SqlDataSourceGrilla1" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_Resumen] WHERE [id_Solicitud] = @id_Solicitud" InsertCommand="INSERT INTO [Solicitud_Resumen] ([Usuario], [CC], [Estado], [Fecha], [PrecioTotal]) VALUES (@Usuario, @CC, @Estado, @Fecha, @PrecioTotal)" SelectCommand="GrillaMaterialesDetallePendiente" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [Solicitud_Resumen] SET [Usuario] = @Usuario, [CC] = @CC, [Estado] = @Estado, [Fecha] = @Fecha, [PrecioTotal] = @PrecioTotal WHERE [id_Solicitud] = @id_Solicitud">
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
          Tabla de detalle</span></b><br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceGrilla2" GridLines="Horizontal" AllowPaging="True" AllowSorting="True">
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
                <asp:BoundField DataField="Unidad_Trasnferencia" HeaderText="Unidad Trasnferencia" SortExpression="Unidad_Trasnferencia" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrilla2" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="GrillaMaterialesDetalleFinal" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
            Solicitudes en Proceso</span></b><br />
        <br /></center>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSource3" GridLines="Horizontal" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="CC" HeaderText="Centro de costo" SortExpression="CC" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-lg" Text="Detalle" Width="146px" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="GrillaMaterialesDetalleFinalUsu" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="usuario" SessionField="nom" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         <b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Tabla de detalle</span></b><br />
        <br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceGrilla4" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="codigo" HeaderText="Codigo" SortExpression="codigo" />
                <asp:BoundField DataField="descripcionCC" HeaderText="descripcionCC" SortExpression="descripcionCC" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="REFERENCIA" HeaderText="REFERENCIA" SortExpression="REFERENCIA" />
                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrilla4" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="GrillaMaterialesDetalleFinal" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
