using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace newtest
{
    public partial class Profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "user")
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }

                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("Default.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from normal where userid='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtfullname.Text = dt.Rows[0]["fullname"].ToString();
                genderlist.SelectedValue = dt.Rows[0]["gender"].ToString().Trim();
                txtdob.Text = dt.Rows[0]["age"].ToString();
                txtcontact.Text = dt.Rows[0]["contact"].ToString();
                txtemail.Text = dt.Rows[0]["email"].ToString();
                citylist.SelectedValue = dt.Rows[0]["town"].ToString().Trim();
                txtaddress.Text = dt.Rows[0]["address"].ToString();
                userid.Text = dt.Rows[0]["userid"].ToString();
                oldpassword.Text = dt.Rows[0]["password"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updateUserPersonalDetails()
        {
            string password = "";
            if (newpassword.Text.Trim() == "")
            {
                password = oldpassword.Text.Trim();
            }
            else
            {
                password = newpassword.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update normal set fullname=@fullname, gender=@gender, age=@age, contact=@contact, email=@email, town=@town, address=@address, password=@password WHERE userid='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@fullname", txtfullname.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", genderlist.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@age", txtdob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", txtcontact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@town", citylist.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", txtaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();

                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}