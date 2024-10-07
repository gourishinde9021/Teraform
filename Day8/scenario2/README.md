1. Drift Detection - if there are any manual changes, it creates a drift in tfstate file. Run this command as a cron job.

    terraform refresh

2. Setup cloudwatch and lambda function to monitor tfstate file.
