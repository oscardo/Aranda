using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Label1.Text = "";
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

            string user = Login1.UserName.ToString();
            string pass = Login1.Password.ToString();
            if (user.Equals("") || pass.Equals("")) {
                this.Label1.Text = "Hace falta llenar los espacios vacios";
            }
            else { 
                this.Label1.Text = user + " " + pass;
                pass = pass.TrimEnd();

                Usuario U = new Usuario();
                U.Nombre = user.ToLower().ToString();
                byte[] bytes = Encoding.ASCII.GetBytes(pass.ToString());
                U.ClaveHash = bytes;

                BDArandaEntities bDArandaEntities = new BDArandaEntities();
                string RespondeParameter = "Algo";
                int i = bDArandaEntities.UsuarioLogin(U.Nombre, U.ClaveHash, RespondeParameter);
                if (RespondeParameter == "Puede Entrar")
                {
                    this.Label1.Text = "Entro";
                }
                else
                {
                    this.Label1.Text = "Error";
                }
            }
        }
    }
}