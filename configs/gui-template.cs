using System;
using System.Windows.Forms;
using System.Drawing;
using System.IO;

public class DIIXMiniApp : Form
{
    public DIIXMiniApp()
    {
        this.Text = "DIIX Configurador";
        this.Width = 520;
        this.Height = 340;
        this.StartPosition = FormStartPosition.CenterScreen;
        this.BackColor = Color.FromArgb(30, 30, 45);
        this.ForeColor = Color.White;

        Label lblTitle = new Label();
        lblTitle.Text = "DIIX — Configurador Visual";
        lblTitle.Font = new Font("Segoe UI", 14, FontStyle.Bold);
        lblTitle.ForeColor = Color.Cyan;
        lblTitle.Top = 20; lblTitle.Left = 20; lblTitle.Width = 460;
        this.Controls.Add(lblTitle);

        Label lblKey = new Label();
        lblKey.Text = "Chave API (OpenRouter):";
        lblKey.Top = 80; lblKey.Left = 20; lblKey.Width = 200;
        this.Controls.Add(lblKey);

        TextBox txtKey = new TextBox();
        txtKey.Name = "txtKey";
        txtKey.Top = 105; txtKey.Left = 230; txtKey.Width = 240;
        txtKey.Text = Environment.GetEnvironmentVariable("OPENROUTER_API_KEY") ?? "";
        this.Controls.Add(txtKey);

        Button btnSave = new Button();
        btnSave.Text = "Salvar Configuracao";
        btnSave.Top = 160; btnSave.Left = 230; btnSave.Width = 240;
        btnSave.BackColor = Color.Cyan;
        btnSave.ForeColor = Color.Black;
        btnSave.Click += (s, e) => {
            try {
                var envPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".opencode", ".env");
                File.WriteAllText(envPath, "OPENROUTER_API_KEY=" + txtKey.Text);
                MessageBox.Show("Configuracao salva!", "DIIX", MessageBoxButtons.OK, MessageBoxIcon.Information);
            } catch (Exception ex) {
                MessageBox.Show("Erro ao salvar: " + ex.Message, "DIIX", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        };
        this.Controls.Add(btnSave);

        Label lblStatus = new Label();
        lblStatus.Text = "Status: " + (Environment.GetEnvironmentVariable("OPENROUTER_API_KEY") != null ? "Configurado" : "Pendente");
        lblStatus.Top = 210; lblStatus.Left = 20; lblStatus.Width = 460;
        lblStatus.ForeColor = Color.Yellow;
        this.Controls.Add(lblStatus);
    }

    [STAThread]
    static void Main() {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new DIIXMiniApp());
    }
}
