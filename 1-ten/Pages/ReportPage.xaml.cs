using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
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
using _1_ten.DataBase;
using LiveCharts;
using LiveCharts.Wpf;
using QRCoder;

namespace _1_ten.Pages
{
    /// <summary>
    /// Логика взаимодействия для ReportPage.xaml
    /// </summary>
    public partial class ReportPage : Page
    {
        private string _password;
        public ReportPage(string password)
        {
            InitializeComponent();
            _password = password;
            var user = ConnectionClass.DB.Users.Where(p => p.Password == _password).FirstOrDefault();
            var totalBets = ConnectionClass.DB.Game_Sessions.Where(g => g.User_ID == user.User_ID && g.Bet_Amount.HasValue).Sum(g => g.Bet_Amount.Value);
            var totalWins = ConnectionClass.DB.Game_Sessions.Where(g => g.User_ID == user.User_ID && g.Win_Amount.HasValue).Sum(g => g.Win_Amount.Value);
            QRCodeImage.Source = GeneratorQrCodeBitmapImage($"Всего ставок: {totalBets}, всего выигрышей: {totalWins}");
            stavkaTxt.Text = Convert.ToString(totalBets);
            winingTxt.Text = Convert.ToString(totalWins);
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
