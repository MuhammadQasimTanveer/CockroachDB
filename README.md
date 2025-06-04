# CockroachDB Project

A simple CockroachDB setup for learning, local deployment, and experimentation with SQL queries.

📦 **Download Installation File**  
[Click here to download](https://github.com/MuhammadQasimTanveer/CockroachDB/releases/tag/cockroachdb-v-25)

---

## 💻 How to Install & Run on Windows (Using PowerShell)

### 🔧 Step 1:  
Open **PowerShell** as **Administrator**.

### 📁 Step 2:  
Navigate to the directory containing your `cockroach.exe` file.

### 📈 Step 3:  
Run the following command to start a single-node cluster:

```powershell
.\cockroach.exe start-single-node --insecure --listen-addr=127.0.0.1:26257 --http-addr=127.0.0.1:8080
