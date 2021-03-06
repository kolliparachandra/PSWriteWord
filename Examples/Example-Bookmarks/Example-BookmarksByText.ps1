﻿Import-Module PSWriteWord #-Force

### Before running this script make sure to run Example-CreateWord first
$FilePathTemplate = "$PSScriptRoot\Templates\CV-WithTextReplacement.docx"

$WordDocument = Get-WordDocument -FilePath $FilePathTemplate

foreach ($Paragraph in $WordDocument.Paragraphs) {
    # You can display text as seen by PSWriteWord
    $Paragraph.Text
    # Case sensitive
    $Paragraph.ReplaceText('Job Title', 'CEO of EVOTEC')
    $Paragraph.ReplaceText('School Name 1st', 'Oh my school')
    $Paragraph.ReplaceText('School Name 2nd', 'Oh my school 2')
    # While word shows NAME HERE, actually it's Name HERE
    $Paragraph.ReplaceText('Name HERE', 'Przemysław Kłys')
    $Paragraph.ReplaceText('PHONE_NUMBER', '+48 500 500 500')
}

Save-WordDocument -WordDocument $WordDocument -FilePath "$PSSCriptRoot\Output\CV-WithReplacedText.docx" -OpenDocument -Supress $true