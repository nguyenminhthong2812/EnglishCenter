using qltt.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bus_Programs
/// </summary>
/// 
namespace qltt.Business
{
    public class bus_Programs
    {
        public bus_Programs()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet t_Programs_Lst(string HeadCode)
        {
            dao_Programs xuly = new dao_Programs();
            return xuly.t_Programs_Lst(HeadCode);
        }
    }
}