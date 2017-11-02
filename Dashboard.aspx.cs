using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.Configuration;

public partial class Dashboard : System.Web.UI.Page
{
    static string cons;
    string desc = "Order";
    int sum = 0;
    static Dashboard()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            panel1.Visible = true;
            panel2.Visible = false;
            //lblTime.Text = DateTime.Now.ToString("hh:mm:ss tt");
        }
    }

    protected void display_price(object sender, EventArgs e)
    {
        lbl1.Text = "";
        sum=0;
        SqlConnection con = new SqlConnection(cons);
        con.Open();

        List<string> selected1 = ci1.Items.Cast<ListItem>()
            .Where(li => li.Selected)
            .Select(li => li.Text).ToList();

        List<string> selected2 = ci2.Items.Cast<ListItem>()
            .Where(li => li.Selected)
            .Select(li => li.Text).ToList();

        lbl1.Text += "<table class='table table-bordered table-hover table-striped'><tr><th>Item</th><th>Price</th></tr>";
        foreach (var s1 in selected1)
        {
            SqlCommand com = new SqlCommand("SELECT SUM(Price) from Products where Pname = @pname1", con);
            com.Parameters.AddWithValue("@pname1", s1);
            SqlDataReader reader1 = com.ExecuteReader();
            while (reader1.Read())
            {
                lbl1.Text += "<tr><td>";
                lbl1.Text += s1+"</td>";
                lbl1.Text += "<td>"+ reader1.GetValue(0).ToString()+"</td></tr>";
                sum += Convert.ToInt32(reader1.GetValue(0));
                desc += s1.ToString()+",";
            }
            
            reader1.Close();
        }
        foreach (var s2 in selected2)
        {
            SqlCommand com1 = new SqlCommand("SELECT SUM(Price) from Products where Pname = @pname1", con);
            com1.Parameters.AddWithValue("@pname1", s2);
            SqlDataReader reader2 = com1.ExecuteReader();
            while (reader2.Read())
            {
                lbl1.Text += "<tr><td>";
                lbl1.Text += s2 + "</td>";
                lbl1.Text += "<td>" + reader2.GetValue(0).ToString() + "</td></tr>";
                sum += Convert.ToInt32(reader2.GetValue(0));
                desc += s2.ToString() + ",";
            }
            reader2.Close();
        }
        lbl1.Text += "<tr> <td><b>Total</b></td><td><b> " + (sum*Convert.ToInt32(qty.Text)).ToString() + "</b></td></tr></table>";
        con.Close();
    }

    protected void payment_done(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cons);
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("Insert into Sales(OrderID, Description, Qty, TotalCost, Customer, Mobile) values(@oid, @pdesc, @qty, @total, @customer, @mobile)", con);
            com.Parameters.AddWithValue("@oid", Guid.NewGuid());
            com.Parameters.AddWithValue("@pdesc", desc);
            com.Parameters.AddWithValue("@qty", qty.Text);
            com.Parameters.AddWithValue("@total", sum.ToString());
            com.Parameters.AddWithValue("@customer", CName.Text);
            com.Parameters.AddWithValue("@mobile", CMob.Text);
            com.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            lbl1.Text = "errorL" + ex.Message +desc+"Hello";
        }
        finally
        {
            con.Close();
        }      
    }

    protected void Get_time(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToString("hh:mm:ss tt");
    }

    protected void rbl1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl1.SelectedIndex == 0)
        {
            panel2.Visible = true;
            panel1.Visible = false;
        }
        else
        {
            panel1.Visible = true;
            panel2.Visible = false;
        }
    }
}