# GitHub Username Availability Checker

This PowerShell script periodically checks the availability of specified GitHub usernames and sends notifications when a username becomes available. It's particularly useful for users looking to acquire a specific GitHub username that is currently taken, typically by abandoned accounts.

## ✨ Features

- Check an array of usernames for availability
- Read usernames from a plain text file
- Send desktop notifications when an username becomes available

## 📋 Requirements

- [BurntToast](https://github.com/Windos/BurntToast) module for notifications
- Internet access to check GitHub usernames and profiles

## ⚙ Installation

### 1. Clone this repository
```bash
git clone https://github.com/AggroTheShark/gh-username-checker.git
cd gh-username-checker
```

### 2. Install the _BurnToast_ module
```powershell
Install-Module -Name BurntToast
```

### 3. Prepare your usernames file

Fill in the content of the `usernames.txt` file to include a list of all usernames you want to check, each one on a different line.

**Example:**
```
username-1
username-2
yet-another-username
```

## 💻 Usage

To run this script manually, execute it from a PowerShell terminal in the installation directory:

```powershell
.\gh-username-checker.ps1
```

## ⏰ Scheduling as a Periodic Task

To automatically run the script daily, you can set it up as a scheduled task in Windows by following these steps:

### 1. Open Task Scheduler
* Press `Windows-R`, type `taskschd.msc`, and hit Enter.

### 2. Create a New Task
* Click on "Create Basic Task" on the right side.
* Name your task (e.g., "GitHub Username Checker") and click "Next".

### 3. Set the Trigger
* Choose "Daily" and click "Next".
* Set the start time and recurrence, then click "Next".

### 4. Set the Action
* Choose "Start a program" and click "Next".
* In the "Program/script" field, enter the path to `powershell.exe` (usually `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`).
* In the "Add arguments" field, enter the following (replace the path with your actual script path):
```powershell
-WindowStyle Hidden -File "C:\Path\To\gh-username-checker\gh-username-checker.ps1"
```

### 5. Finish
Review the settings and click "Finish".

Your script will now run daily at the specified time. You can also customize the reccurence to make it run after each hour, for example.

## ⚖ License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

If you reuse this project in your own work, I would appreciate a mention. Your support helps promote collaboration and acknowledges the contributions made. Thank you! ♥

## ⭐ Enjoying This Project?

If you found this project useful or interesting, please consider giving it a star! Your support helps motivate me to continue improving and updating the project. Thank you for your interest!