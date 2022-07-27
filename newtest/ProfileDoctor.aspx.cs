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
    public partial class ProfileDoctor : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "doctor")
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
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from doctor where userid='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txtdoctorname.Text = dt.Rows[0]["doctorname"].ToString();
                txtcontact.Text = dt.Rows[0]["contact"].ToString();
                txtdoctoraddress.Text = dt.Rows[0]["address"].ToString();
                useriddoctor.Text = dt.Rows[0]["userid"].ToString();
                oldpasswordoctor.Text = dt.Rows[0]["password"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updateUserPersonalDetails()
        {
            string password = "";
            if (newpassworddoctor.Text.Trim() == "")
            {
                password = oldpasswordoctor.Text.Trim();
            }
            else
            {
                password = newpassworddoctor.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update doctor set doctorname=@doctorname, contact=@contact, address=@address, password=@password WHERE userid='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@doctorname", txtdoctorname.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", txtcontact.Text.Trim());
                cmd.Parameters.AddWithValue("@address", txtdoctoraddress.Text.Trim());
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