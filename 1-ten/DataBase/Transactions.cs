//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1_ten.DataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class Transactions
    {
        public int Transaction_ID { get; set; }
        public Nullable<int> User_ID { get; set; }
        public string Transaction_Type { get; set; }
        public Nullable<int> Amount { get; set; }
        public Nullable<System.DateTime> Transaction_Date { get; set; }
        public string Sposob { get; set; }
    
        public virtual Users Users { get; set; }
    }
}
