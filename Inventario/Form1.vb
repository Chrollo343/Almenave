Imports System.Data.SqlClient

Public Class Form1

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Panel3.Visible = False
        MOSTRAR()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Panel3.Visible = True

    End Sub

    Private Sub Panel3_Paint(sender As Object, e As PaintEventArgs) Handles Panel3.Paint

    End Sub

    Private Sub datalistado_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellContentClick

    End Sub
    Sub buscar()
        Dim dt As New DataTable
        Dim da As SqlDataAdapter
        Try
            abrir()
            da = New SqlDataAdapter("buscar_usuarios", conexion)
            da.SelectCommand.CommandType = 4
            da.SelectCommand.Parameters.AddWithValue("@letra", txtbuscar.Text)

            da.Fill(dt)
            datalistado.DataSource = dt
            cerrar()

        Catch ex As Exception
        End Try
    End Sub

    Private Sub txtbuscar_TextChanged(sender As Object, e As EventArgs) Handles txtbuscar.TextChanged
        buscar()
    End Sub

    Private Sub GuardarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GuardarToolStripMenuItem.Click
        Try
            Dim cmd As New SqlCommand
            abrir()
            cmd = New SqlCommand("insertar_usuario", conexion)
            cmd.CommandType = 4
            cmd.Parameters.AddWithValue("@Articulo", txtArticulo.Text)
            cmd.Parameters.AddWithValue("@Stock", txtstock.Text)
            cmd.Parameters.AddWithValue("@Deposito", txtdeposito.Text)
            cmd.Parameters.AddWithValue("@Precio", txtprecio.Text)
            cmd.ExecuteNonQuery()
            cerrar()
            MOSTRAR()
            Panel3.Visible = False
        Catch ex As Exception

        End Try


    End Sub
    Sub MOSTRAR()
        Dim dt As New DataTable
        Dim da As SqlDataAdapter
        Try
            abrir()
            da = New SqlDataAdapter("mostrar_usuario", conexion)
            da.Fill(dt)
            datalistado.DataSource = dt
            cerrar()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GuardarCambiosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GuardarCambiosToolStripMenuItem.Click
        Try
            Dim cmd As New SqlCommand
            abrir()
            cmd = New SqlCommand("editar_usuario", conexion)
            cmd.CommandType = 4
            cmd.Parameters.AddWithValue("@Articulo", txtArticulo.Text)
            cmd.Parameters.AddWithValue("@codigo", lblCodigo.Text)
            cmd.Parameters.AddWithValue("@Stock", txtstock.Text)
            cmd.Parameters.AddWithValue("@Deposito", txtdeposito.Text)
            cmd.Parameters.AddWithValue("@Precio", txtprecio.Text)
            cmd.ExecuteNonQuery()
            cerrar()
            MOSTRAR()
            Panel3.Visible = False
        Catch ex As Exception

        End Try
    End Sub

    Private Sub datalistado_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellDoubleClick
        Try
            Panel3.Visible = True
            GuardarToolStripMenuItem.Visible = false
            GuardarCambiosToolStripMenuItem.Visible = True
            txtArticulo.Text = datalistado.SelectedCells.Item(1).Value
            txtstock.Text = datalistado.SelectedCells.Item(3).Value
            txtdeposito.Text = datalistado.SelectedCells.Item(4).Value
            txtprecio.Text = datalistado.SelectedCells.Item(5).Value
            lblCodigo.Text = datalistado.SelectedCells.Item(2).Value
        Catch ex As Exception

        End Try
    End Sub

    Private Sub datalistado_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellClick
        If e.ColumnIndex = Me.datalistado.Columns.Item("Eli").Index Then
            Dim result As DialogResult
            result = MessageBox.Show("¿Realmente desea eliminar este articulo?", "Eliminando registros", MessageBoxButtons.OKCancel, MessageBoxIcon.Question)
            If result = DialogResult.OK Then
                Try
                    Dim cmd As New SqlCommand
                    abrir()
                    cmd = New SqlCommand("eliminar_usuario", conexion)
                    cmd.CommandType = 4
                    cmd.Parameters.AddWithValue("@codigo", datalistado.SelectedCells.Item(2).Value)
                    cmd.ExecuteNonQuery()
                    cerrar()
                    MOSTRAR()
                Catch ex As Exception

                End Try
            Else
                MessageBox.Show("Cancelando eliminacion de regisros", "Eliminando registros", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)
            End If


        End If
    End Sub

    Private Sub btnmodificar_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Menu.Show()
        Me.Hide()
    End Sub
End Class
