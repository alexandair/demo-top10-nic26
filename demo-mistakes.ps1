<#
.SYNOPSIS
    Top 10 Mistakes to Avoid in Entra ID Management with Graph PowerShell
    
.DESCRIPTION
    This demo script demonstrates common mistakes when managing Microsoft Entra ID
    with Microsoft Graph PowerShell SDK and shows the correct approaches.
    
    Each mistake is contained in a separate file (mistake1.ps1 through mistake10.ps1)
    that can be executed independently using F8 (Run Selection) in VS Code.
    
.NOTES
    Demo for NIC26 Session

#>

# Ensure we're connected to Microsoft Graph
if (-not (Get-MgContext)) {
    Write-Host "Connecting to Microsoft Graph..."
    Connect-MgGraph
}

# Mistake 1: Over-privileged app permissions / not following least-privilege
# File: mistake1.ps1 - Demonstrates permission scoping and least-privilege principles
# Key: Use minimum required permissions, prefer specific scopes over broad ones
code mistake1.ps1


# Mistake 2: Not handling paging (@odata.nextLink) for large result sets
# File: mistake2.ps1 - Shows proper pagination handling with nextLink
# Key: Always loop through @odata.nextLink to get complete datasets
code mistake2.ps1

# Mistake 3: Not handling throttling (HTTP 429) or retries correctly
# File: mistake3.ps1 - Implements proper retry logic with exponential backoff
# Key: Respect Retry-After headers and implement exponential backoff
code mistake3-simple.ps1


# Mistake 4: Not using $select and $filter (pulling everything)
# File: mistake4.ps1 - Demonstrates query optimization with select and filter
# Key: Use server-side filtering and property selection to reduce payload
code mistake4.ps1


# Mistake 5: Confusing delegated vs application permissions
# File: mistake5.ps1 - Explains permission types and authentication methods
# Key: Use delegated for user context, application for daemon/service scenarios
code mistake5.ps1


# Mistake 6: Not keeping the Microsoft Graph PowerShell SDK up to date and assuming old AzureAD cmdlet behavior
# File: mistake6.ps1 - Demonstrates SDK version management and AzureAD migration issues
# Key: Pin SDK versions, understand behavioral differences from AzureAD module, use explicit scopes
code mistake6.ps1


# Mistake 7: Using beta endpoint in production
# File: mistake7.ps1 - Shows version management and v1.0 vs beta differences
# Key: Use v1.0 for production, beta only for testing with proper fallbacks
code mistake7.ps1


# Mistake 8: Misusing batching (thinking it avoids throttling)
# File: mistake8.ps1 - Shows proper batching patterns and limitations
# Key: Batching reduces latency but doesn't avoid throttling; handle sub-responses
code mistake8.ps1


# Mistake 9: Relying on mutable/display properties instead of immutable object IDs
# File: mistake9.ps1 - Shows why object IDs are essential for reliable automation
# Key: Store and use immutable object IDs, validate uniqueness for display names
code mistake9.ps1


# Mistake 10: Storing credentials insecurely (not using managed identity/service principals)
# File: mistake10.ps1 - Covers secure secret handling and certificate authentication
# Key: Use managed identities, certificates, or Key Vault for credential management
code mistake10.ps1
