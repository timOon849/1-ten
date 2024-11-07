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
using _1_ten.DataBase;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegistrationWindow.xaml
    /// </summary>
    public partial class RegistrationWindow : Window
    {
        private Users user;
        public RegistrationWindow()
        {
            InitializeComponent();
            user = new Users();
        }

        private void RegisterButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string login = UsernameTextBox.Text;
                string password = PasswordBox.Password;
                string password1 = PasswordBox1.Password;
                if (string.IsNullOrEmpty(SecondNameTextBox.Text) || string.IsNullOrEmpty(NameTextBox.Text) || string.IsNullOrEmpty(UsernameTextBox.Text) || string.IsNullOrEmpty(PasswordBox.Password) || string.IsNullOrEmpty(PhoneNumberTextBox.Text))
                {
                    MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else if (ConnectionClass.DB.Users.Any(u => u.Login == login))
                {
                    MessageBox.Show("Пользователь с таким логином уже существует");
                    return;
                }
                else if (password != password1)
                {
                    MessageBox.Show("Пароли не совпадают");
                    return;
                }
                else
                {
                    user.RegistrationDate = DateTime.Now;
                    user.SecondName = SecondNameTextBox.Text;
                    user.FirstName = NameTextBox.Text;
                    user.Login = UsernameTextBox.Text;
                    user.Password = PasswordBox.Password;
                    user.PhoneNumber = PhoneNumberTextBox.Text;
                    user.RoleID = 2;
                    user.Balance = 0;
                    ConnectionClass.DB.Users.Add(user);
                    ConnectionClass.DB.SaveChanges();
                    Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"{ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
