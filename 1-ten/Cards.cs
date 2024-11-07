using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _1_ten
{
    public class Cards
    {
        public string Symbol { get; set; }
        public string Rank { get; set; }
        public string Status { get; set; }
        public Cards(string symbol, string rank, string status)
        {
            Symbol = symbol;
            Rank = rank;
            Status = status;
        }
    }
}
