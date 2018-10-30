<%@ Page Title="" Language="C#" MasterPageFile="~/Contabilidad.Master" AutoEventWireup="true" CodeBehind="ConEstado.aspx.cs" Inherits="Materiales.ConEstado" MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
            Resumen General <o:p>
            <br />
            </o:p></span></b> 
        <br /></center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrilla" GridLines="Horizontal" AllowPaging="True" AllowSorting="True" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
            <asp:BoundField DataField="CC" HeaderText="CC" SortExpression="CC" />
            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSourceEstado" DataTextField="estados" DataValueField="estados" SelectedValue='<%# Bind("Estado") %>'>
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSourceEstado" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT        estados
FROM            dbo.Estados
WHERE        (estados = N'Aprobado') OR
                         (estados = N'En Compra') OR
                         (estados = N'Para Retirar')"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
     
        <asp:SqlDataSource ID="SqlDataSourceGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT * FROM [Solicitud_Resumen]
WHERE        (PrecioTotal &lt;&gt; N'0')">
        </asp:SqlDataSource>
        <b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Tabla de detalle <o:p></o:p></span></b> 
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceGrillaDetalle" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="codigo" HeaderText="Centro de costo" SortExpression="codigo" />
                <asp:BoundField DataField="descripcionCC" HeaderText="descripcionCC" SortExpression="descripcionCC" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrillaDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="GrillaMaterialesDetalleFinal" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <center><a href="Excel/Materiales.xlsx">Exportar Excel</a></center>
    </form>
     
    </asp:Content>