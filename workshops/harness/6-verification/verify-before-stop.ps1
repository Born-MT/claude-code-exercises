# Stop hook, PowerShell version, for machines where hooks run without Git Bash.
# Exit 2 blocks the stop, and Claude gets stderr as the reason to keep going.

$CheckCommand = '<check command>'   # e.g. pnpm typecheck && pnpm test (runs under cmd)

$hookInput = [Console]::In.ReadToEnd() | ConvertFrom-Json

# Already continuing because of this hook: let it stop, so a check that can't pass
# doesn't loop. Claude has had one more pass to fix it and must report the failure.
if ($hookInput.stop_hook_active) { exit 0 }

if ($env:CLAUDE_PROJECT_DIR) { Set-Location $env:CLAUDE_PROJECT_DIR }

# Nothing changed in the working tree: nothing to verify.
$changes = git status --porcelain 2>$null
if (-not $changes) { exit 0 }

$output = cmd /c "$CheckCommand 2>&1"
if ($LASTEXITCODE -ne 0) {
    [Console]::Error.WriteLine('The checks failed. Fix the code, not the tests, then finish.')
    [Console]::Error.WriteLine("If you can't make them pass, stop and say what's failing.")
    [Console]::Error.WriteLine('')
    [Console]::Error.WriteLine((($output | Select-Object -Last 40) -join "`n"))
    exit 2
}

exit 0
