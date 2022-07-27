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
    public partial class PharmacyPrescriptionHistory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null || Session["role"] == null || Session["town"] == null || Session["role"].ToString() != "pharmacy")
                {
                    Response.Redirect("LoginDoctorPharmacy.aspx");
                }
                else
                {
                    getPrescriptionData();
                    getPrescriptionData1();
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("LoginDoctorPharmacy.aspx");
            }
        }
        //DATABASE FIND HISTORY OF PRESCRIPTION
        void getPrescriptionData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT fullname AS [Patient Name], prescriptionid AS [Prescription ID], dateofpres AS [Prescription Date] from town where storename='"+ Session["fullname"].ToString() +"' AND town='" + Session["town"].ToString() + "' AND confirmation='no';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void getPrescriptionData1()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT fullname AS [Patient Name], rxname AS [Recipe Name], month AS [Month] from town where storename='" + Session["fullname"].ToString() + "' AND town='" + Session["town"].ToString() + "' AND confirmation='success';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void btnfindpresid_Click(object sender, EventArgs e)
        {
            getPrescriptionByID();
        }
        void getPrescriptionByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from town where prescriptionid='" + txtpresid.Text.Trim() + "' AND town='" + Session["town"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        textdoctorname.Text = dr.GetValue(3).ToString();
                        txtdoctoraddress.Text = dr.GetValue(4).ToString();
                        txtcontactno.Text = dr.GetValue(5).ToString();
                        txtdate.Text = dr.GetValue(6).ToString();
                        txtrx.Text = dr.GetValue(7).ToString();
                        txtrxmgtabs.Text = dr.GetValue(8).ToString();
                        txtsigntabs.Text = dr.GetValue(9).ToString();
                        txtsignhrs.Text = dr.GetValue(10).ToString();
                        txtditabs.Text = dr.GetValue(11).ToString();
                        txtrefill.Text = dr.GetValue(12).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Prescription ID Found!');</script>");
                    clearForm();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            textdoctorname.Text = "";
            txtdoctoraddress.Text = "";
            txtcontactno.Text = "";
            txtdate.Text = "";
            txtrx.Text = "";
            txtrxmgtabs.Text = "";
            txtsigntabs.Text = "";
            txtsignhrs.Text = "";
            txtditabs.Text = "";
            txtrefill.Text = "";
        }

        protected void btnyes_Click(object sender, EventArgs e)
        {
            //INSERT PRESCRIPTION into Pharmacy
            if (txtpresid.Text != "" && textdoctorname.Text != "" && txtdoctoraddress.Text != "" && txtcontactno.Text != "" && txtdate.Text != "" && txtrx.Text != "" && txtrxmgtabs.Text != "" && txtsigntabs.Text != "" && txtsignhrs.Text != "" && txtditabs.Text != "" && txtrefill.Text != "")
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("update town set confirmation=@confirmation, storename=@storename WHERE prescriptionid='" + txtpresid.Text.Trim() + "' AND storename='" + Session["fullname"].ToString().Trim() + "' AND town='" + Session["town"].ToString().Trim() + "'", con);
                    cmd.Parameters.AddWithValue("@confirmation", btnyes.Text.Trim());
                    cmd.Parameters.AddWithValue("@storename", Session["fullname"].ToString().Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Submit Successful');</script>");
                    clearForm();
                    txtpresid.Text = "";
                    getPrescriptionData();
                    getPrescriptionData1();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please Find Prescription ID');</script>");
            }
        }

        protected void btnno_Click(object sender, EventArgs e)
        {
                    getPrescriptionData();
                    getPrescriptionData1();
                    clearForm();
                    txtpresid.Text = "";
        }
    }
}