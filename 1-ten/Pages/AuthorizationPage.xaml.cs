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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public Users user;
        public AuthorizationPage()
        {
            InitializeComponent();
        }
        private void TextBlock_MouseDown(object sender, MouseButtonEventArgs e)
        {
            RegistrationWindow newWindow = new RegistrationWindow();
            newWindow.Show();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTextBox.Text;
            string password = PassBox.Password;

            var loginObj = ConnectionClass.DB.Users.FirstOrDefault(log => log.Login == login && log.Password == password);

            if (loginObj == null)
            {
                MessageBox.Show("Пользователь не найден");
                return;
            }
            else if (loginObj != null)
            {
                if(loginObj.RoleID == 2)
                {
                    MessageBox.Show("Успешный вход как обычный пользователь!");
                    NavigationService.Navigate(new HomePage(password));
                }
                else if(loginObj.RoleID == 1) 
                {
                    MessageBox.Show("Успешный вход как админ!");
                    NavigationService.Navigate(new GameSessionsPage());
                }
            }
            LoginTextBox.Text = "";
            PassBox.Password = "";
        }
    }
}
