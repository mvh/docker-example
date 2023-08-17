from datetime import datetime

from flask import Flask, render_template
import os

app = Flask(__name__)


@app.route('/')
def home():
    date = datetime.now()
    now = date.strftime("%a, %m-%d-%y %H:%M:%S UTC")
    return render_template('index.html',
                           date = now)

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 8080))
    app.run(debug=True, host='0.0.0.0', port=port)
