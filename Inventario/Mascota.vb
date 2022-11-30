Public Class Mascota

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Panel3.Visible = False
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Panel3.Visible = True
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Menu.Show()
        Me.Hide()
    End Sub

    Private Sub Mascota_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Panel3.Visible = False
    End Sub
End Class