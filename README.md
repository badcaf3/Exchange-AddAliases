# Add-EmailAliases

## Description
This PowerShell script connects to Exchange Online and adds email aliases to a specified mailbox. It reads aliases from a text file and checks if each alias already exists before attempting to add it. The script provides detailed status messages for each alias, indicating whether it was added successfully, already exists, or failed to be added. This ensures that administrators can efficiently manage email aliases without duplicating existing entries.

## Features
- Connects to Exchange Online using modern authentication.
- Reads email aliases from a specified text file.
- Checks for existing aliases to avoid duplicates.
- Provides detailed status messages for each alias.
- Displays a final summary indicating the overall success of the operation.

## Prerequisites
- PowerShell 5.1 or later.
- Exchange Online Management module.
- An Exchange Online account with the necessary permissions to add aliases.

## Installation
1. **Install the Exchange Online Management module**:
    ```powershell
    Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber
    ```

2. **Clone or download this repository**:
    ```bash
    git clone https://github.com/yourusername/Add-EmailAliases.git
    ```

## Usage
1. **Open PowerShell** and navigate to the directory containing the script.
    ```powershell
    cd path\to\Add-EmailAliases
    ```

2. **Run the script**:
    ```powershell
    .\add-aliases.ps1
    ```
