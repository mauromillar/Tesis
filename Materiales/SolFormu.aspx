<%@ Page Title="" Language="C#" MasterPageFile="~/Solicitante.Master" AutoEventWireup="true" CodeBehind="SolFormu.aspx.cs" Inherits="Materiales.SolFormu" EnableEventValidation = "false" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
     
      
     
    </script>


    <form id="form1" runat="server">
        <table style="width: 100%; height: 419px;">
            <tr>
                              
                <td style="height: 23px;" colspan="3" align="center"> 
                        <center><b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
                            <br />
                            Solicitud Materiales 
                            <br />
                            <br />
                            </span></b></center>
            </tr>
            <tr>
                <td rowspan="6" style="width: 51px">
                    <img alt="" src="img/cajas-carton-fefco.jpg" style="width: 314px; height: 248px" /></td>
                <td style="width: 192px; height: 26px;">Id Solicitud</td>
                <td style="width: 384px; height: 26px;">
                    <asp:Label ID="Lblid" runat="server" CssClass="bold" ForeColor="#336666"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 192px; height: 30px;">Centro de Costo</td>
                <td style="width: 384px; height: 30px;">
                    <asp:Label ID="lblcc" runat="server" CssClass="bold" ForeColor="#336666"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 192px; height: 30px;">Usuario</td>
                <td style="width: 384px; height: 30px;">
                    <asp:Label ID="Lblusu" runat="server" CssClass="bold" ForeColor="#336666"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 192px; height: 82px;">Ingrese Material a solicitar</td>
                <td style="width: 384px; height: 82px;">
                    <asp:DropDownList ID="dlmat" runat="server" DataSourceID="SqlDataSourceMat" DataTextField="Materiales" DataValueField="Materiales" OnSelectedIndexChanged="dlmat_SelectedIndexChanged" AutoPostBack="True" BackColor="#B0B5B8" CssClass="dropdown-button btn" Width="268px">
                        <asp:ListItem Selected="True">Seleccionar</asp:ListItem>
                    </asp:DropDownList>
                    <b style="mso-bidi-font-weight:normal"><span style="font-size:11.0pt;line-height:107%">
                    <br />
                    <br />
                    Unidad de transferencia:</span></b>&nbsp;( <asp:Label ID="lblut" runat="server" AssociatedControlID="dlmat" CssClass="bold" ForeColor="Red"></asp:Label>
                    )<br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceMat" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" SelectCommand="SELECT [Materiales] FROM [Listado Materiales]  ORDER BY Materiales"></asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 192px; height: 15px;">Ingrese cantidad a solicitar</td>
                <td style="width: 384px; height: 15px;">
                    <asp:TextBox ID="txtcant" runat="server" CssClass="avatar" Height="21px" Width="158px"></asp:TextBox>
                &nbsp;<br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtcant" ErrorMessage="Ingrese Valores Numericos" ValidationExpression="^[0-9]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 192px; height: 64px;"></td>
                <td style="width: 384px; height: 64px;">
                    <asp:Button ID="BtnIngresar" runat="server" Text="INGRESAR" OnClick="BtnIngresar_Click" Height="35px" Width="209px"  CssClass="btn btn-primary btn-lg" />
                &nbsp;&nbsp;<br />
                    <br />
                    &nbsp;
                    <asp:Label ID="LblEstado" runat="server" BorderColor="Red" ForeColor="Red" CssClass="bold"></asp:Label>
                    
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Btnfinal" runat="server" style="margin-left: 60px" Text="FINALIZAR"  Width="192px" OnClick="Btnfinal_Click1" CssClass="btn btn-primary btn-lg" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceGrilla" GridLines="Horizontal" AllowPaging="True">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" Height="26px" ImageUrl="~/Img/No.png" Text="Eliminar" Width="28px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="id_Solicitud" HeaderText="N° Solicitud" SortExpression="id_Solicitud" />
                <asp:BoundField DataField="codigo" HeaderText="Centro de costo" SortExpression="codigo" />
                <asp:BoundField DataField="descripcionCC" HeaderText="Descripcion CC" SortExpression="descripcionCC" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="REFERENCIA" HeaderText="Referencia" SortExpression="REFERENCIA" />
                <asp:BoundField DataField="DESCRIPCION" HeaderText="Descripcion" SortExpression="DESCRIPCION" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso" />
                <asp:BoundField DataField="Unidad_Trasnferencia" HeaderText="U T" SortExpression="Unidad_Trasnferencia" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:BDproductosConnectionString %>" DeleteCommand="DELETE FROM [Solicitud_m] WHERE [id] = @id" InsertCommand="INSERT INTO [Solicitud_m] ([id_Solicitud], [codigo], [descripcionCC], [Usuario], [REFERENCIA], [DESCRIPCION], [Cantidad], [Estado], [Fecha_Ingreso], [Precio]) VALUES (@id_Solicitud, @codigo, @descripcionCC, @Usuario, @REFERENCIA, @DESCRIPCION, @Cantidad, @Estado, @Fecha_Ingreso, @Precio)" SelectCommand="GrillaMateriales" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE [Solicitud_m] SET [id_Solicitud] = @id_Solicitud, [codigo] = @codigo, [descripcionCC] = @descripcionCC, [Usuario] = @Usuario, [REFERENCIA] = @REFERENCIA, [DESCRIPCION] = @DESCRIPCION, [Cantidad] = @Cantidad, [Estado] = @Estado, [Fecha_Ingreso] = @Fecha_Ingreso, [Precio] = @Precio WHERE [id] = @id">
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
                <asp:SessionParameter Name="user" SessionField="nom" Type="String" />
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

    </form>



</asp:Content>