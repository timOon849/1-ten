using _1_ten.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для GameHistoryWindow.xaml
    /// </summary>
    public partial class GameHistoryWindow : Window
    {
        string _password;
        public GameHistoryWindow(string password)
        {
            _password = password;
            InitializeComponent();
            var user = ConnectionClass.DB.Users.FirstOrDefault(x => x.Password == password);
            HistoryListView.ItemsSource = ConnectionClass.DB.Game_History.Where(a => a.User_ID == user.User_ID).ToList();
        }
    }
}
