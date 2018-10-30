<%@ Page Title="" Language="C#" MasterPageFile="~/Solicitante.Master" AutoEventWireup="true" CodeBehind="SolMat.aspx.cs" Inherits="Materiales.IngresoMat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server" style="height: 424px">
            <tr>
          <br />
                        <center> <asp:Label ID="Label1" runat="server" Text="Solicitud Materiales" Font-Bold="True" Font-Size="Medium"></asp:Label></center>
                <br />
                <tr>
                <td style="height: 482px">
                    <center style="height: 434px"><a class="spell" <b><i>Bienvenido</i></b></a> <asp:Label ID="Lblusu" runat="server" Text=""></asp:Label>
                         <br />
                    <img alt="" src="Img/cajas-carton-fefco.jpg" style="width: 361px; height: 236px" /><br />
                    <center style="height: 162px; width: 741px">Ingrese su Centro de Costo&nbsp;
                        <asp:DropDownList ID="DlCC0" runat="server" BackColor="#B0B5B8" CssClass="dropdown-button btn" datasourceid="SqlDataSourceCC0" DataTextField="CentroCosto" DataValueField="CentroCosto" Width="323px">
                            <asp:ListItem Selected="True">Seleccionar</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCC0" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT [CentroCosto] FROM [CentroCosto] ORDER BY codigo"></asp:SqlDataSource>
                        <asp:Label ID="lblestado" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="BtnIngresar" runat="server" Text="Ingresar Materiales" OnClick="BtnIngresar_Click" Height="38px" Width="249px" ForeColor="White" CssClass="btn btn-primary btn-lg" BorderStyle="None" Font-Size="Small" /></center>
    </form>      
</asp:Content>
