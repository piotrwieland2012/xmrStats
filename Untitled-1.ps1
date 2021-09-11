$Form1.Text='MINING STATS'
$TableLayoutPanel1_Paint = {
}
$RichTextBox1_TextChanged = {
}
$DataGridView1_CellContentClick = {
}
$Form1_Enter = {
    $Button1.Text="Pobierz"
}
$TextBox1_Enter = {
    $Button1.Text="Sync"
}
$TextBox1_TextChanged = {
    }
$Button1_Click = {

    $KEY=$TextBox1.Text
    $Button1.Text = "Pobieram"
    $response = Invoke-RestMethod minexmr.com/api/pool/get_wid_stats?address=$KEY -Method 'GET' -Headers $headers
$response1 = Invoke-RestMethod 'https://api.binance.com/api/v3/ticker/price?symbol=XMRUSDT' -Method 'GET' -Headers $headers1
$response3 = Invoke-RestMethod 'https://api.coinpaprika.com/v1/price-converter?base_currency_id=xmr-monero&quote_currency_id=pln-polish-zloty&amount=1' -Method 'GET' -Headers $headers3
$BALANCE=$response.balance.Get(8)
$BALDIVIDED=$BALANCE /1000000000000
$PRIC=$response3.price
$PRICE=[math]::Round($PRIC,2)
$SUM=$BALDIVIDED * $PRICE
$STAN=[math]::Round($SUM,2)



$Label1.Text=$BALDIVIDED
$Label2.Text=$PRICE
$Label3.Text=$STAN
$PRICE | Out-File ./stats.txt
$Button1.Text="Pobrano"
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'untitled-1.designer.ps1')
$Form1.ShowDialog()