# Activation

FFD MCP requires a Findesk API Key because trial rights, data points, research-report downloads, global-news access, and subscription status are controlled on the server side.

## New User Flow

1. Register at [www.findesk.cn/register](https://www.findesk.cn/register).
2. Receive the current public trial package:
   - 3-day trial
   - 50,000 data points
   - 5 research-report downloads
   - 3-day global-news access
3. Run the installer from this repository.
4. Enter your Findesk API Key in the local terminal prompt.
5. Restart your AI client.
6. Ask the agent to call `ffd_health`.

Do not paste your API Key into an AI chat.

## Existing User Flow

Rerun the installer. It will reuse `~/.ffd/mcp-config.json` when an existing local `FFD_API_KEY` is present.

## Why Not Anonymous Trial

FFD includes high-cost capabilities such as research-report downloads and global news. Anonymous full-access trials are easy to abuse. Account-bound trials keep the onboarding smooth while protecting the service and preserving the path from trial to subscription.
