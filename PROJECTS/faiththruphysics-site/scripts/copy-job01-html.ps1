param(
  [string]$OutRoot = 'E:\Site\_staging\JOB-01-html-aggregation-20260726',
  [switch]$Resume
)

$ErrorActionPreference = 'Continue'

$copyRoot = Join-Path $OutRoot 'copies'
$inventoryDir = Join-Path $OutRoot 'inventory'
$candidatePath = Join-Path $inventoryDir 'html-candidate-paths.txt'
$inventoryCsv = Join-Path $inventoryDir 'html-inventory.csv'
$errorsCsv = Join-Path $inventoryDir 'copy-errors.csv'

New-Item -ItemType Directory -Force -Path $copyRoot, $inventoryDir | Out-Null

$roots = @(
  @{ Prefix = '\\192.168.2.50\h_hp\Desktop\Folders\Master HTML'; Id = 'H_Desktop_Folders_Master_HTML' },
  @{ Prefix = '\\192.168.2.50\h_hp\Desktop\$RECYCLE.BIN'; Id = 'H_Desktop_RecycleBin' },
  @{ Prefix = '\\192.168.2.50\h_hp\Desktop'; Id = 'H_Desktop' },
  @{ Prefix = 'D:\GitHub\faiththruphysics-site-live'; Id = 'D_GitHub_faiththruphysics-site-live' },
  @{ Prefix = 'D:\GitHub\faiththruphysics-site-v2'; Id = 'D_GitHub_faiththruphysics-site-v2' },
  @{ Prefix = 'D:\GitHub\faiththruphysics-site-data'; Id = 'D_GitHub_faiththruphysics-site-data' },
  @{ Prefix = 'D:\GitHub\genesis-to-quantum'; Id = 'D_GitHub_genesis-to-quantum' },
  @{ Prefix = 'E:\Faith Through Physics'; Id = 'E_Faith_Through_Physics' },
  @{ Prefix = 'E:\#recycle'; Id = 'E_recycle' }
) | Sort-Object { $_.Prefix.Length } -Descending

function CsvEscape([object]$Value) {
  if ($null -eq $Value) { return '""' }
  $s = [string]$Value
  return '"' + $s.Replace('"', '""') + '"'
}

$processed = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

if ($Resume -and (Test-Path -LiteralPath $inventoryCsv)) {
  Import-Csv -LiteralPath $inventoryCsv | ForEach-Object {
    if ($_.SourcePath) { [void]$processed.Add($_.SourcePath) }
  }
}
else {
  if (Test-Path -LiteralPath $inventoryCsv) { Remove-Item -LiteralPath $inventoryCsv -Force }
  if (Test-Path -LiteralPath $errorsCsv) { Remove-Item -LiteralPath $errorsCsv -Force }

  '"SourceRoot","SourcePath","CopiedPath","FileName","SizeBytes","LastWriteTime","SHA256","RootId","RelativePath"' |
    Set-Content -Encoding UTF8 -Path $inventoryCsv
  '"SourcePath","Error"' |
    Set-Content -Encoding UTF8 -Path $errorsCsv
}

if (-not (Test-Path -LiteralPath $errorsCsv)) {
  '"SourcePath","Error"' | Set-Content -Encoding UTF8 -Path $errorsCsv
}

$paths = [System.IO.File]::ReadAllLines($candidatePath)
$total = $paths.Count
$i = 0
$ok = 0
$fail = 0
$utf8NoBom = [System.Text.UTF8Encoding]::new($false)

foreach ($src in $paths) {
  $i++
  try {
    if ($processed.Contains($src)) { continue }
    if (-not (Test-Path -LiteralPath $src)) { throw 'missing source' }

    $rootMatch = $null
    foreach ($r in $roots) {
      if ($src.StartsWith($r.Prefix + '\', [System.StringComparison]::OrdinalIgnoreCase)) {
        $rootMatch = $r
        break
      }
    }
    if ($null -eq $rootMatch) { throw 'no root mapping' }

    $rel = $src.Substring($rootMatch.Prefix.Length + 1)
    $dest = Join-Path (Join-Path $copyRoot $rootMatch.Id) $rel
    $item = Get-Item -LiteralPath $src
    $hash = (Get-FileHash -LiteralPath $src -Algorithm SHA256).Hash
    if ($dest.Length -gt 240) {
      $flatNameBase = [System.IO.Path]::GetFileNameWithoutExtension($item.Name)
      $flatNameBase = $flatNameBase -replace '[<>:"/\\|?*]', '_'
      if ($flatNameBase.Length -gt 80) { $flatNameBase = $flatNameBase.Substring(0, 80) }
      $flatName = "$($hash.Substring(0, 16))-$flatNameBase$($item.Extension)"
      $dest = Join-Path (Join-Path (Join-Path $copyRoot $rootMatch.Id) '__long_path_flat') $flatName
    }
    $destDir = Split-Path -Parent $dest
    if (-not (Test-Path -LiteralPath $destDir)) {
      New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    }

    Copy-Item -LiteralPath $src -Destination $dest -Force

    $line = @(
      $rootMatch.Prefix,
      $src,
      $dest,
      $item.Name,
      $item.Length,
      $item.LastWriteTime.ToString('s'),
      $hash,
      $rootMatch.Id,
      $rel
    ) | ForEach-Object { CsvEscape $_ }
    [System.IO.File]::AppendAllText($inventoryCsv, (($line -join ',') + [Environment]::NewLine), $utf8NoBom)
    $ok++
  }
  catch {
    $eline = @($src, $_.Exception.Message) | ForEach-Object { CsvEscape $_ }
    [System.IO.File]::AppendAllText($errorsCsv, (($eline -join ',') + [Environment]::NewLine), $utf8NoBom)
    $fail++
  }

  if (($i % 1000) -eq 0) {
    Write-Host "PROGRESS $i / $total copied=$ok failed=$fail"
  }
}

Write-Host "COPY_DONE`t$total`t$ok`t$fail"
Write-Host "INVENTORY`t$inventoryCsv"
Write-Host "ERRORS`t$errorsCsv"
