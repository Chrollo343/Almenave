Imports System.Data.SqlClient
Public Class LOGIN
    Private Sub txtpassword_Click(sender As Object, e As EventArgs) Handles txtpassword.Click
        txtpassword.Text = ""
        txtpassword.Focus()
    End Sub

    Private Sub txtlogin_Click(sender As Object, e As EventArgs) Handles txtlogin.Click
        txtlogin.Text = ""
        txtlogin.Focus()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        cargarusuarios()
        If datalistado.RowCount > 1 Then
            Menu.Show()
            Me.Hide()

        Else
            MessageBox.Show("Verifique su usuario y contrasena", "Control de Acceso", MessageBoxButtons.OK, MessageBoxIcon.Information)
        End If
    End Sub

    Public Sub cargarusuarios()
        Dim dt As New DataTable
        Dim da As SqlDataAdapter
        Try
            abrir()
            da = New SqlDataAdapter("validar_usuario", conexion)
            da.SelectCommand.CommandType = 4
            da.SelectCommand.Parameters.AddWithValue("@login", txtlogin.Text)
            da.SelectCommand.Parameters.AddWithValue("@password", txtpassword.Text)
            da.Fill(dt)
            datalistado.DataSource = dt
            cerrar()

        Catch ex As Exception
            MessageBox.Show(ex.Message)
        End Try

    End Sub

    Private Sub LOGIN_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub
End Class