
### Sample showing a PowerShell GUI with drag-and-drop ###

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$global:num = 15

#region form
$form = New-Object System.Windows.Forms.Form
$form.Text = "MSI-info"
$form.Size = '920,385'
$form.StartPosition = "CenterScreen"
$form.MinimumSize = $form.Size
$form.MaximizeBox = $True
#$form.Topmost = $True



### Define controls ###

#Button

# textbox
$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox4 = New-Object System.Windows.Forms.TextBox
$textBox5 = New-Object System.Windows.Forms.TextBox
$textBox6 = New-Object System.Windows.Forms.TextBox
$textBox7 = New-Object System.Windows.Forms.TextBox
$textBox8 = New-Object System.Windows.Forms.TextBox
$textBox9 = New-Object System.Windows.Forms.TextBox
$textBox10 = New-Object System.Windows.Forms.TextBox
$textBox11 = New-Object System.Windows.Forms.TextBox
$textBox12 = New-Object System.Windows.Forms.TextBox
$textBox13 = New-Object System.Windows.Forms.TextBox
$textBox14 = New-Object System.Windows.Forms.TextBox
$textBox15 = New-Object System.Windows.Forms.TextBox
$textBox16 = New-Object System.Windows.Forms.TextBox

<#
$textBox1.Text = 
$textBox2.Text = 
$textBox3.Text = 
$textBox4.Text = 
$textBox5.Text = 
$textBox6.Text = 
$textBox7.Text = 
$textBox8.Text = 
$textBox9.Text = 
$textBox10.Text = 
$textBox11.Text = 
$textBox12.Text = 
$textBox13.Text = 
$textBox14.Text = 
$textBox15.Text = 
$textBox16.Text = 
#>


$textBox1.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox2.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox3.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox4.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox5.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox6.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox7.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox8.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox9.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox10.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox11.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox12.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox13.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox14.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox15.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 
$textBox16.Anchor =([System.Windows.Forms.AnchorStyles]::Right) 


$textBox1.Autosize = $true 
$textBox2.Autosize = $true 
$textBox3.Autosize = $true 
$textBox4.Autosize = $true 
$textBox5.Autosize = $true 
$textBox6.Autosize = $true 
$textBox7.Autosize = $true 
$textBox8.Autosize = $true 
$textBox9.Autosize = $true 
$textBox10.Autosize = $true 
$textBox11.Autosize = $true 
$textBox12.Autosize = $true 
$textBox13.Autosize = $true 
$textBox14.Autosize = $true 
$textBox15.Autosize = $true 
$textBox16.Autosize = $true 

$textBox1.Top = 5 
$textBox2.Top = 25 
$textBox3.Top = 45 
$textBox4.Top = 65 
$textBox5.Top = 85 
$textBox6.Top = 105 
$textBox7.Top = 125 
$textBox8.Top = 145 
$textBox9.Top = 165 
$textBox10.Top = 185 
$textBox11.Top = 205 
$textBox12.Top = 225 
$textBox13.Top = 245 
$textBox14.Top = 265 
$textBox15.Top = 305 
$textBox16.Top = 325 

$textBox1.Left = 140
$textBox2.Left = 140
$textBox3.Left = 140
$textBox4.Left = 140
$textBox5.Left = 140
$textBox6.Left = 140
$textBox7.Left = 140
$textBox8.Left = 140
$textBox9.Left = 140
$textBox10.Left = 140
$textBox11.Left = 140
$textBox12.Left = 140
$textBox13.Left = 140
$textBox14.Left = 140
$textBox15.Left = 140
$textBox16.Left = 140

<#
$textBox1.Right = 10
$textBox2.Right = 10
$textBox3.Right = 10
$textBox4.Right = 10
$textBox5.Right = 10
$textBox6.Right = 10
$textBox7.Right = 10
$textBox8.Right = 10
$textBox9.Right = 10
$textBox10.Right = 10
$textBox11.Right = 10
$textBox12.Right = 10
$textBox13.Right = 10
$textBox14.Right = 10
$textBox15.Right = 10
$textBox16.Right = 10
#>

$textBox1.Width = $($form.Width - 60)
$textBox2.Width = $($form.Width - 60)
$textBox3.Width = $($form.Width - 60)
$textBox4.Width = $($form.Width - 60)
$textBox5.Width = $($form.Width - 60)
$textBox6.Width = $($form.Width - 60)
$textBox7.Width = $($form.Width - 60)
$textBox8.Width = $($form.Width - 60)
$textBox9.Width = $($form.Width - 60)
$textBox10.Width = $($form.Width - 60)
$textBox11.Width = $($form.Width - 60)
$textBox12.Width = $($form.Width - 60)
$textBox13.Width = $($form.Width - 60)
$textBox14.Width = $($form.Width - 60)
$textBox15.Width = $($form.Width - 60)
$textBox16.Width = $($form.Width - 60)

#Label
$label1 = New-Object System.Windows.Forms.label
$label2 = New-Object System.Windows.Forms.label
$label3 = New-Object System.Windows.Forms.label
$label4 = New-Object System.Windows.Forms.label
$label5 = New-Object System.Windows.Forms.label
$label6 = New-Object System.Windows.Forms.label
$label7 = New-Object System.Windows.Forms.label
$label8 = New-Object System.Windows.Forms.label
$label9 = New-Object System.Windows.Forms.label
$label10 = New-Object System.Windows.Forms.label
$label11 = New-Object System.Windows.Forms.label
$label12 = New-Object System.Windows.Forms.label
$label13 = New-Object System.Windows.Forms.label
$label14 = New-Object System.Windows.Forms.label
$label15 = New-Object System.Windows.Forms.label
$label16 = New-Object System.Windows.Forms.label

$label1.Text ="blue"
$label2.Text ="cyan"
$label3.Text ="green"
$label4.Text ="gray"
$label5.Text ="magenta"
$label6.Text ="red"
$label7.Text ="yellow"
$label8.Text ="darkblue"
$label9.Text ="darkcyan"
$label10.Text ="darkgreen"
$label11.Text ="darkgray"
$label12.Text ="darkmagenta"
$label13.Text ="darkred"
$label14.Text ="darkyellow"
$label15.Text ="notify"
$label16.Text ="filter"

$label1.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label2.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label3.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label4.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label5.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label6.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label7.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label8.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label9.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label10.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label11.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label12.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label13.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label14.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label15.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 
$label16.Anchor =([System.Windows.Forms.AnchorStyles]::Left) 

$label1.Autosize = $true 
$label2.Autosize = $true 
$label3.Autosize = $true 
$label4.Autosize = $true 
$label5.Autosize = $true 
$label6.Autosize = $true 
$label7.Autosize = $true 
$label8.Autosize = $true 
$label9.Autosize = $true 
$label10.Autosize = $true 
$label11.Autosize = $true 
$label12.Autosize = $true 
$label13.Autosize = $true 
$label14.Autosize = $true 
$label15.Autosize = $true 
$label16.Autosize = $true 

$label1.Top = 5 
$label2.Top = 25 
$label3.Top = 45 
$label4.Top = 65 
$label5.Top = 85 
$label6.Top = 105 
$label7.Top = 125 
$label8.Top = 145 
$label9.Top = 165 
$label10.Top = 185 
$label11.Top = 205 
$label12.Top = 225 
$label13.Top = 245 
$label14.Top = 265 
$label15.Top = 305 
$label16.Top = 325 

$label1.Left = 20
$label2.Left = 20
$label3.Left = 20
$label4.Left = 20
$label5.Left = 20
$label6.Left = 20
$label7.Left = 20
$label8.Left = 20
$label9.Left = 20
$label10.Left = 20
$label11.Left = 20
$label12.Left = 20
$label13.Left = 20
$label14.Left = 20
$label15.Left = 20
$label16.Left = 20

$label1.Width = 100
$label2.Width = 100
$label3.Width = 100
$label4.Width = 100
$label5.Width = 100
$label6.Width = 100
$label7.Width = 100
$label8.Width = 100
$label9.Width = 100
$label10.Width = 100
$label11.Width = 100
$label12.Width = 100
$label13.Width = 100
$label14.Width = 100
$label15.Width = 100
$label16.Width = 100

#StatusBar
$statusBar = New-Object System.Windows.Forms.StatusBar
$statusBar.Text = "Ready"


### Add controls to form ###
$form.SuspendLayout()
#$form.Controls.Add($clearButton)
#$form.Controls.Add($label)
$form.Controls.Add($textBox1)
$form.Controls.Add($textBox2)
$form.Controls.Add($textBox3)
$form.Controls.Add($textBox4)
$form.Controls.Add($textBox5)
$form.Controls.Add($textBox6)
$form.Controls.Add($textBox7)
$form.Controls.Add($textBox8)
$form.Controls.Add($textBox9)
$form.Controls.Add($textBox10)
$form.Controls.Add($textBox11)
$form.Controls.Add($textBox12)
$form.Controls.Add($textBox13)
$form.Controls.Add($textBox14)
$form.Controls.Add($textBox15)
$form.Controls.Add($textBox16)

$form.Controls.Add($label1)
$form.Controls.Add($label2)
$form.Controls.Add($label3)
$form.Controls.Add($label4)
$form.Controls.Add($label5)
$form.Controls.Add($label6)
$form.Controls.Add($label7)
$form.Controls.Add($label8)
$form.Controls.Add($label9)
$form.Controls.Add($label10)
$form.Controls.Add($label11)
$form.Controls.Add($label12)
$form.Controls.Add($label13)
$form.Controls.Add($label14)
$form.Controls.Add($label15)
$form.Controls.Add($label16)

$form.ResumeLayout()
#endregion form

### Write event handlers ###


$form_FormClosed = {
	try
    {
        $listBox.remove_Click($exportButton_Click)
		$listBox.remove_DragOver($listBox_DragOver)
		$listBox.remove_DragDrop($listBox_DragDrop)
        $listBox.remove_DragDrop($listBox_DragDrop)
		$form.remove_FormClosed($Form_Cleanup_FormClosed)
	}
	catch [Exception]
    { }
}

### Wire up events ###


$form.Add_FormClosed($form_FormClosed)

#### Show form ###

[void] $form.ShowDialog()
