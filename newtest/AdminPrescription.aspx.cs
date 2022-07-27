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
    public partial class AdminPrescription : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "admin")
                {
                    Response.Redirect("AdminLogin.aspx");
                }
                else
                {
                    getPrescriptiondatabyid();
                    getTowndatabyid();
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnfindpresid_Click(object sender, EventArgs e)
        {
            getPrescriptionByID();
        }

        protected void btndeletepres_Click(object sender, EventArgs e)
        {
            DeletePrescription();
        }
        void getPrescriptiondatabyid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT prescriptionid AS [Prescription ID], doctorname AS [Doctor Name], contact, rxname AS [Rx Name] from prescription;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewpres.DataSource = dt;
                GridViewpres.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
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
                SqlCommand cmd = new SqlCommand("select * from prescription where prescriptionid='" + txtpresid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtdoctorname.Text = dr.GetValue(2).ToString();
                        txtdate.Text = dr.GetValue(5).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No Prescription ID Found!');</script>");
                    txtpresid.Text = "";
                    txtdoctorname.Text = "";
                    txtdate.Text = "";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeletePrescription()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from prescription WHERE prescriptionid='" + txtpresid.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                getPrescriptiondatabyid();
                txtpresid.Text = "";
                txtdoctorname.Text = "";
                txtdate.Text = "";

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnfindtown_Click(object sender, EventArgs e)
        {
            getTownByID();
        }

        protected void btndeletetown_Click(object sender, EventArgs e)
        {
            DeleteTown();
        }
        void getTowndatabyid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT id AS [ID], town AS [Town], confirmation AS [Status], storename AS [Store Name] from town;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewTown.DataSource = dt;
                GridViewTown.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void getTownByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from town where id='" + txtid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtname.Text = dr.GetValue(1).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No ID Found!');</script>");
                    txtid.Text = "";
                    txtname.Text = "";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeleteTown()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from town WHERE id='" + txtid.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                getTowndatabyid();
                txtid.Text = "";
                txtname.Text = "";

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}