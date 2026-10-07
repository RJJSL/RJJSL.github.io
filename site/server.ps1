# 本地预览服务器 — 在 site 文件夹启动静态网站
# 用法: 右键"使用 PowerShell 运行"，或 PowerShell 中执行 .\server.ps1
# 然后浏览器打开 http://localhost:8000
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$types = @{
  ".html" = "text/html; charset=utf-8"
  ".js"   = "text/javascript"
  ".mjs"  = "text/javascript"
  ".css"  = "text/css"
  ".svg"  = "image/svg+xml"
  ".exr"  = "application/octet-stream"
  ".fbx"  = "application/octet-stream"
  ".mp4"  = "video/mp4"
  ".webm" = "video/webm"
  ".png"  = "image/png"
  ".jpg"  = "image/jpeg"
  ".jpeg" = "image/jpeg"
  ".gif"  = "image/gif"
  ".webp" = "image/webp"
  ".json" = "application/json"
  ".pdf"  = "application/pdf"
  ".md"   = "text/plain; charset=utf-8"
  ".txt"  = "text/plain; charset=utf-8"
}
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8000/")
$listener.Start()
Write-Host "服务器已启动: http://localhost:8000  (按 Ctrl+C 停止)"
try {
  while ($listener.IsListening) {
    $ctx = $listener.GetContext()
    $path = $ctx.Request.Url.AbsolutePath
    if ($path -eq "/") { $path = "/index.html" }
    $file = Join-Path $root ($path -replace "/", "\")
    if ((Test-Path $file -PathType Leaf) -and ((Get-Item $file).FullName.StartsWith($root))) {
      $ext = [System.IO.Path]::GetExtension($file).ToLower()
      $mime = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
      $bytes = [System.IO.File]::ReadAllBytes($file)
      $ctx.Response.ContentType = $mime
      $ctx.Response.ContentLength64 = $bytes.Length
      $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
      $ctx.Response.StatusCode = 404
      $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
      $ctx.Response.ContentLength64 = $msg.Length
      $ctx.Response.OutputStream.Write($msg, 0, $msg.Length)
    }
    $ctx.Response.OutputStream.Close()
  }
} finally {
  $listener.Stop()
}
