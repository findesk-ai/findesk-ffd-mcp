# Troubleshooting

## Tools Do Not Appear

Restart the AI client after installation. Then ask the agent to call `ffd_health`.

## Python Missing

macOS / Linux:

```bash
python3 --version || python --version
```

Windows:

```powershell
python --version
```

## API Key Missing

Register at [www.findesk.cn/register](https://www.findesk.cn/register), then rerun the installer. Enter the API Key only in your local terminal prompt.

## Trial Expired Or Quota Exhausted

Log in to Findesk and renew or upgrade your subscription. The local MCP server cannot bypass server-side trial, quota, or report-download limits.
