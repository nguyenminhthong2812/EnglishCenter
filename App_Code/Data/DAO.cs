using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DAO
/// </summary>
public class DAO
{
	public DAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected SqlConnection Ketnoi()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["trungtamngoainguConnectionString"].ConnectionString);
    }
}