using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    static string cons;
    static _Default()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login(object sender, EventArgs e)
    {
        string user = username.Text;
        string pass = password.Text;

        SqlConnection con = new SqlConnection(cons);
        SqlCommand com = new SqlCommand("SELECT * FROM Managers where Username = @username and Password = @password", con);
        com.Parameters.AddWithValue("@username", user);
        com.Parameters.AddWithValue("@password", pass);

        try
        {
            con.Open();
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                Session["username"] = user;            
                Response.Redirect("Dashboard.aspx");
            }
            else
            {

            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
            con.Close();
        }
    }
}