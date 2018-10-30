<%@ Page Title="" Language="C#" MasterPageFile="~/Contabilidad.Master" AutoEventWireup="true" CodeBehind="ConEncompra.aspx.cs" Inherits="Materiales.WebForm1" MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
          Solicitudes para Retiro<br />
        <br />
        <asp:Label ID="lblestado" runat="server" ForeColor="Red"></asp:Label>
        </span></b></center>
         <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrillaEncompra" GridLines="Horizontal" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" InsertVisible="False" ReadOnly="True" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" ReadOnly="True" SortExpression="Usuario" />
                <asp:BoundField DataField="CC" HeaderText="Centro de costo" ReadOnly="True" SortExpression="CC" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
                <asp:BoundField DataField="PrecioTotal" HeaderText="PrecioTotal" ReadOnly="True" SortExpression="PrecioTotal" />
                <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSourceEnretiro" DataTextField="estados" DataValueField="estados" SelectedValue='<%# Bind("Estado") %>'>
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSourceEnretiro" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT estados FROM Estados WHERE (estados = N'En Compra') OR
                         (estados = N'Para Retirar')"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-primary btn-lg" Text="Para Retirar" Width="177px" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary btn-lg" Text="Cancelar" Width="177px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary btn-lg" Text="En Compra" Width="177px" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrillaEncompra" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_Resumen] WHERE [id_Solicitud] = @id_Solicitud" InsertCommand="INSERT INTO [Solicitud_Resumen] ([Usuario], [CC], [Estado], [Fecha], [PrecioTotal]) VALUES (@Usuario, @CC, @Estado, @Fecha, @PrecioTotal)" SelectCommand="SELECT * FROM [Solicitud_Resumen] WHERE (Estado = N'En Compra')" UpdateCommand="UPDATE [Solicitud_Resumen] SET [Estado] = @Estado WHERE [id_Solicitud] = @id_Solicitud">
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
                <asp:Parameter Name="Usuario" Type="String" />
                <asp:Parameter Name="CC" Type="String" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="Fecha" Type="String" />
                <asp:Parameter Name="PrecioTotal" Type="String" />
                <asp:Parameter Name="id_Solicitud" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <center>

            <br />

          </center>
         <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
          <br />
             </span><span style="font-size: 11pt">En Retiro</span></b></center>
         <br />
        <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="id_Solicitud" DataSourceID="SqlDataSourceGrillaEnretiro">
            <Columns>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" ReadOnly="True" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="nombre" HeaderText="Gerente Acargo" SortExpression="nombre" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="CC" HeaderText="Centro de costo" SortExpression="CC" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                <asp:BoundField DataField="PrecioTotal" HeaderText="PrecioTotal" SortExpression="PrecioTotal" />
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
        <asp:SqlDataSource ID="SqlDataSourceGrillaEnretiro" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT * FROM [GrillaEncompra]"></asp:SqlDataSource>
    </form>
</asp:Content>
