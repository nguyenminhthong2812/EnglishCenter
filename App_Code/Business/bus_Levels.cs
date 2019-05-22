using qltt.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bus_Levels
/// </summary>
/// 
namespace qltt.Business
{
    public class bus_Levels
    {
        public bus_Levels()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet t_Levels_Lst(string ProgramCode)
        {
            dao_Levels xuly = new dao_Levels();
            return xuly.t_Levels_Lst(ProgramCode);
        }
    }
}