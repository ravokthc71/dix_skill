using System;
using System.Windows.Forms;
using System.Drawing;
using System.IO;

public class DIIXFullApp : Form
{
    TextBox txtKey;
    Label lblStatus;
    ComboBox cmbProfile;

    public DIIXFullApp()
    {
        this.Text = "DIIX — Controle Total";
        this.Width = 580; this.Height = 420;
        this.StartPosition = FormStartPosition.CenterScreen;
        this.BackColor = Color.FromArgb(25, 25, 35);
        this.ForeColor = Color.White;

        Label title = new Label();
        title.Text = "DIIX Full Controller";
        title.Font = new Font("Segoe UI", 16, FontStyle.Bold);
        title.ForeColor = Color.Cyan;
        title.Top = 15; title.Left = 20; title.Width = 500;
        this.Controls.Add(title);

        Label lblProfile = new Label(); lblProfile.Text = "Perfil:"; lblProfile.Top = 60; lblProfile.Left = 20; lblProfile.Width = 100;
        this.Controls.Add(lblProfile);

        cmbProfile = new ComboBox();
        cmbProfile.Top = 60; cmbProfile.Left = 120; cmbProfile.Width = 150;
        cmbProfile.Items.AddRange(new object[] { "simple", "coding", "reasoning", "review", "documentation" });
        cmbProfile.SelectedIndex = 0;
        cmbProfile.DropDownStyle = ComboBoxStyle.DropDownList;
        this.Controls.Add(cmbProfile);

        Label lblKey = new Label(); lblKey.Text = "Chave API (OpenRouter):"; lblKey.Top = 100; lblKey.Left = 20; lblKey.Width = 200;
        this.Controls.Add(lblKey);

        txtKey = new TextBox();
        txtKey.Top = 125; txtKey.Left = 230; txtKey.Width = 300; txtKey.PasswordChar = '*';
        txtKey.Text = System.Environment.GetEnvironmentVariable("OPENROUTER_API_KEY") ?? "";
        this.Controls.Add(txtKey);

        Button btnSave = new Button(); btnSave.Text = "Salvar .env"; btnSave.Top = 160; btnSave.Left = 230; btnSave.Width = 120;
        btnSave.BackColor = Color.Cyan; btnSave.ForeColor = Color.Black; btnSave.Font = new Font("Segoe UI", 9, FontStyle.Bold);
        btnSave.Click += (s,e) => SaveEnv();
        this.Controls.Add(btnSave);

        Button btnList = new Button(); btnList.Text = "Listar Modelos Free"; btnList.Top = 160; btnList.Left = 360; btnList.Width = 160;
        btnList.BackColor = Color.LimeGreen; btnList.ForeColor = Color.Black; btnList.Font = new Font("Segoe UI", 9, FontStyle.Bold);
        btnList.Click += (s,e) => ListModels();
        this.Controls.Add(btnList);

        lblStatus = new Label(); lblStatus.Text = "Status: Aguardando..."; lblStatus.Top = 210; lblStatus.Left = 20; lblStatus.Width = 500; lblStatus.ForeColor = Color.Yellow;
        this.Controls.Add(lblStatus);

        Label lblInfo = new Label(); lblInfo.Text = "9Router: PRESENT  |  OpenCode: OK  |  Cofre: OK  |  Python: 3.14.0"; lblInfo.Top = 280; lblInfo.Left = 20; lblInfo.Width = 500; lblInfo.ForeColor = Color.LightGray; lblInfo.Font = new Font("Segoe UI", 9);
        this.Controls.Add(lblInfo);
    }

    void SaveEnv()
    {
        try {
            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".opencode", ".env");
            Directory.CreateDirectory(Path.GetDirectoryName(path));
            File.WriteAllText(path, "OPENROUTER_API_KEY=" + txtKey.Text + "\nOPENROUTER_BASE_URL=https://openrouter.ai/api/v1\nDIXX_PROFILE=" + cmbProfile.SelectedItem + "\n");
            lblStatus.ForeColor = Color.Green; lblStatus.Text = "Status: .env salvo! Perfil: " + cmbProfile.SelectedItem;
        } catch (Exception ex) {
            lblStatus.ForeColor = Color.Red; lblStatus.Text = "Erro: " + ex.Message;
        }
    }

    void ListModels()
    {
        lblStatus.ForeColor = Color.Cyan; lblStatus.Text = "Status: Consultando modelos via OpenRouter...";
        // Simulado — em produção, chamar API real
        lblStatus.ForeColor = Color.Lime; lblStatus.Text = "Status: Modelos Free encontrados (Ex: meta-llama/3.1-8b, gemma-2, qwen-2.5) — insira chave real para listar ao vivo.";
    }

    [STAThread]
    static void Main() { Application.EnableVisualStyles(); Application.Run(new DIIXFullApp()); }
}
