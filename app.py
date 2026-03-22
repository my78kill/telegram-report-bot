from flask import Flask
import threading
import subprocess
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "Bot is running ✅"

def run_bot():
    # DEBUG: bot folder ke files print karega
    print("BOT FILES:", os.listdir("/app/bot"))
    
    subprocess.run(["python", "-m", "bot"])

if __name__ == "__main__":
    threading.Thread(target=run_bot, daemon=True).start()
    
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 10000)))
