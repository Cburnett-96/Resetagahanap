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
    public partial class Admin : System.Web.UI.Page
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
                    getdoctordatabyid();
                    getpharmacydatabyid();
                    getnormaluserdatabyid();
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("AdminLogin.aspx");
            }
        }
        protected void btnfinddoctor_Click(object sender, EventArgs e)
        {
            getdoctorByID();
        }

        protected void btndoctordelete_Click(object sender, EventArgs e)
        {
            if (doctoruserid.Text != "")
            {
                DeleteDoctorUser();
            }
            else
            {
                Response.Write("<script>alert('No User ID Found!');</script>");
            }
        }
        void getdoctordatabyid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT userid AS [User ID], doctorname AS [Doctor Name], contact from doctor;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewdoctor.DataSource = dt;
                GridViewdoctor.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void getdoctorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from doctor where userid='" + doctoruserid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtdoctorname.Text = dr.GetValue(0).ToString();
                        txtdoctorcontact.Text = dr.GetValue(1).ToString();
                        txtdoctoraddress.Text = dr.GetValue(2).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No User ID Found!');</script>");
                    doctoruserid.Text = "";
                    txtdoctorname.Text = "";
                    txtdoctorcontact.Text = "";
                    txtdoctoraddress.Text = "";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeleteDoctorUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from doctor WHERE userid='" + doctoruserid.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                getdoctordatabyid();
                doctoruserid.Text = "";
                txtdoctorname.Text = "";
                txtdoctorcontact.Text = "";
                txtdoctoraddress.Text = "";

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnfindpharmacy_Click(object sender, EventArgs e)
        {
            getpharmacyByID();
        }

        protected void btndeletepharmacy_Click(object sender, EventArgs e)
        {
            
            if (txtpharmacyuserid.Text != "")
            {
                DeletePharmacyUser();
            }
            else
            {
                Response.Write("<script>alert('No User ID Found!');</script>");
            }
        }
        void getpharmacydatabyid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT userid AS [User ID], storename AS [Store Name], contact from pharmacy;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewPharmacy.DataSource = dt;
                GridViewPharmacy.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void getpharmacyByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from pharmacy where userid='" + txtpharmacyuserid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtpharmacyname.Text = dr.GetValue(0).ToString();
                        txtpharmacycontact.Text = dr.GetValue(1).ToString();
                        txtpharmacyaddress.Text = dr.GetValue(3).ToString() + " " + dr.GetValue(2).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No User ID Found!');</script>");
                    txtpharmacyuserid.Text = "";
                    txtpharmacyname.Text = "";
                    txtpharmacycontact.Text = "";
                    txtpharmacyaddress.Text = "";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeletePharmacyUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from pharmacy WHERE userid='" + txtpharmacyuserid.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                getpharmacydatabyid();
                txtpharmacyuserid.Text = "";
                txtpharmacyname.Text = "";
                txtpharmacycontact.Text = "";
                txtpharmacyaddress.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnfinduser_Click(object sender, EventArgs e)
        {
            getnormaluserByID();
        }

        protected void btndeleteuser_Click(object sender, EventArgs e)
        {
            
            if (txtuserid.Text != "")
            {
                DeleteNormalUser();
            }
            else
            {
                Response.Write("<script>alert('No User ID Found!');</script>");
            }
        }
        void getnormaluserdatabyid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT userid AS [User ID], fullname AS [Patient Name], contact from normal;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewNormalUser.DataSource = dt;
                GridViewNormalUser.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void getnormaluserByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from normal where userid='" + txtuserid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtusername.Text = dr.GetValue(0).ToString();
                        txtusercontact.Text = dr.GetValue(3).ToString();
                        txtuseraddress.Text = dr.GetValue(6).ToString() + " " + dr.GetValue(5).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('No User ID Found!');</script>");
                    txtuserid.Text = "";
                    txtusername.Text = "";
                    txtusercontact.Text = "";
                    txtuseraddress.Text = "";
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void DeleteNormalUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from normal WHERE userid='" + txtuserid.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                getnormaluserdatabyid();
                txtuserid.Text = "";
                txtusername.Text = "";
                txtusercontact.Text = "";
                txtuseraddress.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}