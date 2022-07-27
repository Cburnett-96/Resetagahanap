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
    public partial class ProfilePharmacy : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "pharmacy")
                {
                    Response.Redirect("LoginDoctorPharmacy.aspx");
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
                Response.Redirect("LoginDoctorPharmacy.aspx");
            }
        }
        protected void btnupdateprofile_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("LoginDoctorPharmacy.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }
        void updateUserPersonalDetails()
        {
            string password = "";
            if (newpasswordpharmacy.Text.Trim() == "")
            {
                password = oldpasswordpharmacy.Text.Trim();
            }
            else
            {
                password = newpasswordpharmacy.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update pharmacy set storename=@storename, contact=@contact, town=@town, address=@address, storehrs=@storehrs, password=@password WHERE userid='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@storename", txtstorename.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", txtshopcontact.Text.Trim());
                cmd.Parameters.AddWithValue("@town", listcity.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", txtshopaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@storehrs", txtstorehours.Text.Trim());
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
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from pharmacy where userid='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtstorename.Text = dt.Rows[0]["storename"].ToString();
                txtshopcontact.Text = dt.Rows[0]["contact"].ToString();
                listcity.SelectedValue = dt.Rows[0]["town"].ToString().Trim();
                txtshopaddress.Text = dt.Rows[0]["address"].ToString();
                txtstorehours.Text = dt.Rows[0]["storehrs"].ToString();
                useridpharmacy.Text = dt.Rows[0]["userid"].ToString();
                oldpasswordpharmacy.Text = dt.Rows[0]["password"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}