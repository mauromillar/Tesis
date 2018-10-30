<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Materiales.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- login panel -->
	<div class="row">
		<div class="col s12 m6 l4 offset-m3 offset-l4">
			<div class="card-panel grey lighten-3">
				<form id="form1" runat="server" submitdisabledcontrols="False" style="height: 215px">
					<div class="row">
						<div class="input-field col s12 ">
							<i class="mdi-action-account-circle prefix">
                                <img src="Img/User.png" style="width: 18px; height: 18px" /></i>
                            <asp:TextBox ID="txtusu" runat="server"></asp:TextBox>
							<label for="user_prefix"> Cuenta</label>
						</div>
						<div class="input-field col s12">
							<i class="mdi-communication-vpn-key prefix">
                                <img src="Img/pass.png" style="width: 18px; height: 18px" /></i>
                            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
							<label for="passwd_prefix">Contraseña</label>
						</div>
					  
					</div>
                 
                            
                          <center><asp:Button  ID="BtnIngresar" runat="server" OnClick="BtnIngresar_Click" text="Ingresar" Width="165px" BackColor="#26A69A" BorderColor="#26A69A" BorderStyle="None" Font-Overline="False" Font-Size="Small" ForeColor="#EEEEEE" Height="37px" CssClass="btn btn-primary btn-lg" Font-Bold="False" /></center>
                   
                            <center><asp:Label ID="lblestado" runat="server" BorderStyle="None" ForeColor="#26A69A"></asp:Label></center>
                     <br />

				</form>
			</div>
		</div>   

        </div>
</asp:Content>
