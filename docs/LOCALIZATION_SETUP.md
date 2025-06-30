# 🌍 Localization Setup Guide

This guide will help you set up Google Sheets integration for managing translations in the Saucerer Flutter app.

## 📋 Prerequisites

- Google Account
- Google Cloud Console access
- GitHub repository with admin access

## 🚀 Step-by-Step Setup

### Step 1: Create Google Sheets Document

1. **Create a new Google Sheets document**
   - Go to [Google Sheets](https://sheets.google.com)
   - Create a new spreadsheet
   - Name it: "Saucerer App Translations"

2. **Set up the spreadsheet structure**
   - Copy the content from `docs/localization_template.csv`
   - Paste it into your Google Sheets (starting from cell A1)
   - The spreadsheet should have these columns:
     ```
     Key | Korean (ko) | English (en) | Japanese (ja) | Context | Status | Last Modified | Notes
     ```

3. **Make the spreadsheet publicly viewable**
   - Click "Share" button (top right)
   - Click "Change to anyone with the link"
   - Set permission to "Viewer"
   - Copy the sharing link

4. **Extract the Sheet ID**
   - From the sharing link: `https://docs.google.com/spreadsheets/d/SHEET_ID_HERE/edit`
   - Copy the `SHEET_ID_HERE` part (long string of characters)
   - Example: `1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms`

### Step 2: Set up Google Cloud Console (API Key Method)

> **Note**: We're using API Key method for simplicity. For production, consider using Service Account authentication.

1. **Create a Google Cloud Project**
   - Go to [Google Cloud Console](https://console.cloud.google.com)
   - Create a new project or select existing one
   - Project name: "Saucerer Translations" (or any name you prefer)

2. **Enable Google Sheets API**
   - Go to "APIs & Services" > "Library"
   - Search for "Google Sheets API"
   - Click on it and press "Enable"

3. **Create API Key**
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "API Key"
   - Copy the generated API key
   - **Important**: Restrict the API key for security:
     - Click "Restrict Key"
     - Under "API restrictions", select "Restrict key"
     - Choose "Google Sheets API"
     - Under "Application restrictions", choose "HTTP referrers" or "None" for testing
     - Save the restrictions

### Step 3: Configure GitHub Repository

1. **Add Repository Secrets**
   - Go to your GitHub repository
   - Navigate to "Settings" > "Secrets and variables" > "Actions"
   - Click "New repository secret" and add:

   ```
   Name: GOOGLE_SHEETS_API_KEY
   Value: your_api_key_from_step_2
   ```

   ```
   Name: GOOGLE_SHEETS_ID
   Value: your_sheet_id_from_step_1
   ```

2. **Verify GitHub Actions permissions**
   - Go to "Settings" > "Actions" > "General"
   - Under "Workflow permissions", ensure:
     - "Read and write permissions" is selected
     - "Allow GitHub Actions to create and approve pull requests" is checked

### Step 4: Test the Setup

1. **Manual test using Dart script**
   ```bash
   # Set environment variable
   export GOOGLE_SHEETS_API_KEY="your_api_key_here"
   
   # Run dry-run test
   cd your_project_directory
   flutter pub get
   dart scripts/update_translations.dart --dry-run YOUR_SHEET_ID
   ```

2. **Test GitHub Actions workflow**
   - Go to "Actions" tab in your GitHub repository
   - Find "Update Translations from Google Sheets" workflow
   - Click "Run workflow"
   - Select "dry_run: true" for testing
   - Click "Run workflow"

## 📝 Daily Workflow

### For Translators/Content Managers

1. **Edit translations in Google Sheets**
   - Open your Google Sheets document
   - Edit translations in the Korean, English, or Japanese columns
   - Set "Status" to "approved" for completed translations
   - Add context and notes as needed

2. **Automatic updates**
   - GitHub Actions will run daily at 9 AM KST
   - If changes are detected, a PR will be automatically created
   - Review and merge the PR to apply changes

### For Developers

1. **Manual update** (if needed)
   ```bash
   # Update translations immediately
   export GOOGLE_SHEETS_API_KEY="your_api_key"
   dart scripts/update_translations.dart YOUR_SHEET_ID
   
   # Generate Flutter localizations
   flutter gen-l10n
   ```

2. **Adding new translation keys**
   - Add new rows to the Google Sheets
   - Include all language translations
   - Set status to "approved"
   - The next automatic update will include them

## 🔧 Configuration Options

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `GOOGLE_SHEETS_API_KEY` | Your Google Sheets API key | Yes |
| `GOOGLE_SHEETS_ID` | Default sheet ID to use | Optional |

### Script Options

```bash
# Basic usage
dart scripts/update_translations.dart SHEET_ID

# Dry run (preview only)
dart scripts/update_translations.dart --dry-run SHEET_ID

# Help
dart scripts/update_translations.dart --help
```

### GitHub Actions Inputs

| Input | Description | Default |
|-------|-------------|---------|
| `sheet_id` | Override default sheet ID | Uses `GOOGLE_SHEETS_ID` secret |
| `dry_run` | Preview changes without committing | `false` |

## 🚨 Troubleshooting

### Common Issues

1. **"API key not found" error**
   - Verify `GOOGLE_SHEETS_API_KEY` environment variable is set
   - Check that the API key is valid and not expired

2. **"Sheet not accessible" error**
   - Ensure the Google Sheets document is publicly viewable
   - Verify the sheet ID is correct
   - Check that Google Sheets API is enabled in Google Cloud Console

3. **"Permission denied" error in GitHub Actions**
   - Verify repository secrets are set correctly
   - Check GitHub Actions permissions in repository settings

4. **"No changes detected" when you expect changes**
   - Ensure translations have "approved" status in the spreadsheet
   - Check that column headers match expected format
   - Verify non-empty translations exist

### Debug Mode

Run with verbose output:
```bash
export GOOGLE_SHEETS_API_KEY="your_key"
dart scripts/update_translations.dart --dry-run YOUR_SHEET_ID
```

This will show detailed information about:
- Downloaded data
- Parsed translations
- Generated content
- Any errors or warnings

## 🔒 Security Best Practices

1. **API Key Security**
   - Never commit API keys to version control
   - Use GitHub Secrets for storing sensitive data
   - Regularly rotate API keys
   - Restrict API key permissions to only necessary APIs

2. **Spreadsheet Access**
   - Keep spreadsheet as "view-only" for public access
   - Use specific sharing links rather than making fully public
   - Consider using Service Account authentication for production

3. **GitHub Actions**
   - Review auto-generated PRs before merging
   - Use branch protection rules
   - Monitor workflow runs for suspicious activity

## 📊 Monitoring

### GitHub Actions Dashboard
- Monitor workflow runs in the "Actions" tab
- Check for failed runs and error messages
- Review auto-generated PRs for accuracy

### Translation Status
- Use the "Status" column in Google Sheets to track progress
- "draft" - Work in progress
- "review" - Ready for review
- "approved" - Ready for production

## 🎯 Next Steps

After setup is complete, you can:

1. **Migrate existing hardcoded strings** to use the new localization system
2. **Add more languages** by adding columns to the spreadsheet
3. **Set up automated testing** for translation completeness
4. **Configure deployment** to automatically use updated translations

For implementation help, see the main project documentation.