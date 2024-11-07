using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
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
using static System.Net.Mime.MediaTypeNames;
using _1_ten.DataBase;
using System.Data.Entity;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Interop;
using System.IO;
using QRCoder;
using System.Drawing.Imaging;
using System.Xml.Linq;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserProfileWindow.xaml
    /// </summary>
    public partial class UserProfileWindow : Window
    {
        private string _password;
        public UserProfileWindow(string password)
        {
            InitializeComponent();
            _password = password;
            var Obj = ConnectionClass.DB.Users.Where(Users => Users.Password == _password).FirstOrDefault();
            NameLabel.Text = Obj.FirstName;
            SecondNameLabel.Text = Obj.SecondName;
            QRCodeImage.Source = GeneratorQrCodeBitmapImage($" Логин: {Obj.Login}," + $" Фамилия: {Obj.SecondName}," + $" Имя: {Obj.FirstName}," + $" Номер телефона: {Obj.PhoneNumber}," + $" Баланс: {Obj.Balance}");
        }
        private BitmapImage GeneratorQrCodeBitmapImage(string text)
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(text, QRCodeGenerator.ECCLevel.Q); using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (Bitmap qrBitmap = qrCode.GetGraphic(20))
                    {
                        using (MemoryStream ms = new MemoryStream())
                        {
                            qrBitmap.Save(ms, ImageFormat.Png);
                            ms.Position = 0;
                            BitmapImage bitmapImage = new BitmapImage(); bitmapImage.BeginInit();
                            bitmapImage.CacheOption = BitmapCacheOption.OnLoad; bitmapImage.StreamSource = ms;
                            bitmapImage.EndInit();
                            return bitmapImage;
                        }
                    }
                }
            }
        }
    }
}
