# Security

This public repository is an onboarding and installation layer for FFD MCP.

## Never Commit

- user API Keys
- upstream credentials, cookies, tokens, or accounts
- internal service credentials
- production logs
- database schemas
- private endpoint maps
- local files under `~/.ffd`
- private billing or quota logic

## Public Boundary

The local MCP process only stores the user's own Findesk API Key and calls the official FFD API gateway. Trial rights, subscription status, data-point deduction, report-download quota, global-news entitlement, and abuse prevention are enforced by the server.

## Reporting Issues

If you suspect a leak, do not open a public issue with secrets. Contact Findesk support through the official website and include only non-sensitive reproduction steps.
